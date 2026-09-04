# Read one reverse dependency's two check halves back, compare them, and
# append the package's manifest line.
#
# queue.sh runs the halves (check-half.sh, one container each) and then this,
# one process per package. The split is deliberate: the bash side owns
# claiming, containers and clocks; everything that needs R -- parsing a
# 00check.log, `compare_checks()`, the manifest line -- lives here, in the
# same shared code (revdepx/compare.R) the pair engine uses, so the two
# engines cannot drift in how they read a check.
#
# A crash here is one package's problem: queue.sh catches the nonzero exit,
# re-runs this script with --error to write a plain error line, and falls
# back to a hardcoded JSON line if even that fails. So: exit 0 on every
# handled path, and let a genuine R error exit nonzero rather than papering
# over it.
#
# Arguments, all as `--key value` pairs:
#
#   --name          package name (required)
#   --manifest      manifest.ndjson to append to (required; the lock is
#                   <manifest>.lock, shared with every other writer)
#   --workdir       the package's check workdir, holding old/ and new/
#   --version       version actually checked (the tarball's); "" keeps the
#                   plan's
#   --pkgs-dir      results pkgs/ directory, for rds and salvage output
#                   (default: pkgs/ next to the manifest)
#   --baseline-dir  baseline artifact directory; "" or absent = no baseline
#   --plan          plan.json, for the package's metadata (default: plan.json)
#   --shard         shard index (default: 0)
#   --timeout       per-half timeout in seconds, for the timeout messages
#   --t-old         old half's wall seconds as queue.sh measured them
#   --t-new         new half's wall seconds
#   --cran-version  what the prepare phase installed as the old igraph
#   --dev-version   ... and as the new one
#   --error MSG     write an `error` line carrying MSG and do nothing else
#                   (queue.sh's second rung, before its printf fallback)

script_dir <- dirname(sub(
  "--file=",
  "",
  grep("^--file=", commandArgs(), value = TRUE)
))
revdepx_dir <- file.path(script_dir, "..", "revdepx")
source(file.path(revdepx_dir, "util.R"))
source(file.path(revdepx_dir, "compare.R"))

# ------------------------------------------------------------------- argv ---

args <- commandArgs(trailingOnly = TRUE)
opt <- list()
i <- 1L
while (i <= length(args)) {
  key <- args[[i]]
  if (!startsWith(key, "--") || i == length(args)) {
    stop("expected --key value pairs, got: ", key)
  }
  opt[[substring(key, 3L)]] <- args[[i + 1L]]
  i <- i + 2L
}
req <- function(key) {
  value <- opt[[key]] %||% ""
  if (!nzchar(value)) {
    stop("--", key, " is required")
  }
  value
}
num_or_na <- function(value) {
  value <- suppressWarnings(as.numeric(value %||% ""))
  if (length(value) == 1 && !is.na(value)) value else NA
}

name <- req("name")
manifest_path <- req("manifest")
shard_index <- as.integer(num_or_na(opt$shard))
if (is.na(shard_index)) {
  shard_index <- 0L
}
t_old <- num_or_na(opt[["t-old"]])
t_new <- num_or_na(opt[["t-new"]])
timeout_sec <- num_or_na(opt$timeout)
if (is.na(timeout_sec)) {
  timeout_sec <- 0
}
baseline_dir <- opt[["baseline-dir"]] %||% ""
pkgs_dir <- opt[["pkgs-dir"]] %||% file.path(dirname(manifest_path), "pkgs")
our_cran_version <- opt[["cran-version"]] %||% ""
our_dev_version <- opt[["dev-version"]] %||% ""

# ------------------------------------------------------------------ entry ---

# The package's plan metadata: version, level, weight, fingerprint, the
# baseline flag. Read defensively -- in --error mode this script may be
# running precisely because something around it is broken, and a line with
# defaults beats no line.
plan_pkg <- tryCatch(
  {
    plan <- read_json(opt$plan %||% "plan.json")
    found <- NULL
    for (s in plan$shards) {
      if (identical(as.integer(s$index %||% -1L), shard_index)) {
        for (p in s$packages) {
          if (identical(p$name, name)) {
            found <- p
          }
        }
      }
    }
    found
  },
  error = function(e) NULL
)

entry <- tryCatch(
  # Signature per the revdepx contract: (name, plan_pkg, shard_index), a NULL
  # plan_pkg yielding plan-less defaults.
  manifest_entry_defaults(name, plan_pkg, shard_index),
  error = function(e) NULL
)
if (!is.list(entry)) {
  # compare.R could not build the entry (or returned a surprise): fall back
  # to the same defaults shard.R initialises, so the line still carries every
  # schema field.
  entry <- list(
    package = name,
    version = plan_pkg$version %||% "",
    level = plan_pkg$level %||% 0L,
    shard = shard_index,
    weight_minutes = plan_pkg$weight_minutes %||% 0,
    t_total = plan_pkg$t_total %||% 0,
    dep_fingerprint = plan_pkg$dep_fingerprint %||% NA,
    baseline_planned = isTRUE(plan_pkg$baseline),
    baseline_agrees = NA,
    result = "deferred",
    status = "",
    status_old = "",
    status_new = "",
    new_issues = 0L,
    t_old = NA,
    t_new = NA,
    old_checked_at = NA,
    message = ""
  )
}
if (nzchar(opt$version %||% "")) {
  entry$version <- opt$version
}

apply_updates <- function(entry, updates) {
  # compare.R's functions return named lists of manifest-field updates; merge
  # only fields the entry knows, so an unexpected return shape cannot corrupt
  # the line.
  if (is.list(updates)) {
    keep <- intersect(names(updates), names(entry))
    entry[keep] <- updates[keep]
  }
  entry
}

finish <- function(entry) {
  # Queue semantics for the time fields, whatever the updates said: t_old and
  # t_new are the true per-half wall seconds queue.sh measured around each
  # check-half.sh call. The halves run one after the other here, unlike the
  # pair engine, whose halves share one wall clock and one number.
  entry$t_old <- t_old
  entry$t_new <- t_new
  # One write per package, at the very end, under the manifest lock (inside
  # write_manifest_line): the line appears whole or not at all, and queue.sh
  # covers "not at all".
  write_manifest_line(entry, manifest_path, our_cran_version, our_dev_version)
  quit(save = "no", status = 0L)
}

# ------------------------------------------------------------- error mode ---

if (!is.null(opt$error)) {
  # queue.sh's second rung: something already went wrong, usually this very
  # script a moment ago, so do the one thing that must not be skipped --
  # account for the package -- and nothing that could fail the same way
  # again.
  entry$result <- "error"
  entry$message <- opt$error
  finish(entry)
}

# ------------------------------------------------------------- the halves ---

work_dir <- req("workdir")

# read_side() (compare.R) parses a half back from its container's output:
# an rcmdcheck object, or an error condition, with the duration/timed_out/
# last_step attributes attached. Both halves always ran -- a stored old
# result is only ever a second opinion, applied inside compare_halves().
new <- read_side(work_dir, "new", name, timeout_sec, t_new)
old <- read_side(work_dir, "old", name, timeout_sec, t_old)

# A half that produced a result is kept even when its partner did not --
# the same dance as the pair engine, through the same functions.
if (inherits(new, "error")) {
  salvage_side(work_dir, pkgs_dir, name, "new")
  if (!inherits(old, "error")) {
    entry <- apply_updates(
      entry,
      keep_side(work_dir, pkgs_dir, name, "old", old)
    )
  } else {
    salvage_side(work_dir, pkgs_dir, name, "old")
  }
  entry <- apply_updates(entry, check_failure(name, "new", new))
  finish(entry)
}
if (inherits(old, "error")) {
  salvage_side(work_dir, pkgs_dir, name, "old")
  entry <- apply_updates(
    entry,
    keep_side(work_dir, pkgs_dir, name, "new", new)
  )
  entry <- apply_updates(entry, check_failure(name, "old", old))
  finish(entry)
}

# ------------------------------------------------------------- comparison ---

# compare.R owns everything from here to the verdict: the rds saves, the
# second-opinion drift check against the stored old result the plan offered,
# compare_checks(), the both-halves-depfail guard, classify_status(). One
# code path for both engines is the point of the extraction: the two cannot
# drift in how they read a check.
entry <- apply_updates(
  entry,
  compare_halves(
    name,
    old,
    new,
    pkgs_dir = pkgs_dir,
    baseline_dir = if (nzchar(baseline_dir)) baseline_dir else NULL,
    baseline_planned = isTRUE(entry$baseline_planned)
  )
)

inform(sprintf(
  "%s: %s (old %s, new %s, old %ds + new %ds)",
  name,
  entry$result,
  entry$status_old,
  entry$status_new,
  round(t_old),
  round(t_new)
))

# -------------------------------------------------------------- artifacts ---

# Salvage before the manifest line, but never at its expense: a failure while
# copying or diffing must not cost the package its line.
tryCatch(
  {
    if (identical(entry$result, "ok")) {
      # Nothing kept but the two rds; the whole check tree goes.
      unlink(work_dir, recursive = TRUE)
    } else {
      keep <- file.path(pkgs_dir, name, "new-check")
      new_rcheck <- file.path(work_dir, "new", paste0(name, ".Rcheck"))
      copy_check_output(new_rcheck, keep)
      old_log <- file.path(
        work_dir,
        "old",
        paste0(name, ".Rcheck"),
        "00check.log"
      )
      new_log <- file.path(new_rcheck, "00check.log")
      if (file.exists(old_log) && file.exists(new_log)) {
        diff <- check_diff(name, old_log, new_log, work_dir)
        writeLines(diff, file.path(keep, "00check.diff"))
        # Into the job log too, collapsed: what the dev version changed about
        # this package, in the package's own words, without downloading an
        # artifact. print_group writes to stderr, where Actions still folds
        # it; queue.sh keeps stdout for data.
        diff_max_lines <- env_num("REVDEPX_DIFF_MAX_LINES", 200)
        print_group(
          sprintf(
            "%s: old vs new check log (%d line diff)",
            name,
            length(diff)
          ),
          if (length(diff) == 0) {
            # A `newly_broken` whose logs are identical once the paths and
            # timings are out is this harness getting it wrong; worth a line.
            "The two logs are identical apart from paths and stage timings."
          },
          head(diff, diff_max_lines),
          if (length(diff) > diff_max_lines) {
            sprintf(
              "[%d more lines; the whole diff is 00check.diff in the shard artifact]",
              length(diff) - diff_max_lines
            )
          }
        )
      }
      unlink(work_dir, recursive = TRUE)
    }
  },
  error = function(e) {
    inform(
      name,
      ": salvage failed (",
      conditionMessage(e),
      "); the manifest line survives"
    )
  }
)

finish(entry)

# Fan-in for the revdepx workflow: merge every shard's results into one report, one
# manifest, and one baseline for future runs to reuse.
#
# Reads all revdepx-results-* artifacts (every attempt; on a re-run the later
# attempt wins per package), folds in the untouched results of the run being
# retried so the report is always complete, and writes:
#
#   revdep/README.md     summary, revdepcheck-style
#   revdep/problems.md   details for packages with new problems
#   revdep/failures.md   details for packages that could not be checked
#   revdep/cran.md       the paragraph for cran-comments.md
#   revdep/manifest.json one entry per package, machine-readable
#   revdep/pkgs/<p>/     old.rds, new.rds, kept new-version check output
#
# plus the baseline artifact content (baseline.json, old-rds/<p>.rds): every
# reusable old-version result of this run, stamped with the metadata the next
# plan compares against -- versions, R series, dependency fingerprint, and the
# date the old check *actually* ran (reuse does not refresh it),
# and timings.json: what the checks and the shards actually cost, which is what
# the next plan calibrates its cost model with instead of guessing.
#
# Environment variables:
#   RESULTS_DIR  - directory the shard artifacts were downloaded into (required)
#   PLAN         - plan.json (default: plan.json)
#   RETRY_DIR    - the revdepx-report artifact of the run being retried, if
#                  any -- a run of either workflow, since both publish it
#   OUT_DIR      - report directory (default: revdep)
#   BASELINE_OUT - baseline directory (default: baseline)
#   TIMINGS_OUT  - timings directory (default: timings)
#
# Reads GH_TOKEN, if it has one, only to ask the API how long the shard *jobs*
# took: the part of a shard's cost that happens before its driver starts.
#
# Always exits zero: check results are the report's business, not the job
# status's -- only a genuinely broken collector fails this job.

source(file.path(
  dirname(sub("--file=", "", grep("^--file=", commandArgs(), value = TRUE))),
  "util.R"
))

results_dir <- env_chr("RESULTS_DIR")
stopifnot(nzchar(results_dir))
plan <- read_json(env_chr("PLAN", "plan.json"))
retry_dir <- env_chr("RETRY_DIR")
out_dir <- env_chr("OUT_DIR", "revdep")
baseline_out <- env_chr("BASELINE_OUT", "baseline")
timings_out <- env_chr("TIMINGS_OUT", "timings")

dir.create(file.path(out_dir, "pkgs"), recursive = TRUE, showWarnings = FALSE)
dir.create(
  file.path(baseline_out, "old-rds"),
  recursive = TRUE,
  showWarnings = FALSE
)
dir.create(timings_out, recursive = TRUE, showWarnings = FALSE)

# ------------------------------------------------------------------- merge ---

# Shard artifacts are named revdepx-results-<shard>-<attempt>; walking them in
# attempt order makes the later attempt win when a shard was re-run.
#
# `download-artifact` only creates the per-artifact subdirectory when it
# downloads more than one: a run planned into a single shard has its
# manifest.ndjson land directly in `results_dir`, not in
# `results_dir/revdepx-results-1-1/`. Run 31930350338 was that run, and the
# collector found one directory (`results/pkgs`), no manifest in it, and
# collected nothing -- then carried all 1011 results over from the run it was
# retrying and committed them as if they were fresh. So the layout is
# discovered rather than assumed: a shard directory is one that has a manifest.
attempt_of <- function(path) {
  n <- suppressWarnings(as.integer(sub("^.*-", "", basename(path))))
  if (is.na(n)) 0L else n
}
has_manifest <- function(paths) {
  paths[file.exists(file.path(paths, "manifest.ndjson"))]
}
shard_dirs <- has_manifest(list.dirs(results_dir, recursive = FALSE))
shard_dirs <- shard_dirs[order(vapply(shard_dirs, attempt_of, integer(1)))]
shard_dirs <- c(has_manifest(results_dir), shard_dirs)

entries <- list()
take <- function(entry, from) {
  entry$carried <- isTRUE(entry$carried)
  entries[[entry$package]] <<- entry
  src <- file.path(from, "pkgs", entry$package)
  if (dir.exists(src)) {
    dest <- file.path(out_dir, "pkgs", entry$package)
    unlink(dest, recursive = TRUE)
    dir.create(dest, recursive = TRUE, showWarnings = FALSE)
    file.copy(list.files(src, full.names = TRUE), dest, recursive = TRUE)
  }
}

shard_timings <- list()
for (dir in shard_dirs) {
  timing <- file.path(dir, "timing.json")
  if (file.exists(timing)) {
    row <- tryCatch(read_json(timing), error = function(e) NULL)
    if (!is.null(row$index)) {
      shard_timings[[as.character(row$index)]] <- row
    }
  }
  manifest <- file.path(dir, "manifest.ndjson")
  if (!file.exists(manifest)) {
    next
  }
  for (line in readLines(manifest, warn = FALSE)) {
    if (nzchar(trimws(line))) {
      take(jsonlite::fromJSON(line, simplifyVector = FALSE), dir)
    }
  }
}
inform(
  "Collected ",
  length(entries),
  " package(s) from ",
  length(shard_dirs),
  " shard artifact(s)"
)

# A retried run reports the whole picture: results the retry did not touch are
# carried over from the earlier run's report, marked as such.
if (nzchar(retry_dir) && file.exists(file.path(retry_dir, "manifest.json"))) {
  carried <- 0L
  for (entry in read_json(file.path(retry_dir, "manifest.json"))) {
    if (is.null(entries[[entry$package]])) {
      entry$carried <- TRUE
      take(entry, retry_dir)
      carried <- carried + 1L
    }
  }
  inform(
    "Carried ",
    carried,
    " untouched result(s) over from run ",
    plan$retry_of
  )
}

# A subset run -- `packages: broken`, an explicit list, a `part` -- reports
# the whole record too. The committed manifest is the durable record of every
# package the last full run checked, and writing this run's slice over it
# would shrink 3435 rows to 204 (run 32260705703 did exactly that): the
# repository would remember only what was just re-checked, and the next
# `packages: broken` would select from an amnesiac record. So rows for
# packages *outside this run's plan* are kept from the committed manifest,
# marked carried. Planned packages are deliberately not eligible: a planned
# package with no fresh result is a dead shard, and the `missing` fill below
# must say so rather than let a stale row paper over it. Entries are set
# directly, not through take(): the committed report has no pkgs/ payload to
# copy, and take() would unlink the destination it copies into.
committed_manifest <- file.path(out_dir, "manifest.json")
if (
  (!identical(plan$selection, "all") || !is.null(plan$part)) &&
    file.exists(committed_manifest)
) {
  planned <- unlist(lapply(plan$shards %||% list(), function(shard) {
    vapply(
      shard$packages %||% list(),
      function(p) p$name %||% "",
      character(1)
    )
  }))
  kept <- 0L
  for (entry in tryCatch(
    read_json(committed_manifest),
    error = function(e) list()
  )) {
    name <- entry$package %||% ""
    if (!nzchar(name) || !is.null(entries[[name]]) || name %in% planned) {
      next
    }
    entry$carried <- TRUE
    entries[[name]] <- entry
    kept <- kept + 1L
  }
  if (kept > 0) {
    inform(
      "Kept ",
      kept,
      " committed result(s) for packages outside this run's selection"
    )
  }
}

# Every package the plan named has to appear in the report, including the ones
# whose shard uploaded nothing at all: a job that dies -- runner failure,
# cancellation, the job timeout above the shard's own deadline -- takes its
# manifest with it, and a package silently absent from a report reads as one
# that was fine. `missing` is a not-ok result, so `retry-run` picks exactly
# these up, the same way it picks up a deferral.
missing <- 0L
for (shard in plan$shards %||% list()) {
  for (p in shard$packages %||% list()) {
    if (!is.null(entries[[p$name]])) {
      next
    }
    entries[[p$name]] <- list(
      package = p$name,
      version = p$version,
      level = p$level %||% 0L,
      shard = shard$index,
      weight_minutes = p$weight_minutes,
      t_total = p$t_total %||% 0,
      dep_fingerprint = p$dep_fingerprint,
      baseline_planned = isTRUE(p$baseline),
      # Matches the shard's own entry shape; `baseline_reused` was dropped when
      # both halves became mandatory, and nothing sets it any more.
      baseline_agrees = NA,
      result = "missing",
      status = "",
      status_old = "",
      status_new = "",
      new_issues = 0L,
      t_old = NA,
      t_new = NA,
      old_checked_at = NA,
      message = sprintf(
        "shard %s uploaded no result for this package; its job did not finish",
        shard$index
      ),
      our_cran_version = plan$cran_version,
      our_dev_version = plan$dev_version,
      carried = FALSE
    )
    missing <- missing + 1L
  }
}
if (missing > 0) {
  inform(
    missing,
    " planned package(s) have no result at all; reported as missing"
  )
}

entries <- entries[order(names(entries))]
results_tbl <- vapply(entries, function(e) e$result, character(1))

# ---------------------------------------------------------------- manifest ---

write_json(
  list(
    package = plan$package,
    dev_version = plan$dev_version,
    cran_version = plan$cran_version,
    r_version = plan$r_version,
    base_image = plan$base_image,
    engine = plan$engine,
    workflow = env_chr("GITHUB_WORKFLOW"),
    sha = plan$sha,
    run_id = env_chr("GITHUB_RUN_ID"),
    retry_of = plan$retry_of,
    generated_at = now_utc()
  ),
  file.path(out_dir, "run.json")
)
write_json(unname(entries), file.path(out_dir, "manifest.json"))

# ---------------------------------------------------------------- baseline ---

baseline <- list()
for (entry in entries) {
  rds <- file.path(out_dir, "pkgs", entry$package, "old.rds")
  if (
    !file.exists(rds) ||
      is.null(entry$old_checked_at) ||
      is.na(entry$old_checked_at)
  ) {
    next
  }
  file.copy(
    rds,
    file.path(baseline_out, "old-rds", paste0(entry$package, ".rds"))
  )
  baseline[[length(baseline) + 1]] <- list(
    package = entry$package,
    version = entry$version,
    our_cran_version = entry$our_cran_version,
    r_version = plan$r_version,
    # The container platform the old half ran under. plan.R refuses a row
    # whose tag differs from its own -- which also walls off every
    # revdep2-era baseline, none of which carry the field.
    base_image = plan$base_image,
    dep_fingerprint = entry$dep_fingerprint,
    checked_at = entry$old_checked_at,
    status_old = entry$status_old,
    has_old = TRUE
  )
}
write_json(baseline, file.path(baseline_out, "baseline.json"))
inform("Baseline carries ", length(baseline), " old-version result(s)")

# ----------------------------------------------------------------- timings ---

# What this run cost, in the form the next plan can use: one row per package
# (seconds per check here, next to the seconds CRAN reports) and one per shard
# (install, check, script and job minutes, next to what was predicted).
#
# The plan's cost model is three constants -- how fast checks run here, what a
# shard costs before it checks anything, what one more dependency costs to
# install -- and every one of them is measurable. Measuring them is what keeps
# the shard count honest: a model that overestimates the work cuts it into more
# shards than the parallel capacity can run, and each extra shard is another
# setup paid for nothing.
# The canonical per-package number: the mean of the per-half durations that
# exist -- two real measurements, their honest middle. "seconds" answers
# "what does one half cost here", the unit the cost model doubles into a
# package's bill. (Rows from the retired pair engine carried the pair's
# shared wall clock in both fields, so their mean is that wall clock, and
# the unit still holds.)
seconds_of <- function(entry) {
  both <- suppressWarnings(as.numeric(c(entry$t_old, entry$t_new)))
  both <- both[!is.na(both) & both > 0]
  if (length(both) == 0) {
    NULL
  } else {
    list(seconds = mean(both), checks = length(both))
  }
}
package_rows <- list()
for (entry in entries) {
  measured <- seconds_of(entry)
  if (is.null(measured)) {
    next
  }
  package_rows[[length(package_rows) + 1]] <- list(
    package = entry$package,
    version = entry$version,
    t_total = entry$t_total %||% 0,
    checks = measured$checks,
    seconds = round(measured$seconds, 1)
  )
}

# The shard's own clock covers install and checks; the minutes before its
# driver starts -- runner image, R, pandoc, TinyTeX, artifact downloads -- are
# only visible from the API, and they are precisely the price of one more
# shard.
job_minutes <- run_shard_job_minutes(env_chr("GITHUB_RUN_ID"))
shard_rows <- lapply(shard_timings, function(t) {
  index <- as.character(t$index)
  install <- ((t$restore_seconds %||% 0) + (t$install_seconds %||% 0)) / 60
  list(
    index = t$index,
    packages = t$packages %||% 0,
    checks = t$checks %||% 0,
    install_packages = t$install_packages %||% 0,
    restored = t$restored %||% 0,
    install_minutes = round(install, 2),
    check_minutes = round((t$check_seconds %||% 0) / 60, 2),
    script_minutes = round((t$script_seconds %||% 0) / 60, 2),
    job_minutes = if (index %in% names(job_minutes)) {
      round(unname(job_minutes[[index]]), 2)
    } else {
      NULL
    },
    planned_minutes = t$planned_minutes,
    planned_check_minutes = t$planned_check_minutes
  )
})
shard_rows <- unname(shard_rows[order(as.numeric(names(shard_rows)))])

timings <- list(
  run_id = env_chr("GITHUB_RUN_ID"),
  generated_at = now_utc(),
  # The engine stamps the run so calibration() can filter shard rows: per-half
  # seconds pool across engines, shard setup and install medians do not.
  engine = plan$engine,
  r_version = plan$r_version,
  platform = R.version$platform,
  timing_flavor = plan$timing_flavor,
  packages = package_rows,
  shards = shard_rows
)
cal <- calibration(list(timings), plan$engine)
timings$calibration <- list(
  check_scale = cal$check_scale,
  setup_minutes = cal$setup_minutes,
  install_seconds = cal$install_seconds
)
write_json(timings, file.path(timings_out, "timings.json"))
inform(
  "Timings: ",
  length(package_rows),
  " package(s), ",
  length(shard_rows),
  " shard(s)",
  if (length(job_minutes) == 0) " (job durations unavailable)" else ""
)

# ----------------------------------------------------------------- reports ---

# The report machinery is revdepcheck's own, fed through its `results`
# injection point; when the package is unavailable the manifest-derived
# summary below still stands on its own.
has_revdepcheck <- requireNamespace("revdepcheck", quietly = TRUE)

comparison_of <- function(entry) {
  dir <- file.path(out_dir, "pkgs", entry$package)
  old_path <- file.path(dir, "old.rds")
  new_path <- file.path(dir, "new.rds")
  shim <- function(message) {
    res <- revdepcheck:::rcmdcheck_error(
      entry$package,
      old = list(stdout = message, stderr = ""),
      new = list(stdout = message, stderr = "")
    )
    res$version <- entry$version
    # `pkg_links()` reads the maintainer and the URL out of
    # `result$new$description`, and `desc::desc(text = NULL)` falls back to the
    # DESCRIPTION of the working directory -- which here is igraph's own. Left
    # alone, a package that never got far enough to have a DESCRIPTION was
    # reported with igraph's repository and igraph's maintainer address next to
    # its name. A synthetic one carries no maintainer and no URL, so only the
    # CRAN mirror link is emitted, and `[UNKNOWN]` is avoided as well.
    res$new$version <- entry$version
    res$new$description <- sprintf(
      "Package: %s\nVersion: %s\n",
      entry$package,
      entry$version %||% "0"
    )
    res$new$cran <- TRUE
    res
  }
  if (!file.exists(old_path) || !file.exists(new_path)) {
    # A row carried from the committed manifest has no check payload -- it is
    # the record speaking, not this run. Shimming it as an error made
    # revdepcheck classify it "failed to check": run 32281237129 carried
    # 3402 ok rows and its README announced "Failed to check (3407)", with a
    # 28-line "Not checked (ok)" failure section for every one of them. An
    # ok row becomes a clean two-sided comparison instead -- status "+",
    # zero rows -- which the summary counts and every table ignores. Carried
    # not-ok rows keep the shim: "failed to check, not by this run" is the
    # closest bucket the report vocabulary has for them, and their committed
    # sections are protected separately.
    if (isTRUE(entry$carried) && identical(entry$result, "ok")) {
      clean_half <- function() {
        structure(
          list(
            package = entry$package,
            version = entry$version %||% "0",
            rversion = "",
            platform = "",
            errors = character(),
            warnings = character(),
            notes = character(),
            description = sprintf(
              "Package: %s\nVersion: %s\n",
              entry$package,
              entry$version %||% "0"
            ),
            cran = TRUE,
            bioc = FALSE,
            checkdir = "",
            install_out = "",
            test_fail = list(),
            timeout = FALSE
          ),
          class = "rcmdcheck"
        )
      }
      cmp <- tryCatch(
        rcmdcheck::compare_checks(clean_half(), clean_half()),
        error = function(e) NULL
      )
      if (!is.null(cmp)) {
        return(cmp)
      }
    }
    message <- if (nzchar(entry$message %||% "")) {
      entry$message
    } else {
      sprintf("Not checked (%s)", entry$result)
    }
    return(shim(message))
  }
  tryCatch(
    revdepcheck:::try_compare_checks(
      entry$package,
      readRDS(old_path),
      readRDS(new_path)
    ),
    error = function(e) shim(conditionMessage(e))
  )
}

preamble <- c(
  "# Platform",
  "",
  md_table(data.frame(
    field = c("package", "dev", "CRAN", "commit", "R", "platform", "run", "date"),
    value = c(
      plan$package,
      plan$dev_version,
      plan$cran_version,
      substr(plan$sha, 1, 9),
      plan$r_version,
      R.version$platform,
      env_chr("GITHUB_RUN_ID", "local"),
      format(Sys.Date())
    )
  )),
  ""
)

if (has_revdepcheck) {
  results <- lapply(unname(entries), comparison_of)
  names(results) <- names(entries)

  capture_report <- function(fun, ...) {
    path <- tempfile()
    fun(..., file = path)
    readLines(path, warn = FALSE)
  }
  writeLines(
    c(
      preamble,
      capture_report(revdepcheck::cloud_report_summary, pkg = ".", results = results)
    ),
    file.path(out_dir, "README.md")
  )
  # `problems.md` and `failures.md` are assembled from one file per package
  # rather than written whole.
  #
  # Two things fall out of that, and the second is why it was done. A diff
  # names the package that changed instead of a line range in a file thousands
  # of lines long. And a run only has to touch the packages it actually
  # checked: a retry of 27 rewrites 27 files and leaves the other 984 exactly
  # as the repository has them. Writing the file whole made every run restate
  # the entire record, so a run that learnt nothing about a package could still
  # rewrite that package's section -- from a shim, if its check output had not
  # survived the trip.
  #
  # Empty is revdepcheck's own wording, so an assembled file with no sections
  # reads the way the single-call version did.
  no_problems <- "*Wow, no problems at all. :)*"
  sections <- list(
    problems = revdepcheck::cloud_report_problems,
    failures = revdepcheck::cloud_report_failures
  )
  for (dir in names(sections)) {
    dir.create(file.path(out_dir, dir), showWarnings = FALSE)
  }

  # revdepcheck emits one `# <package> (<version>)` block per package that its
  # predicate selects, and the sentence above when it selects none. Asking it
  # about a single package therefore yields exactly that package's section, or
  # nothing.
  section_of <- function(fun, package) {
    lines <- capture_report(fun, pkg = ".", results = results[package])
    if (identical(trimws(paste(lines, collapse = "")), no_problems)) {
      NULL
    } else {
      lines
    }
  }

  # A package whose check errors under *both* versions. `ok` is the verdict --
  # there is no new problem, which is what this workflow is for -- but the
  # package is broken, and a section someone put in the report for it is not
  # made stale by a run that reproduces the breakage on both sides. 79 of run
  # 31930350338's 984 `ok` results are of this shape; 55 of them never got as
  # far as a check at all (their dependencies would not install, so both
  # halves stopped at `checking package dependencies` in a couple of seconds
  # and agreed), and 24 are real checks of genuinely broken packages.
  #
  # This only declines to *delete*; nothing is added. revdepcheck's
  # `problems.md` is the newly-broken list by design, and widening it to
  # "still broken" is `all = TRUE` and a different report.
  # `ok` specifically: a `newly_broken` package can error on both sides too --
  # archeofrag went 1E to 2E in run 31930350338 -- and that one was checked
  # here, so its section is this run's to rewrite.
  still_broken <- function(entry) {
    e <- function(status) {
      n <- regmatches(
        status %||% "",
        regexpr("^[0-9]+(?=E)", status %||% "", perl = TRUE)
      )
      length(n) > 0 && as.integer(n) > 0
    }
    identical(entry$result, "ok") && e(entry$status_old) && e(entry$status_new)
  }

  # What this run is entitled to overwrite. A carried result is one this run
  # never checked, and `missing` and `deferred` mean the shard did not get to
  # it -- in all three cases the committed section is better evidence than
  # anything reconstructible here. The `file.exists` clause makes that a
  # preference rather than a rule: with no section on disk there is nothing to
  # protect, so it is written from the comparison like any other.
  keeps_committed <- function(entry, dir) {
    (isTRUE(entry$carried) ||
      entry$result %in% c("missing", "deferred", "depmissing") ||
      still_broken(entry)) &&
      file.exists(file.path(out_dir, dir, paste0(entry$package, ".md")))
  }

  written <- setNames(integer(length(sections)), names(sections))
  for (entry in entries) {
    # A carried row without a check payload has nothing to render a section
    # from -- its committed section, where one exists, is already on disk
    # and is better evidence than any shim. This run neither writes nor
    # deletes for it. (Retry-carried rows are untouched by this: take()
    # copied their payloads, so old.rds exists.)
    if (
      isTRUE(entry$carried) &&
        !file.exists(file.path(out_dir, "pkgs", entry$package, "old.rds"))
    ) {
      next
    }
    for (dir in names(sections)) {
      if (keeps_committed(entry, dir)) {
        next
      }
      path <- file.path(out_dir, dir, paste0(entry$package, ".md"))
      lines <- section_of(sections[[dir]], entry$package)
      if (is.null(lines)) {
        unlink(path)
      } else {
        writeLines(lines, path)
        written[[dir]] <- written[[dir]] + 1L
      }
    }
  }

  # Sorted by file name, so the assembled order is the package order rather
  # than however the shards happened to be cut -- case-insensitively, which is
  # the order revdepcheck's own single-call version produced and therefore the
  # order the committed report is already in. Sorting the raw names instead
  # moves `ECoL`, `GoodFitSBM`, `MetaNet` and `R6causal` to the front of
  # `problems.md` and rewrites the whole file for nothing.
  #
  # `method = "radix"` on a lowercased key rather than plain `sort()`: the
  # latter collates in the runner's locale, so the committed order would
  # depend on where the collector happened to run. Radix is C collation, and
  # C collation of the lowercased name is exactly the case-insensitive order.
  # The file name is the tie-break, so the sort is total.
  for (dir in names(sections)) {
    files <- list.files(
      file.path(out_dir, dir),
      pattern = "[.]md$",
      full.names = TRUE
    )
    files <- files[
      order(tolower(basename(files)), basename(files), method = "radix")
    ]
    writeLines(
      if (length(files) == 0) {
        no_problems
      } else {
        unlist(lapply(files, readLines, warn = FALSE), use.names = FALSE)
      },
      file.path(out_dir, paste0(dir, ".md"))
    )
    inform(
      dir,
      ".md: ",
      length(files),
      " package(s), ",
      written[[dir]],
      " written by this run"
    )
  }

  writeLines(
    capture_report(
      revdepcheck::revdep_report_cran,
      pkg = ".",
      results = results
    ),
    file.path(out_dir, "cran.md")
  )
  inform("Reports written to ", out_dir)
} else {
  inform(
    "revdepcheck is not installed; writing the manifest-derived summary only"
  )
  df <- data.frame(
    package = names(entries),
    version = vapply(entries, function(e) e$version %||% "?", character(1)),
    result = results_tbl,
    old = vapply(entries, function(e) e$status_old %||% "", character(1)),
    new = vapply(entries, function(e) e$status_new %||% "", character(1))
  )
  writeLines(
    c(preamble, "# Revdeps", "", md_table(df)),
    file.path(out_dir, "README.md")
  )
}

# ------------------------------------------------------------------ summary --

tally <- function(what) sum(results_tbl == what)
not_ok <- sum(results_tbl != "ok")

# Whether this report is worth writing over the committed one.
#
# The report in `revdep/` is the repository's record, and `packages: broken`
# reads it back to decide what to re-check. A run in which nothing produced a
# comparison -- every shard dead, every package `missing`, a bad plan, a driver
# bug that turned the whole set into `depfail` -- would replace that record with
# a list of things it never learnt anything about, and there is no way back to
# it. So the run says out loud whether it compared anything at all, and the
# workflow gates the commit on that; the artifact is uploaded either way, so
# nothing is hidden, only the destructive step is skipped.
#
# Only *this run's* comparisons count. A retry whose shards all died still
# carries the donor run's good results (`carried = TRUE`) -- that is the
# retry contract -- but they are the donor's learning, not this run's, and a
# gate they could pass would let the exact run this gate exists for (learnt
# nothing, every fresh package `missing`) overwrite the record after all.
compared <- sum(vapply(
  entries,
  function(e) {
    !isTRUE(e$carried) && (e$result %in% c("ok", "newly_broken"))
  },
  logical(1)
))
set_output("compared", compared)
if (compared == 0) {
  inform(
    "No package produced a comparison; the report is written and uploaded, ",
    "but the committed one is left alone"
  )
}

# The one sentence a reader needs, before any table.
headline <- if (tally("newly_broken") > 0) {
  sprintf(
    "**%d of %d packages newly broken.**",
    tally("newly_broken"),
    length(entries)
  )
} else if (not_ok > 0) {
  sprintf(
    "No new breakage; %d of %d packages could not be fully checked.",
    not_ok,
    length(entries)
  )
} else {
  sprintf("All good: no new problems in %d packages.", length(entries))
}

counts_df <- data.frame(
  Result = c(
    "ok", "newly broken", "failed to check",
    # Its own row, and deliberately not counted as a failure: a check killed
    # by the clock says nothing about the package, and in the old half it says
    # nothing about our change either.
    "timed out, not checked",
    "dependencies not installable",
    # `R CMD check` refused to start, in both halves, because something the
    # package needs is not installed. Its own row rather than a failure: the
    # package is not broken, it is unknown.
    "dependencies unavailable to R CMD check",
    "shard error", "deferred",
    "no result from its shard"
  ),
  Packages = c(
    tally("ok"), tally("newly_broken"), tally("failed"),
    tally("timeout"),
    tally("depfail"), tally("depmissing"), tally("error"), tally("deferred"),
    tally("missing")
  )
)
counts_df <- counts_df[counts_df$Packages > 0 | counts_df$Result == "ok", ]

# Packages that produced no comparison at all. revdepcheck lists them too, but
# only as bare names under "Failed to check" -- no version it could resolve and
# no reason, because the shim it is fed carries neither. The manifest has both,
# so that section is dropped from the embedded report and this table takes its
# place.
unchecked <- Filter(
  function(e) !e$result %in% c("ok", "newly_broken"),
  unname(entries)
)
reason_of <- function(e) {
  message <- gsub("[[:space:]]+", " ", trimws(e$message %||% ""))
  # Results carried over from an older run predate the shard recording one.
  if (!nzchar(message) && nzchar(e$status %||% "")) {
    message <- status_message(e$status)
  }
  if (nzchar(message)) {
    return(message)
  }
  switch(
    e$result,
    deferred = "the shard hit its deadline before this package was checked",
    depfail = "dependencies could not be installed",
    depmissing = "R CMD check stopped at `checking package dependencies` under both versions",
    missing = "its shard uploaded no results; the job did not finish",
    sprintf("no reason recorded (result `%s`)", e$result)
  )
}
unchecked_df <- data.frame(
  Package = vapply(unchecked, function(e) cran_link(e$package), character(1)),
  Version = vapply(unchecked, function(e) e$version %||% "?", character(1)),
  Result = vapply(unchecked, function(e) e$result, character(1)),
  Shard = vapply(
    unchecked,
    function(e) as.character(e$shard %||% ""),
    character(1)
  ),
  Old = vapply(unchecked, function(e) e$status_old %||% "", character(1)),
  New = vapply(unchecked, function(e) e$status_new %||% "", character(1)),
  Reason = vapply(unchecked, reason_of, character(1))
)

# The report itself, nested under this section: headings demoted two levels,
# and the platform preamble dropped -- the sentence above already says what
# was compared against what.
readme <- readLines(file.path(out_dir, "README.md"), warn = FALSE)
revdeps_at <- grep("^# Revdeps", readme)[1]
if (!is.na(revdeps_at)) {
  readme <- readme[seq(revdeps_at, length(readme))]
}
readme <- drop_section(readme, "^## Failed to check")
# revdepcheck's tables link into the sibling report files, which is right
# inside the artifact and wrong here: a job summary is served from the run's
# own URL, where `problems.md#pkg` resolves to /actions/runs/problems.md and
# 404s. The package's CRAN page is the reachable equivalent; where the details
# actually live is said once, below.
# Only where the link text is a package name -- the anchor form revdepcheck
# emits for a package. A bare `[failures.md](failures.md)` is a link to the
# report's own file, and rewriting it to `package=failures.md` was nonsense.
readme <- gsub(
  "\\[([a-zA-Z][a-zA-Z0-9.]*)\\]\\([^)]*[.]md(#[^)]*)?\\)",
  "[\\1](https://cran.r-project.org/package=\\1)",
  readme
)
readme <- gsub("^(#+)(\\s)", "##\\1\\2", readme)

run_id <- env_chr("GITHUB_RUN_ID")
append_summary(c(
  "## revdepx results",
  "",
  sprintf(
    "`%s` %s (dev) vs %s (CRAN), R %s%s.",
    plan$package, plan$dev_version, plan$cran_version, plan$r_version,
    if (has_run(plan$retry_of)) {
      sprintf(", retry of run %s", run_link(plan$retry_of))
    } else {
      ""
    }
  ),
  "",
  headline,
  "",
  md_table(counts_df),
  "",
  readme,
  "",
  if (nrow(unchecked_df) > 0) {
    # A run where everything defers would put every revdep in this table; the
    # summary has a size limit, and losing it whole is worse than a cut list.
    shown <- utils::head(unchecked_df, 200)
    c(
      sprintf("### Could not be checked (%d)", nrow(unchecked_df)),
      "",
      paste(
        "No comparison was produced for these, so they say nothing about the",
        "dev version either way. The shard job named in `Shard` has the full",
        "check log for each."
      ),
      "",
      md_table(shown),
      if (nrow(shown) < nrow(unchecked_df)) {
        c("", sprintf(
          "... and %d more; the full list is `manifest.json` in the report artifact.",
          nrow(unchecked_df) - nrow(shown)
        ))
      },
      ""
    )
  },
  # What the run cost, in the terms the next plan is sized in. A plan that
  # overestimates buys shards it cannot run in parallel, so these three numbers
  # are worth showing next to the results they came from.
  if (length(package_rows) > 0 || length(shard_rows) > 0) {
    or_unmeasured <- function(x, fmt, ...) {
      if (is.null(x)) "not measured" else sprintf(fmt, x, ...)
    }
    # From the package rows, not the shard rows: a shard whose job died leaves
    # no timing of its own, but the checks it did finish are still in the
    # manifest the collector just merged.
    # `seconds` is the canonical per-half number; `checks` says how many
    # halves it stands for. Summing seconds is half the check wall clock,
    # which the planned-vs-actual shard table already reports exactly. Close
    # enough for a cost headline.
    check_minutes <- sum(vapply(
      package_rows,
      function(p) p$seconds / 60,
      numeric(1)
    ))
    job <- vapply(
      shard_rows,
      function(s) s$job_minutes %||% NA_real_,
      numeric(1)
    )
    c(
      "### What this run cost",
      "",
      md_table(data.frame(
        Measured = c(
          "Checks",
          "Check speed",
          "Shard jobs",
          "Setup per shard",
          "Install per dependency"
        ),
        Value = c(
          sprintf(
            "%d in %d package(s), ~%.0f min",
            sum(vapply(package_rows, function(p) p$checks, numeric(1))),
            length(package_rows),
            check_minutes
          ),
          or_unmeasured(cal$check_scale, "%.2f x the time CRAN reports"),
          if (all(is.na(job))) {
            sprintf("%d shard(s), job durations unavailable", length(shard_rows))
          } else {
            sprintf(
              "%d shard(s), median ~%.0f min, longest ~%.0f min",
              length(shard_rows),
              stats::median(job, na.rm = TRUE),
              max(job, na.rm = TRUE)
            )
          },
          or_unmeasured(
            cal$setup_minutes,
            "~%.1f min before the driver starts"
          ),
          or_unmeasured(cal$install_seconds, "~%.1f s")
        ),
        check.names = FALSE
      )),
      "",
      sprintf(
        "The next plan of either workflow reads these from the `revdepx-timings` artifact of %s and sizes its shards with them.",
        this_run_link("this run")
      ),
      ""
    )
  },
  "### Getting the results",
  "",
  sprintf(
    "The full report -- `problems.md`, `failures.md`, `cran.md` and every check's output -- is the `revdepx-report` artifact of %s.",
    this_run_link("this run")
  ),
  "",
  "```sh",
  sprintf("gh run download %s --name revdepx-report --dir revdep/", run_id),
  "# retry everything that is not ok:",
  sprintf(
    "gh workflow run %s -f retry-run=%s",
    local({
      ref <- env_chr("GITHUB_WORKFLOW_REF")
      file <- basename(sub("@.*$", "", ref))
      if (nzchar(file) && grepl("[.]ya?ml$", file)) file else "revdep4.yaml"
    }),
    run_id
  ),
  "```"
))

inform(
  length(entries),
  " package(s): ",
  sum(results_tbl == "ok"),
  " ok, ",
  not_ok,
  " with findings -- see the summary and the revdepx-report artifact"
)

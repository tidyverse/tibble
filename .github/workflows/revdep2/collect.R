# Fan-in for revdep2: merge every shard's results into one report, one
# manifest, and one baseline for future runs to reuse.
#
# Reads all revdep2-results-* artifacts (every attempt; on a re-run the later
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
# date the old check *actually* ran (reuse does not refresh it).
#
# Environment variables:
#   RESULTS_DIR  - directory the shard artifacts were downloaded into (required)
#   PLAN         - plan.json (default: plan.json)
#   RETRY_DIR    - the revdep2-report artifact of the run being retried, if any
#   OUT_DIR      - report directory (default: revdep)
#   BASELINE_OUT - baseline directory (default: baseline)
#
# Always exits zero: check results are the report's business, not the job
# status's -- only a genuinely broken collector fails this job.

source(file.path(dirname(sub("--file=", "", grep("^--file=", commandArgs(), value = TRUE))), "util.R"))

results_dir <- env_chr("RESULTS_DIR")
stopifnot(nzchar(results_dir))
plan <- read_json(env_chr("PLAN", "plan.json"))
retry_dir <- env_chr("RETRY_DIR")
out_dir <- env_chr("OUT_DIR", "revdep")
baseline_out <- env_chr("BASELINE_OUT", "baseline")

dir.create(file.path(out_dir, "pkgs"), recursive = TRUE, showWarnings = FALSE)
dir.create(file.path(baseline_out, "old-rds"), recursive = TRUE, showWarnings = FALSE)

# ------------------------------------------------------------------- merge ---

# Shard artifacts are named revdep2-results-<shard>-<attempt>; walking them in
# attempt order makes the later attempt win when a shard was re-run.
attempt_of <- function(path) {
  n <- suppressWarnings(as.integer(sub("^.*-", "", basename(path))))
  if (is.na(n)) 0L else n
}
shard_dirs <- list.dirs(results_dir, recursive = FALSE)
shard_dirs <- shard_dirs[order(vapply(shard_dirs, attempt_of, integer(1)))]

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

for (dir in shard_dirs) {
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
inform("Collected ", length(entries), " package(s) from ", length(shard_dirs), " shard artifact(s)")

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
  inform("Carried ", carried, " untouched result(s) over from run ", plan$retry_of)
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
  if (!file.exists(rds) || is.null(entry$old_checked_at) || is.na(entry$old_checked_at)) {
    next
  }
  file.copy(rds, file.path(baseline_out, "old-rds", paste0(entry$package, ".rds")))
  baseline[[length(baseline) + 1]] <- list(
    package = entry$package,
    version = entry$version,
    our_cran_version = entry$our_cran_version,
    r_version = plan$r_version,
    dep_fingerprint = entry$dep_fingerprint,
    checked_at = entry$old_checked_at,
    status_old = entry$status_old,
    has_old = TRUE
  )
}
write_json(baseline, file.path(baseline_out, "baseline.json"))
inform("Baseline carries ", length(baseline), " old-version result(s)")

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
    res
  }
  if (!file.exists(old_path) || !file.exists(new_path)) {
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
  writeLines(
    capture_report(revdepcheck::cloud_report_problems, pkg = ".", results = results),
    file.path(out_dir, "problems.md")
  )
  writeLines(
    capture_report(revdepcheck::cloud_report_failures, pkg = ".", results = results),
    file.path(out_dir, "failures.md")
  )
  writeLines(
    capture_report(revdepcheck::revdep_report_cran, pkg = ".", results = results),
    file.path(out_dir, "cran.md")
  )
  inform("Reports written to ", out_dir)
} else {
  inform("revdepcheck is not installed; writing the manifest-derived summary only")
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

# The one sentence a reader needs, before any table.
headline <- if (tally("newly_broken") > 0) {
  sprintf(
    "**%d of %d packages newly broken.**",
    tally("newly_broken"), length(entries)
  )
} else if (not_ok > 0) {
  sprintf(
    "No new breakage; %d of %d packages could not be fully checked.",
    not_ok, length(entries)
  )
} else {
  sprintf("All good: no new problems in %d packages.", length(entries))
}

counts_df <- data.frame(
  Result = c(
    "ok", "newly broken", "failed to check",
    "dependencies not installable", "shard error", "deferred"
  ),
  Packages = c(
    tally("ok"), tally("newly_broken"), tally("failed"),
    tally("depfail"), tally("error"), tally("deferred")
  )
)
counts_df <- counts_df[counts_df$Packages > 0 | counts_df$Result == "ok", ]

# The report itself, nested under this section: headings demoted two levels,
# and the platform preamble dropped -- the sentence above already says what
# was compared against what.
readme <- readLines(file.path(out_dir, "README.md"), warn = FALSE)
revdeps_at <- grep("^# Revdeps", readme)[1]
if (!is.na(revdeps_at)) {
  readme <- readme[seq(revdeps_at, length(readme))]
}
readme <- gsub("^(#+)(\\s)", "##\\1\\2", readme)

run_id <- env_chr("GITHUB_RUN_ID")
append_summary(c(
  "## revdep2 results",
  "",
  sprintf(
    "`%s` %s (dev) vs %s (CRAN), R %s%s.",
    plan$package, plan$dev_version, plan$cran_version, plan$r_version,
    if (run_id_chr(plan$retry_of) != "0") {
      sprintf(", retry of run %s", plan$retry_of)
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
  "### Getting the results",
  "",
  "```sh",
  sprintf("gh run download %s --name revdep2-report --dir revdep/", run_id),
  sprintf("# retry everything that is not ok:"),
  sprintf("gh workflow run revdep2.yaml -f retry-run=%s", run_id),
  "```"
))

inform(
  length(entries), " package(s): ", sum(results_tbl == "ok"), " ok, ",
  not_ok, " with findings -- see the summary and the revdep2-report artifact"
)

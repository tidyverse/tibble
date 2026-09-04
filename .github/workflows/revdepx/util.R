# Shared helpers for the revdepx workflow scripts (the revdep4
# engines).
# Sourced by plan.R, build.R, shard.R and collect.R; base R plus jsonlite only,
# so every job can use it before any heavyweight dependency is installed.

# ------------------------------------------------------------- environment --

`%||%` <- function(x, y) if (is.null(x)) y else x

env_chr <- function(name, default = "") {
  value <- Sys.getenv(name, unset = "")
  if (identical(value, "")) default else value
}

env_num <- function(name, default) {
  value <- env_num_opt(name)
  if (is.null(value)) default else value
}

# The same, but NULL when the variable is unset or unusable -- so a caller can
# tell "not given" from "given the value that happens to be the default", which
# is what an explicit knob overriding a measurement needs to know.
env_num_opt <- function(name) {
  value <- suppressWarnings(as.numeric(env_chr(name)))
  if (length(value) != 1 || is.na(value)) NULL else value
}

env_flag <- function(name) {
  tolower(env_chr(name)) %in% c("1", "true", "yes")
}

inform <- function(...) {
  message(paste0(...))
}

now_utc <- function() {
  format(Sys.time(), "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")
}

# A block of output under a heading the reader can fold away.
#
# Actions renders `::group::` as a collapsed section in the job log, so a
# hundred shard packages can each contribute their diff without any of them
# getting in the way of the summary lines between them. Outside Actions the
# markers are just two extra lines. NULL arguments are dropped, so a caller can
# pass a trailing note conditionally.
print_group <- function(title, ...) {
  body <- unlist(list(...), use.names = FALSE)
  message("::group::", title)
  if (length(body) > 0) {
    message(paste(body, collapse = "\n"))
  }
  message("::endgroup::")
}

# ---------------------------------------------------------------- run ids ----

# GitHub run ids passed `.Machine$integer.max` in 2026, so they are carried as
# strings everywhere here: `as.integer("31048405399")` is a silent NA, and an
# NA reaching `if (run > 0)` takes the whole planning job down. "0" is the
# "no such run" sentinel the workflow's job outputs and plan.json use.
run_id_chr <- function(x) {
  if (is.null(x) || length(x) != 1 || is.na(x)) "0" else trimws(as.character(x))
}

has_run <- function(x) {
  id <- run_id_chr(x)
  nzchar(id) && !identical(id, "0")
}

# ------------------------------------------------------- links in summaries --

# A job summary is rendered at the run's own URL, so every link it carries has
# to be absolute; relative ones resolve against /actions/runs/<id> and 404.

# A run id, linked to its page; plain text off GitHub (a local run).
run_link <- function(x) {
  id <- run_id_chr(x)
  if (!nzchar(gh_repo())) {
    return(id)
  }
  sprintf(
    "[%s](%s/%s/actions/runs/%s)",
    id,
    env_chr("GITHUB_SERVER_URL", "https://github.com"),
    gh_repo(),
    id
  )
}

# This run's page, where its artifacts are.
this_run_link <- function(text = env_chr("GITHUB_RUN_ID", "local")) {
  id <- run_id_chr(env_chr("GITHUB_RUN_ID"))
  if (!has_run(id) || !nzchar(gh_repo())) {
    return(text)
  }
  sprintf(
    "[%s](%s/%s/actions/runs/%s)",
    text,
    env_chr("GITHUB_SERVER_URL", "https://github.com"),
    gh_repo(),
    id
  )
}

# A revdep, linked to its CRAN page -- the one page about it that is reachable
# from a job summary, and the one that names its maintainer.
cran_link <- function(package) {
  sprintf("[%s](https://cran.r-project.org/package=%s)", package, package)
}

# ------------------------------------------------------------------- JSON ----

write_json <- function(x, path) {
  jsonlite::write_json(x, path, auto_unbox = TRUE, digits = NA, null = "null")
}

read_json <- function(path, simplify = FALSE) {
  jsonlite::read_json(path, simplifyVector = simplify)
}

# --------------------------------------------------------- GitHub plumbing ----

# Append `name=value` to the job's outputs. Values must be single-line.
set_output <- function(name, value) {
  path <- Sys.getenv("GITHUB_OUTPUT")
  if (nzchar(path)) {
    cat(sprintf("%s=%s\n", name, value), file = path, append = TRUE)
  } else {
    inform("[output] ", name, "=", value)
  }
}

# Append markdown lines to the job summary, or echo them locally.
append_summary <- function(lines) {
  path <- Sys.getenv("GITHUB_STEP_SUMMARY")
  if (nzchar(path)) {
    cat(lines, file = path, sep = "\n", append = TRUE)
    cat("\n", file = path, append = TRUE)
  } else {
    cat(lines, sep = "\n")
    cat("\n")
  }
}

# A minimal pipe table so summaries do not need knitr.
md_table <- function(df) {
  esc <- function(x) gsub("|", "\\|", as.character(x), fixed = TRUE)
  header <- paste0("| ", paste(esc(names(df)), collapse = " | "), " |")
  rule <- paste0("|", paste(rep(" --- ", ncol(df)), collapse = "|"), "|")
  rows <- vapply(
    seq_len(nrow(df)),
    function(i) {
      paste0("| ", paste(esc(unlist(df[i, ])), collapse = " | "), " |")
    },
    character(1)
  )
  c(header, rule, rows)
}

# Drop one markdown section: the first heading matching `heading`, and
# everything under it up to the next heading of any level.
drop_section <- function(lines, heading) {
  at <- grep(heading, lines)
  if (length(at) == 0) {
    return(lines)
  }
  from <- at[[1]]
  later <- grep("^#+[[:space:]]", lines)
  later <- later[later > from]
  to <- if (length(later) == 0) length(lines) else later[[1]] - 1L
  lines[-seq(from, to)]
}

# Text going into an HTML fragment of a summary (a <summary> title, say),
# where markdown's escaping does not apply.
md_escape_html <- function(x) {
  x <- gsub("&", "&amp;", x, fixed = TRUE)
  x <- gsub("<", "&lt;", x, fixed = TRUE)
  gsub(">", "&gt;", x, fixed = TRUE)
}

# Strip ANSI escapes and carriage returns before quoting logs into markdown.
sanitize_log <- function(lines) {
  lines <- gsub("\r", "", lines, fixed = TRUE)
  gsub("\033\\[[0-9;?]*[a-zA-Z]", "", lines)
}

# Fence log text so that embedded triple backticks cannot break the summary.
md_details <- function(title, lines, max_lines = 80) {
  lines <- sanitize_log(lines)
  omitted <- character()
  if (length(lines) > max_lines) {
    omitted <- sprintf(
      "... (%d earlier lines omitted)",
      length(lines) - max_lines
    )
    lines <- utils::tail(lines, max_lines)
  }
  c(
    sprintf("<details><summary>%s</summary>", title),
    "",
    "````text",
    omitted,
    lines,
    "````",
    "",
    "</details>",
    ""
  )
}

# --------------------------------------------------------- gh and artifacts --

# The plan resolves donor runs through the API, and the preflight and the
# shards fetch artifacts off them. Everything here is an optimization: a
# missing gh, a token without `actions: read`, an expired artifact, a network
# hiccup -- all of them have to end as "reuse nothing", never as a failure.

gh_repo <- function() {
  env_chr("GITHUB_REPOSITORY")
}

gh_ok <- function() {
  nzchar(Sys.which("gh")) &&
    nzchar(env_chr("GH_TOKEN", env_chr("GITHUB_TOKEN")))
}

# `gh`, with its arguments quoted for the shell: system2() quotes the command
# but hands the arguments to `sh` as written, and these carry `?`, `&`, `|`,
# quotes and spaces. Unquoted, an API path ends at its first `&`, and what
# follows becomes a second command the shell cannot find.
#
# Every failure becomes NULL, including the ones system2() raises instead of
# returning: a command the shell cannot run exits 127, which `stdout = TRUE`
# turns into an R error rather than a status.
gh_lines <- function(...) {
  out <- tryCatch(
    suppressWarnings(
      system2("gh", shQuote(c(...)), stdout = TRUE, stderr = NULL)
    ),
    error = function(e) NULL
  )
  status <- attr(out, "status")
  if (is.null(out) || (!is.null(status) && status != 0)) NULL else out
}

# The unexpired artifacts of one run, as a named character vector of ids;
# empty when the run has none or when gh cannot say.
#
# Paginated, because a single page is not enough and the ones that fall off it
# are exactly the ones that matter. A run publishes one
# `revdepx-results-<shard>-<attempt>` per shard -- up to 250 -- and uploads
# `revdepx-baseline`, `revdepx-timings` and `revdepx-report` last of all. Ask
# for one page of 100 and a run with a hundred shards hides its baseline behind
# its results: reuse would silently stop and `retry-run` would fail outright,
# both for a reason no log would name.
run_artifacts <- function(run_id) {
  if (!gh_ok() || !nzchar(gh_repo())) {
    return(character())
  }
  out <- gh_lines(
    "api",
    "--paginate",
    sprintf(
      "repos/%s/actions/runs/%s/artifacts?per_page=100",
      gh_repo(),
      run_id
    ),
    "--jq",
    ".artifacts[] | select(.expired == false) | [.name, .id] | @tsv"
  )
  out <- out[nzchar(out)]
  if (length(out) == 0) {
    return(character())
  }
  parts <- strsplit(out, "\t", fixed = TRUE)
  stats::setNames(
    vapply(parts, function(p) p[[2]], character(1)),
    vapply(parts, function(p) p[[1]], character(1))
  )
}

# Everything below reports why it could not do its job, not only that it
# could not. These fetches are optimizations, so a failure is swallowed and
# the run continues -- which is exactly the situation where a silent one is
# expensive: a prebuilt library that does not arrive costs an hour of
# rebuilding, and the causes (an artifact that really is gone, a download
# that failed, a truncated zip, an unzip that refused it) call for entirely
# different fixes and used to look identical in the log.

# The last few lines of what a command wrote to stderr, which is where every
# one of these tools says what went wrong.
stderr_tail <- function(path, n = 3) {
  if (!file.exists(path)) {
    return("")
  }
  lines <- tryCatch(readLines(path, warn = FALSE), error = function(e) {
    character()
  })
  paste(utils::tail(lines[nzchar(trimws(lines))], n), collapse = "; ")
}

format_bytes <- function(n) {
  if (!is.finite(n) || n < 0) {
    return("unknown size")
  }
  if (n >= 1024^3) {
    sprintf("%.2f GiB", n / 1024^3)
  } else if (n >= 1024^2) {
    sprintf("%.1f MiB", n / 1024^2)
  } else {
    sprintf("%.0f B", n)
  }
}

# utils::unzip() refuses archives above 4 GB, which a library artifact reaches
# without trying; the system unzip has no such limit, so prefer it and keep
# the internal one for a runner without it.
#
# Returns TRUE, or a string saying why not -- both are truthy in R, so callers
# must test with isTRUE().
unzip_into <- function(zip, dest) {
  dir.create(dest, recursive = TRUE, showWarnings = FALSE)
  if (nzchar(Sys.which("unzip"))) {
    err <- tempfile(fileext = ".err")
    on.exit(unlink(err), add = TRUE)
    status <- tryCatch(
      suppressWarnings(
        # Quoted: system2() quotes the command, but not the arguments.
        system2(
          "unzip",
          shQuote(c("-q", "-o", zip, "-d", dest)),
          stdout = NULL,
          stderr = err
        )
      ),
      error = function(e) 1L
    )
    if (identical(as.integer(status), 0L)) {
      return(TRUE)
    }
    detail <- stderr_tail(err)
    return(sprintf(
      "unzip exited %d%s",
      as.integer(status),
      if (nzchar(detail)) paste0(": ", detail) else ""
    ))
  }
  # A gh that wrote an error body instead of the artifact leaves something
  # that is not a zip; that is a missing artifact, not a usable one.
  extracted <- tryCatch(
    suppressWarnings(utils::unzip(zip, exdir = dest)),
    error = function(e) character()
  )
  if (length(extracted) > 0) TRUE else "utils::unzip() extracted nothing"
}

# Download one artifact by id into a directory; NULL when it cannot be had,
# with a line in the log saying which of the ways it failed.
fetch_artifact_id <- function(id, dest, what = paste("artifact", id)) {
  if (!gh_ok() || !nzchar(gh_repo())) {
    inform(what, ": not fetched (no gh, or no token with `actions: read`)")
    return(NULL)
  }
  zip <- tempfile(fileext = ".zip")
  on.exit(unlink(zip), add = TRUE)
  err <- tempfile(fileext = ".err")
  on.exit(unlink(err), add = TRUE)
  started <- Sys.time()
  # Quoted: system2() quotes the command, but not the arguments.
  args <- shQuote(c("api", sprintf("repos/%s/actions/artifacts/%s/zip", gh_repo(), id)))
  status <- tryCatch(
    suppressWarnings(system2("gh", args, stdout = zip, stderr = err)),
    error = function(e) 1L
  )
  elapsed <- as.numeric(difftime(Sys.time(), started, units = "secs"))
  bytes <- if (file.exists(zip)) file.size(zip) else 0
  if (!identical(as.integer(status), 0L) || bytes == 0) {
    detail <- stderr_tail(err)
    inform(sprintf(
      "%s: download failed after %.0f s -- gh exited %d, %s written%s",
      what,
      elapsed,
      as.integer(status),
      format_bytes(bytes),
      if (nzchar(detail)) paste0(": ", detail) else ""
    ))
    return(NULL)
  }
  inform(sprintf(
    "%s: downloaded %s in %.0f s (%.0f MB/s)",
    what,
    format_bytes(bytes),
    elapsed,
    bytes / 1e6 / max(elapsed, 1)
  ))
  unpacked <- unzip_into(zip, dest)
  if (!isTRUE(unpacked)) {
    inform(what, ": the download is not usable -- ", unpacked)
    return(NULL)
  }
  dest
}

# Fetch one named artifact of one run; NULL when the run does not have it, it
# has expired, or it cannot be downloaded -- and the log says which.
fetch_artifact <- function(run_id, name, dest) {
  ids <- run_artifacts(run_id)
  id <- unname(ids[names(ids) == name])
  what <- sprintf("%s of run %s", name, run_id)
  if (length(id) == 0) {
    inform(
      what,
      ": the run has no unexpired artifact by that name",
      if (length(ids) > 0) {
        paste0(" (it has: ", paste(sort(names(ids)), collapse = ", "), ")")
      } else {
        " (and none at all, or gh could not list them)"
      }
    )
    return(NULL)
  }
  fetch_artifact_id(id[[1]], dest, what)
}

# ------------------------------------------------------- library helpers ----

# revdep2 carried a whole installed library between runs as a tar artifact,
# with pack/unpack/restore machinery to match. The universe *image* replaced
# all of that: the library travels inside the image, and reuse is a registry
# pull. What survives is the one helper that never cared where a library came
# from.

# The packages of `lib` a caller may still want: everything not already
# installed there, and nothing this session has loaded -- a package must never
# be overwritten underneath the driver that is using it.
missing_from <- function(lib, wanted) {
  setdiff(
    unique(unlist(wanted, use.names = FALSE)),
    c(list.dirs(lib, full.names = FALSE, recursive = FALSE), loadedNamespaces())
  )
}

# ------------------------------------------------------- the last report ----

# The packages an earlier report says were not ok, read from the `revdep/`
# directory in the checkout rather than from a run's artifacts.
#
# That directory is the durable record: the collector commits it back to the
# checked branch, and before this workflow existed `revdepcheck::cloud_check()`
# wrote the same four files there. So both generations are read: `manifest.json`
# when this workflow wrote it (it says exactly which result each package got),
# and otherwise revdepcheck's own markdown -- one `# <package> (<version>)`
# heading per package in problems.md and failures.md, plus the "Failed to
# check" table in README.md, which is where a package that produced no
# comparison at all is named.
report_packages <- function(dir) {
  none <- list(packages = character(), source = "")
  if (!nzchar(dir %||% "") || !dir.exists(dir)) {
    return(none)
  }
  manifest <- file.path(dir, "manifest.json")
  if (file.exists(manifest)) {
    entries <- tryCatch(read_json(manifest), error = function(e) NULL)
    if (length(entries) > 0) {
      names <- vapply(entries, function(e) e$package %||% "", character(1))
      results <- vapply(entries, function(e) e$result %||% "", character(1))
      take <- nzchar(names) & vapply(results, needs_recheck, logical(1))
      if (any(take)) {
        return(list(
          packages = sort(unique(names[take])),
          source = "manifest.json"
        ))
      }
    }
  }
  headings <- function(file) {
    if (!file.exists(file)) {
      return(character())
    }
    lines <- grep("^# ", readLines(file, warn = FALSE), value = TRUE)
    trimws(sub("^# ([^ (]+).*$", "\\1", lines))
  }
  failed_table <- function(file) {
    if (!file.exists(file)) {
      return(character())
    }
    lines <- readLines(file, warn = FALSE)
    from <- grep("^#+ +Failed to check", lines)
    if (length(from) == 0) {
      return(character())
    }
    after <- grep("^#+ ", lines)
    after <- after[after > from[[1]]]
    block <- lines[seq(
      from[[1]],
      if (length(after) > 0) after[[1]] - 1L else length(lines)
    )]
    cells <- trimws(sub(
      "^\\|([^|]*)\\|.*$",
      "\\1",
      grep("^\\|", block, value = TRUE)
    ))
    # Drop the header and the alignment row; what is left is one package each.
    cells[nzchar(cells) & cells != "package" & !grepl("^:?-+:?$", cells)]
  }
  packages <- unique(c(
    headings(file.path(dir, "problems.md")),
    headings(file.path(dir, "failures.md")),
    failed_table(file.path(dir, "README.md"))
  ))
  list(
    packages = sort(packages[nzchar(packages)]),
    source = "problems.md, failures.md, README.md"
  )
}

# --------------------------------------------------------- measured timings --

# What a run measured about itself, so the next plan can stop guessing.
#
# The collector writes one `timings.json` per run -- a row per package (how
# long its checks actually took here, next to what CRAN reports for it) and a
# row per shard (job, install and check minutes, next to what the plan
# predicted) -- and publishes it as the small `revdepx-timings` artifact,
# separate from the report so
# a plan reads it without downloading anything else. Runs of either revdepx
# workflow publish and consume the same artifact: measured seconds are
# canonical per-half wall clock, so the two engines share one pool.
#
# Three constants come out of it, each a median over what actually happened,
# and each NULL when the runs measured nothing usable -- the caller keeps its
# default then. `runs` is youngest first; a younger measurement of a package
# wins, and the constants pool every row there is.

read_timings <- function(dir) {
  if (!nzchar(dir %||% "")) {
    return(NULL)
  }
  path <- file.path(dir, "timings.json")
  if (!file.exists(path)) {
    return(NULL)
  }
  tryCatch(read_json(path), error = function(e) NULL)
}

# Seconds one check of a package took here, per package, youngest run first.
measured_check_seconds <- function(runs) {
  out <- stats::setNames(numeric(), character())
  for (run in runs) {
    for (row in run$packages %||% list()) {
      seconds <- suppressWarnings(as.numeric(row$seconds %||% NA))
      if (
        is.null(row$package) ||
          row$package %in% names(out) ||
          is.na(seconds) ||
          seconds <= 0
      ) {
        next
      }
      out[[row$package]] <- seconds
    }
  }
  out
}

# The medians the plan's cost model runs on:
#   check_scale     - check seconds here per second CRAN reports (T_total);
#                     these runners are not CRAN's machines
#   setup_minutes   - per-shard fixed cost, from job start to the driver's
#                     first line: the runner image, R, the artifacts, and now
#                     the universe image pull
#   install_seconds - marginal cost of one more dependency in a shard's union
#                     (zero on the image path; measured only when a shard fell
#                     back to building its own)
#
# `engine` filters the *shard* rows: the per-package `seconds` is canonical
# per-half wall clock in both engines and pools freely, but a shard's setup
# and install minutes are shaped by how that engine provisions and runs its
# checks, so only same-engine runs may vote on those. Runs written before the
# field existed carry no `engine` and are excluded from the shard medians.
calibration <- function(runs, engine = NULL) {
  scales <- numeric()
  setups <- numeric()
  installs <- numeric()
  packages <- 0L
  shards <- 0L
  for (run in runs) {
    for (row in run$packages %||% list()) {
      seconds <- suppressWarnings(as.numeric(row$seconds %||% NA))
      cran <- suppressWarnings(as.numeric(row$t_total %||% NA))
      packages <- packages + 1L
      if (!is.na(seconds) && !is.na(cran) && seconds > 0 && cran > 0) {
        scales <- c(scales, seconds / cran)
      }
    }
    if (!is.null(engine) && !identical(run$engine %||% "", engine)) {
      next
    }
    for (row in run$shards %||% list()) {
      shards <- shards + 1L
      job <- suppressWarnings(as.numeric(row$job_minutes %||% NA))
      script <- suppressWarnings(as.numeric(row$script_minutes %||% NA))
      if (!is.na(job) && !is.na(script) && job >= script) {
        setups <- c(setups, job - script)
      }
      minutes <- suppressWarnings(as.numeric(row$install_minutes %||% NA))
      count <- suppressWarnings(as.numeric(row$install_packages %||% NA))
      if (!is.na(minutes) && !is.na(count) && count > 0) {
        installs <- c(installs, minutes * 60 / count)
      }
    }
  }
  median_or_null <- function(x) {
    if (length(x) == 0) NULL else unname(stats::median(x))
  }
  list(
    check_scale = median_or_null(scales),
    setup_minutes = median_or_null(setups),
    install_seconds = median_or_null(installs),
    packages = packages,
    shards = shards,
    runs = length(runs)
  )
}

# How long each shard's *job* took, by shard index. The driver can time itself,
# but not the minutes before it starts -- the runner image, R, pandoc, TinyTeX,
# the artifact downloads. That gap is exactly the per-shard setup cost the plan
# charges for every extra shard, so it is measured here, in the one job that
# runs after all the shards and can still ask the API about them.
run_shard_job_minutes <- function(run_id) {
  empty <- stats::setNames(numeric(), character())
  if (!gh_ok() || !nzchar(gh_repo())) {
    return(empty)
  }
  rows <- character()
  for (page in 1:5) {
    got <- gh_lines(
      "api",
      sprintf(
        "repos/%s/actions/runs/%s/jobs?per_page=100&page=%d",
        gh_repo(),
        run_id,
        page
      ),
      "--jq",
      ".jobs[] | [.name, .started_at, .completed_at] | @tsv"
    )
    got <- if (is.null(got)) character() else got[nzchar(got)]
    rows <- c(rows, got)
    if (length(got) < 100) {
      break
    }
  }
  out <- empty
  stamp <- function(x) {
    as.POSIXct(x, format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")
  }
  for (row in rows) {
    fields <- strsplit(row, "\t", fixed = TRUE)[[1]]
    if (length(fields) < 3 || !grepl("^shard [0-9]+ ", fields[[1]])) {
      next
    }
    index <- sub("^shard ([0-9]+) .*$", "\\1", fields[[1]])
    from <- stamp(fields[[2]])
    to <- stamp(fields[[3]])
    if (is.na(from) || is.na(to) || to < from) {
      next
    }
    minutes <- as.numeric(difftime(to, from, units = "mins"))
    # A re-run reports the later attempt last; it is the one that produced the
    # artifact the collector is reading.
    out[[index]] <- minutes
  }
  out
}

# ------------------------------------------------------------ CRAN metadata --

cran_repo <- function() {
  env_chr("REVDEPX_CRAN_MIRROR", "https://cloud.r-project.org")
}

# available.packages() for the canonical CRAN mirror, fetched once.
cran_db <- local({
  db <- NULL
  function() {
    if (is.null(db)) {
      inform("Fetching CRAN package metadata from ", cran_repo())
      # No R_version filter on purpose (the containers may run a newer R
      # than this script), but OS_type must apply: run 33777134786 planned
      # hespdiv, an `OS_type: windows` package, three runs in a row -- the
      # shard's download.packages(), which does filter by OS, then refused
      # it each time ("no package 'hespdiv' at the repositories"), and the
      # report carried a permanent phantom error for a package Linux can
      # never check.
      db <<- utils::available.packages(
        repos = cran_repo(),
        filters = c("CRAN", "duplicates", "OS_type")
      )
    }
    db
  }
})

base_packages <- function() {
  rownames(utils::installed.packages(priority = c("base", "recommended")))
}

# The Bioconductor repositories matching the running R version -- software,
# annotation, experiment and workflows, the four that hold packages a
# dependency field can name. The version mapping is the one
# setRepositories() itself uses (in utils since R 4.5, in tools before
# that); it is an internal, so an R that keeps it somewhere else degrades to
# "no Bioconductor metadata" rather than an error. R_BIOC_VERSION overrides
# the mapping, as it does for base R.
bioc_repos <- function() {
  mapping <- function(ns) {
    as.character(get(
      ".BioC_version_associated_with_R_version",
      envir = getNamespace(ns)
    )())
  }
  version <- tryCatch(
    mapping("utils"),
    error = function(e) tryCatch(mapping("tools"), error = function(e) NA)
  )
  if (is.na(version) || !nzchar(version)) {
    return(character())
  }
  mirror <- env_chr("REVDEPX_BIOC_MIRROR", "https://bioconductor.org")
  c(
    BioCsoft = sprintf("%s/packages/%s/bioc", mirror, version),
    BioCann = sprintf("%s/packages/%s/data/annotation", mirror, version),
    BioCexp = sprintf("%s/packages/%s/data/experiment", mirror, version),
    BioCworkflows = sprintf("%s/packages/%s/workflows", mirror, version)
  )
}

# cran_db() plus the Bioconductor repositories: the metadata to resolve
# *dependencies* against, as opposed to the metadata that decides what is a
# CRAN reverse dependency. In run 32158907637, 121 packages came back
# `depmissing` on Bioconductor dependencies (DESeq2, pwalign, ...) that pak
# would have installed happily -- pinned_repos() has carried the Bioconductor
# repositories all along -- but install_closure() intersected every
# dependency list with CRAN's rownames, so the planner dropped the names
# before pak ever saw them. Enumeration stays on cran_db(): the packages
# *checked* are CRAN's reverse dependencies, and this db only widens what
# they may depend on.
#
# On a Bioconductor fetch failure the CRAN half still serves, degraded to
# exactly the old behaviour; the pinned install repositories are resolved
# independently by pak, so a blip here cannot skew an install, only thin a
# closure.
dep_db <- local({
  db <- NULL
  function() {
    if (is.null(db)) {
      cran <- cran_db()
      repos <- bioc_repos()
      bioc <- if (length(repos) == 0) {
        NULL
      } else {
        inform(
          "Fetching Bioconductor package metadata (",
          paste(names(repos), collapse = ", "),
          ")"
        )
        tryCatch(
          utils::available.packages(repos = repos, filters = "duplicates"),
          error = function(e) {
            inform(
              "Could not fetch Bioconductor metadata: ",
              conditionMessage(e)
            )
            NULL
          }
        )
      }
      if (is.null(bioc) || nrow(bioc) == 0) {
        db <<- cran
      } else {
        merged <- rbind(cran, bioc[, colnames(cran), drop = FALSE])
        merged <- merged[!duplicated(rownames(merged)), , drop = FALSE]
        inform(
          "Dependency metadata: ",
          nrow(cran),
          " CRAN + ",
          nrow(merged) - nrow(cran),
          " Bioconductor packages"
        )
        db <<- merged
      }
    }
    db
  }
})

# The packages that must be installed to check `packages`: their hard
# dependencies and direct suggests, plus the recursive hard dependencies of
# all of those. One list per element of `packages`.
install_closure <- function(packages, db) {
  direct <- tools::package_dependencies(packages, db = db, which = "most")
  pool <- unique(unlist(direct, use.names = FALSE))
  pool <- intersect(pool, rownames(db))
  recursive <- tools::package_dependencies(
    pool,
    db = db,
    which = "strong",
    recursive = TRUE
  )
  lapply(direct, function(deps) {
    deps <- intersect(deps, rownames(db))
    full <- unique(c(deps, unlist(recursive[deps], use.names = FALSE)))
    sort(setdiff(intersect(full, rownames(db)), base_packages()))
  })
}

# The same set, cut into installable pieces: chunks of at most `size`,
# ordered so that every strong dependency inside the set is installed before
# the package that needs it.
#
# One pak call for a few thousand refs means one resolution of a few thousand
# refs, and that is where the preflight of run 31270092803 died: ten minutes
# inside pak, not one install started, then the runner was shut down. The
# resolution is the part that does not degrade gracefully, so it is the part
# that is kept small -- each chunk resolves against a library where its
# dependencies already are.
#
# It also changes what a failure costs. Whatever earlier chunks installed is
# on disk and is skipped on the next attempt, so a chunk that dies costs a
# chunk; and the log says which one, which a single opaque call never could.
#
# The size is a trade, and 100 was too far towards small. A chunk pays one
# resolution whether or not it installs anything: run 31930350338's preflight
# logged `80 pkgs + 214 deps: kept 294 [44s]` for a chunk that built nothing at
# all. At 100, the 4406-package universe is 45 chunks and something like half
# an hour of resolution before a single build starts -- on the critical path,
# since every shard waits for the preflight. At 400 it is 12 chunks. A chunk
# that dies costs four times as much to redo, which is the price; the counter
# is that the resolution which killed run 31270092803 was a few thousand refs,
# and 400 is an order of magnitude below that.
#
# Ordering is on strong dependencies only. Suggests are in the set because a
# revdep's *check* needs them, not its installation, and they are what makes
# the graph cyclic -- ordering on them would order on nothing.
install_chunks <- function(pkgs, db, size = 400) {
  pkgs <- unique(pkgs)
  if (length(pkgs) == 0) {
    return(list())
  }
  deps <- tools::package_dependencies(pkgs, db = db, which = "strong")
  index <- stats::setNames(seq_along(pkgs), pkgs)
  needs <- lapply(pkgs, function(p) {
    unname(index[intersect(deps[[p]] %||% character(), pkgs)])
  })
  done <- logical(length(pkgs))
  order <- integer()
  repeat {
    ready <- which(!done & vapply(needs, function(d) all(done[d]), logical(1)))
    if (length(ready) == 0) {
      break
    }
    done[ready] <- TRUE
    order <- c(order, ready)
  }
  # A cycle, or a dependency this index cannot describe, leaves packages that
  # never become ready. They go last, together, for pak to sort out among
  # themselves -- which is what it was doing for the whole set before.
  order <- c(order, which(!done))
  unname(split(pkgs[order], ceiling(seq_along(order) / size)))
}

# Install one chunked set, reporting each chunk as it lands. Returns TRUE when
# every chunk succeeded; a caller that cares which packages are missing asks
# the library, not this.
# Run `fun` in a child R process and give up on it after `timeout_seconds`.
#
# Nothing this workflow calls out to has a time limit of its own, and in run
# 31276552027 that cost a job: `pak::pkg_install()` on chunk 21 never returned,
# and the preflight sat at one busy core and flat memory for 76 minutes until
# it was cancelled by hand. There is no loop to break there -- the call simply
# does not come back -- so the only thing that helps is a clock.
#
# Two details make this work where `tryCatch` and `setTimeLimit` do not. The
# child inherits this process's stdout and stderr, so pak's progress still
# streams to the job log with nobody draining a pipe; and it is killed with
# `kill_tree()`, because what wedges is pak's *own* subprocess, a grandchild,
# which outlives a plain kill of its parent.
#
# It also isolates the calls from each other. Chunks 14 and 20 of that run had
# already failed with "error in pak subprocess" before 21 hung, and one wedged
# pak subprocess used to poison every call after it; now each one starts a
# fresh R and a fresh pak.
#
# callr comes with rcmdcheck, and the preflight installs it outright. Where it
# is missing there is no way to bound anything, so the call is made inline --
# the old behaviour, announced rather than silent.
run_with_timeout <- function(fun, args = list(), timeout_seconds, label = "") {
  if (!requireNamespace("callr", quietly = TRUE)) {
    inform(label, ": callr is not installed, running without a time limit")
    value <- NULL
    message <- tryCatch(
      {
        value <- do.call(fun, args)
        ""
      },
      error = function(e) conditionMessage(e)
    )
    return(list(
      ok = !nzchar(message),
      timed_out = FALSE,
      message = message,
      value = value
    ))
  }
  process <- callr::r_bg(
    fun,
    args = args,
    stdout = "",
    stderr = "2>&1",
    supervise = TRUE
  )
  process$wait(timeout = timeout_seconds * 1000)
  if (process$is_alive()) {
    process$kill_tree()
    process$wait(timeout = 10000)
    return(list(
      ok = FALSE,
      timed_out = TRUE,
      message = sprintf(
        "no output and no result after %s; killed",
        format_duration(timeout_seconds)
      )
    ))
  }
  value <- NULL
  message <- tryCatch(
    {
      value <- process$get_result()
      ""
    },
    # callr reports a child's failure wrapped in its own condition, and the
    # wrapper is three lines of scaffolding around the one line that says what
    # broke -- which is the line that ends up in depfail.json.
    error = function(e) conditionMessage(e$parent %||% e)
  )
  list(
    ok = !nzchar(message),
    timed_out = FALSE,
    message = message,
    value = value
  )
}

format_duration <- function(seconds) {
  if (seconds < 90) {
    sprintf("%.0f s", seconds)
  } else if (seconds < 90 * 60) {
    sprintf("%.0f min", seconds / 60)
  } else {
    # A shard runs for hours, and "217 min left" is a number the reader has to
    # divide before it means anything.
    sprintf("%.1f h", seconds / 3600)
  }
}

# ---------------------------------------------------- pak's repositories ----

# The repository set, resolved once and pinned.
#
# pak reads `getOption("repos")` and adds the Bioconductor repositories to it
# the moment something needs them -- and its metadata database is keyed on the
# set. In run 31282820357 the first Bioconductor package landed in chunk 11 of
# 45; the set went from 1 repository to 6 and the database from 7 files to 9,
# the rebuilt database came back empty ("0 B in 9 files", parsed in 20 ms
# rather than 9 s), and from chunk 12 on pak could not find a single package
# on CRAN. Not vctrs -- all 4406 of them.
#
# Installing in chunks is what made that reachable: 45 short-lived pak
# processes each re-read the database from disk, so the set changing under one
# of them poisons all the rest. Resolving the set here, before the first
# install, is what stops it from changing at all.
pinned_repos <- local({
  repos <- NULL
  function() {
    if (is.null(repos)) {
      repos <<- tryCatch(
        {
          got <- pak::repo_get(bioc = TRUE)
          stats::setNames(got$url, got$name)
        },
        error = function(e) {
          inform("Could not resolve the repository set: ", conditionMessage(e))
          getOption("repos")
        }
      )
      inform(
        "Repositories pinned: ",
        length(repos),
        " (",
        paste(names(repos), collapse = ", "),
        ")"
      )
    }
    repos
  }
})

# ------------------------------------------------------ pak's metadata db ----

# Packages that must be in any CRAN snapshot. If pak cannot see these, it
# cannot see anything, and what follows is not a dependency problem.
metadata_probe <- function() {
  strsplit(env_chr("REVDEPX_METADATA_PROBE", "vctrs,cli,R6"), ",")[[1]]
}

metadata_timeout_seconds <- function() {
  env_num("REVDEPX_METADATA_TIMEOUT_MINUTES", 10) * 60
}

# How many of those packages pak can actually see, or -1 when it could not be
# asked. `meta_list()` is the low-level view of the database itself, so a
# broken one answers immediately instead of being reported as a dependency
# that cannot be solved.
#
# It has to run in a fresh process. pak keeps the parsed database in the
# memory of its own subprocess, so a session that already loaded a good one
# goes on reporting health that is no longer on disk -- which is why the break
# in that run only surfaced at the *next* chunk.
metadata_found <- function() {
  run <- run_with_timeout(
    function(repos, probe) {
      options(repos = repos)
      nrow(pak::meta_list(pkg = probe))
    },
    args = list(repos = pinned_repos(), probe = metadata_probe()),
    timeout_seconds = metadata_timeout_seconds(),
    label = "pak metadata probe"
  )
  if (!isTRUE(run$ok)) {
    # Not the same thing as an empty database, and saying so matters: in run
    # 31303054725 `/tmp` filled, callr could no longer start R, and every
    # probe from then on failed to run at all -- reported as "pak sees 0 of
    # 3", which reads like the database being empty and is a completely
    # different problem.
    inform("Could not ask pak what it can see: ", run$message)
    return(-1L)
  }
  as.integer(run$value %||% 0L)
}

# Delete the metadata database and fetch it again.
#
# `meta_clean(force = TRUE)` is the part that matters. pak's own repair --
# `meta_update()` alone -- is what produced "0 B in 9 files": it re-validated
# the broken files, found them unchanged, and left the empty database in
# place. Only deleting it first gets a good one back.
metadata_repair <- function() {
  run_with_timeout(
    function(repos) {
      options(repos = repos)
      pak::meta_clean(force = TRUE)
      pak::meta_update()
      invisible(NULL)
    },
    args = list(repos = pinned_repos()),
    timeout_seconds = metadata_timeout_seconds(),
    label = "pak metadata rebuild"
  )
}

# Assess pak's metadata database, and rebuild it at most once per job.
#
# Returns "ok", "repaired" or "broken". Once per job is deliberate: a database
# that is still empty after a clean rebuild is not a stale cache, and clearing
# it in a loop would spend the job's minutes hiding that.
ensure_metadata <- local({
  repaired <- FALSE
  function(where = "") {
    prefix <- if (nzchar(where)) paste0(where, ": ") else ""
    wanted <- length(metadata_probe())
    found <- metadata_found()
    if (found >= wanted) {
      return("ok")
    }
    # A probe that could not be run says nothing about the database, and
    # clearing it on that evidence would spend the one rebuild on a machine
    # problem -- which is exactly what would have happened when R could no
    # longer start.
    if (found < 0) {
      inform(prefix, "the state of the metadata database is unknown")
      return("unknown")
    }
    if (repaired) {
      inform(sprintf(
        "%spak still sees %d of %d probe packages after a rebuild; not clearing again",
        prefix,
        max(found, 0L),
        wanted
      ))
      return("broken")
    }
    repaired <<- TRUE
    inform(sprintf(
      "%spak sees %d of %d packages that must exist -- its metadata database is unusable; clearing and rebuilding it once",
      prefix,
      max(found, 0L),
      wanted
    ))
    rebuild <- metadata_repair()
    if (!isTRUE(rebuild$ok)) {
      inform(prefix, "the rebuild failed: ", rebuild$message)
      return("broken")
    }
    found <- metadata_found()
    if (found >= wanted) {
      inform(prefix, "the metadata database is usable again")
      return("repaired")
    }
    inform(sprintf(
      "%sstill %d of %d after the rebuild; the repositories themselves are not answering",
      prefix,
      max(found, 0L),
      wanted
    ))
    "broken"
  }
})

# -------------------------------------------------- system requirements ----

sysreqs_timeout_seconds <- function() {
  env_num("REVDEPX_SYSREQS_TIMEOUT_MINUTES", 20) * 60
}

# The system requirements of packages that were unpacked rather than installed.
#
# pak installs system requirements for the packages *it* installs. Everything
# restored from a library tarball -- this run's preflight library, an earlier
# run's donor -- it never sees, so their apt packages are never resolved: 170
# of a shard's 436 dependencies arrived that way in run 31282820357. It
# usually survives, because something else pulls the same apt package in or
# the runner image already carries it; when it does not, a restored binary
# cannot load its shared library, and a shard has no load test to catch that.
#
# So the library is asked directly rather than the install list, which is what
# makes this cover donor libraries from earlier runs too -- their apt state was
# never recorded anywhere, and pak can still read what they left behind.
#
# `sysreqs_check_installed()` says what is missing and which packages want it,
# which is worth printing either way; `sysreqs_fix_installed()` installs it.
ensure_sysreqs <- function(lib = NULL, label = "") {
  prefix <- if (nzchar(label)) paste0(label, ": ") else ""

  survey <- function(what) {
    run <- run_with_timeout(
      function(repos, lib) {
        options(repos = repos)
        got <- pak::sysreqs_check_installed(library = lib)
        absent <- !got$installed
        list(
          total = nrow(got),
          missing = as.character(got$system_package[absent]),
          wanted_by = vapply(
            got$packages[absent],
            function(p) paste(p, collapse = ", "),
            character(1)
          )
        )
      },
      args = list(repos = pinned_repos(), lib = lib),
      timeout_seconds = sysreqs_timeout_seconds(),
      label = paste0(prefix, what)
    )
    if (!isTRUE(run$ok)) {
      inform(prefix, "could not check system requirements: ", run$message)
      return(NULL)
    }
    run$value
  }

  before <- survey("system requirements survey")
  if (is.null(before)) {
    return(invisible(NULL))
  }
  if (length(before$missing) == 0) {
    inform(sprintf(
      "%sall %d system requirement(s) of the installed library are present",
      prefix,
      before$total
    ))
    return(invisible(character()))
  }
  inform(sprintf(
    "%s%d of %d system requirement(s) are missing: %s",
    prefix,
    length(before$missing),
    before$total,
    paste(
      sprintf("%s (%s)", before$missing, before$wanted_by),
      collapse = "; "
    )
  ))

  fixed <- run_with_timeout(
    function(repos, lib) {
      options(repos = repos)
      pak::sysreqs_fix_installed(library = lib)
      invisible(NULL)
    },
    args = list(repos = pinned_repos(), lib = lib),
    timeout_seconds = sysreqs_timeout_seconds(),
    label = paste0(prefix, "system requirements install")
  )
  if (!isTRUE(fixed$ok)) {
    inform(prefix, "installing them failed: ", fixed$message)
    return(invisible(before$missing))
  }

  after <- survey("system requirements re-survey")
  still <- if (is.null(after)) before$missing else after$missing
  if (length(still) == 0) {
    inform(sprintf(
      "%sinstalled %d missing system package(s)",
      prefix,
      length(before$missing)
    ))
  } else {
    inform(sprintf(
      "%s%d system package(s) are still missing: %s",
      prefix,
      length(still),
      paste(still, collapse = ", ")
    ))
  }
  invisible(still)
}

# The system requirements of the packages the shard is about to *check*.
#
# `ensure_sysreqs()` above reads the installed library, which is the right
# question for dependencies and the wrong one for the revdeps themselves: a
# shard installs each package's dependency closure and never the package, so
# the revdep under test is never in that library. `R CMD check` builds it from
# its tarball, and nothing has resolved its `SystemRequirements` -- not
# `PKG_SYSREQS`, which covers what pak installs, and not
# `sysreqs_fix_installed()`, which covers what is on disk.
#
# Libra is the case that found this. It declares `SystemRequirements: gsl`,
# `pak::pkg_sysreqs("Libra")` resolves it to `libgsl0-dev` without difficulty,
# and nobody asked: the check failed to compile `LBLasso.c` under both versions
# with `fatal error: gsl/gsl_vector.h: No such file or directory`, which the
# report then recorded as a package that fails to install rather than as a
# runner that could not build it.
#
# Only the missing ones are installed. `sysreqs_list_system_packages()` says
# what is already there, including what other packages *provide* -- a virtual
# package satisfies a dependency just as a real one does -- so a shard whose
# requirements the image already carries runs no apt at all.
ensure_check_sysreqs <- function(packages, label = "") {
  prefix <- if (nzchar(label)) paste0(label, ": ") else ""
  if (length(packages) == 0) {
    return(invisible(character()))
  }

  run <- run_with_timeout(
    function(repos, packages) {
      options(repos = repos)
      # In chunks: one pak::pkg_sysreqs() call over 3435 packages grew past
      # 14 GB and was OOM-killed (run 32114635495) -- pak solves the whole
      # set in one subprocess. Per-chunk calls each get a fresh, bounded
      # subprocess, and the union of apt packages is the same.
      wanted <- character()
      for (part in split(
        packages,
        ceiling(seq_along(packages) / 300)
      )) {
        # Per-chunk tolerance: one chunk pak cannot solve (a package gone
        # from the repositories, a resolution hiccup) must not cost the
        # other chunks' system packages -- run 32148999976 lost the whole
        # survey to a single subprocess error.
        wanted <- unique(c(
          wanted,
          tryCatch(
            unlist(
              pak::pkg_sysreqs(part)$packages$system_packages,
              use.names = FALSE
            ),
            error = function(e) {
              message(
                "sysreqs survey chunk failed (",
                conditionMessage(e),
                "); continuing with the other chunks"
              )
              character()
            }
          )
        ))
      }
      have <- pak::sysreqs_list_system_packages()
      present <- unique(c(
        have$package,
        unlist(have$provides, use.names = FALSE)
      ))
      list(wanted = wanted, missing = setdiff(wanted, present))
    },
    args = list(repos = pinned_repos(), packages = packages),
    timeout_seconds = sysreqs_timeout_seconds(),
    label = paste0(prefix, "check system requirements survey")
  )
  if (!isTRUE(run$ok)) {
    inform(
      prefix,
      "could not resolve the checked packages' system requirements: ",
      run$message
    )
    return(invisible(NULL))
  }

  if (length(run$value$missing) == 0) {
    inform(sprintf(
      "%sall %d system requirement(s) of the %d package(s) to check are present",
      prefix,
      length(run$value$wanted),
      length(packages)
    ))
    return(invisible(character()))
  }
  inform(sprintf(
    "%s%d of %d system requirement(s) of the packages to check are missing: %s",
    prefix,
    length(run$value$missing),
    length(run$value$wanted),
    paste(run$value$missing, collapse = ", ")
  ))

  # apt directly rather than through pak: `sysreqs_fix_installed()` reads the
  # library, and these packages are not in it. Failure is reported and not
  # fatal -- the check will fail either way, and it will say why more clearly
  # than this can.
  #
  # `update` first, always: the base image deletes /var/lib/apt/lists after
  # its own installs (as images do), and pak only refreshes them when it
  # installs a sysreq of its own in the same container. Without this, every
  # install below dies with "Unable to locate package" -- warned, non-fatal,
  # and exactly the silent gap this function exists to close.
  sudo <- if (identical(Sys.info()[["effective_user"]], "root")) {
    character()
  } else {
    "sudo"
  }
  update_status <- suppressWarnings(system2(
    if (length(sudo)) "sudo" else "apt-get",
    c(
      if (length(sudo)) "apt-get",
      "-o",
      "DPkg::Lock::Timeout=300",
      "update"
    )
  ))
  if (!identical(update_status, 0L)) {
    inform(prefix, "apt-get update exited ", update_status, "; trying anyway")
  }
  status <- suppressWarnings(system2(
    if (length(sudo)) "sudo" else "apt-get",
    c(
      if (length(sudo)) "apt-get",
      "-o",
      "DPkg::Lock::Timeout=300",
      "install",
      "-y",
      "--no-install-recommends",
      run$value$missing
    )
  ))
  if (!identical(status, 0L)) {
    inform(prefix, "apt-get exited ", status, "; the checks run anyway")
    return(invisible(run$value$missing))
  }
  inform(sprintf(
    "%sinstalled %d system package(s) for the packages to check",
    prefix,
    length(run$value$missing)
  ))
  invisible(character())
}

# One pak install, bounded. Separate from install_in_chunks() because the
# per-package retry after a failed chunk needs exactly the same treatment: it
# is the same call, one package at a time, and it used to be just as
# unbounded.
pak_install <- function(
  pkgs,
  lib = NULL,
  upgrade = FALSE,
  timeout_seconds,
  label = ""
) {
  run_with_timeout(
    function(pkgs, lib, upgrade, repos) {
      # The pin travels into every child: an option set in the parent is not
      # inherited, and a child that resolves its own repository set is a child
      # that can change it.
      options(repos = repos)
      if (is.null(lib)) {
        pak::pkg_install(pkgs, ask = FALSE, upgrade = upgrade)
      } else {
        pak::pkg_install(pkgs, lib = lib, ask = FALSE, upgrade = upgrade)
      }
      invisible(NULL)
    },
    args = list(
      pkgs = pkgs,
      lib = lib,
      upgrade = upgrade,
      repos = pinned_repos()
    ),
    timeout_seconds = timeout_seconds,
    label = label
  )
}

# `deadline` is the wall clock past which no further chunk is started. It is
# not a second timeout but the answer to a different question: the per-chunk
# limit stops one call from running for ever, and this stops 45 of them from
# adding up past what the job has. What is left unattempted is named, and the
# caller still gets to pack and publish what did install.
install_in_chunks <- function(
  chunks,
  lib = NULL,
  upgrade = FALSE,
  label = "",
  timeout_seconds = install_timeout_seconds(),
  deadline = NULL
) {
  ok <- TRUE
  prefix <- if (nzchar(label)) paste0(label, ": ") else ""
  for (i in seq_along(chunks)) {
    if (!is.null(deadline) && Sys.time() > deadline) {
      inform(sprintf(
        "%sthe install deadline passed; %d of %d chunk(s) not attempted",
        prefix,
        length(chunks) - i + 1L,
        length(chunks)
      ))
      return(FALSE)
    }
    started <- Sys.time()
    label <- sprintf("%schunk %d/%d", prefix, i, length(chunks))
    run <- pak_install(
      chunks[[i]],
      lib = lib,
      upgrade = upgrade,
      timeout_seconds = timeout_seconds,
      label = label
    )
    # A chunk that fails may have failed because pak could not see the
    # repositories at all, which is a different thing from a package that will
    # not install -- and it is the state that, left alone, fails every chunk
    # after it too. Only a rebuild that actually changed something earns the
    # retry; a healthy database means the failure was real.
    if (
      !run$ok && identical(ensure_metadata(sub(": $", "", prefix)), "repaired")
    ) {
      inform(prefix, "retrying chunk ", i, " against the rebuilt metadata")
      run <- pak_install(
        chunks[[i]],
        lib = lib,
        upgrade = upgrade,
        timeout_seconds = timeout_seconds,
        label = label
      )
    }
    if (!run$ok) {
      inform(prefix, "chunk ", i, " failed: ", run$message)
    }
    ok <- ok && run$ok
    inform(sprintf(
      "%schunk %d/%d (%d packages) %s after %.1f min",
      prefix,
      i,
      length(chunks),
      length(chunks[[i]]),
      if (run$ok) {
        "installed"
      } else if (run$timed_out) {
        "timed out"
      } else {
        "failed"
      },
      as.numeric(difftime(Sys.time(), started, units = "mins"))
    ))
  }
  ok
}

install_timeout_seconds <- function() {
  env_num("REVDEPX_INSTALL_TIMEOUT_MINUTES", 20) * 60
}

# Fingerprint of the *versions* of everything a check installs, from CRAN
# metadata. Two runs whose fingerprints agree resolved the same dependency
# tree, so an old-version check result can be carried from one to the other.
dep_fingerprint <- function(deps, db) {
  if (length(deps) == 0) {
    return("empty")
  }
  lines <- sort(paste(deps, db[deps, "Version"]))
  path <- tempfile("fingerprint-")
  on.exit(unlink(path))
  writeLines(lines, path)
  unname(tools::md5sum(path))
}

# ------------------------------------------------------------ result labels --

# Collapse an rcmdcheck comparison (or a failure shim) into the one word the
# manifest, the collector and the retry selection agree on.
#   ok           -- no new problems
#   newly_broken -- the dev version introduces problems the CRAN version lacks
#   failed       -- the check could not run to a comparable end (install
#                   failure, timeout, error before/around the check)
#   depfail      -- dependencies could not be installed, check not attempted
#   deferred     -- shard deadline hit before this package was checked
#   error        -- the shard driver itself broke on this package
#   missing      -- the plan named it, no shard ever reported it: the job died
#                   (assigned by the collector, never by a shard)
classify_status <- function(status, new_issues) {
  if (status %in% c("+", "-")) {
    if (identical(status, "-") && new_issues > 0) "newly_broken" else "ok"
  } else {
    "failed"
  }
}

# Did `R CMD check` refuse to start because a package this one needs is not
# installed?
#
# That stage is fatal: check reports the one error and stops, in two or three
# seconds, having looked at nothing. When it happens to *both* halves -- and it
# always does, since the two libraries differ only in igraph -- the pair
# compares clean, `compare_checks()` returns `+`, and the verdict is `ok`.
#
# 55 of run 31930350338's 984 `ok` results were that: every one of them a
# package whose Bioconductor dependencies are not on CRAN and so were never
# installed. `SEMgraph` is the clearest -- `1E 0W 0N` on both sides in three
# seconds, reported `ok`, while being genuinely broken by a dev change nobody
# saw because the check never ran.
#
# The check log is the only place this is visible; the status is `+` like any
# other agreeing pair.
aborted_on_dependencies <- function(check) {
  errors <- check$errors %||% character()
  length(errors) > 0 &&
    any(grepl("^checking package dependencies [.]{3} ERROR", errors))
}

# The packages the aborted check named, for the manifest message: the whole
# point of the class is that a reader can see *what* was missing without
# opening the artifact.
missing_dependencies <- function(check) {
  errors <- check$errors %||% character()
  hit <- grep(
    "^checking package dependencies [.]{3} ERROR",
    errors,
    value = TRUE
  )
  if (length(hit) == 0) {
    return(character())
  }
  lines <- strsplit(hit[[1]], "\n", fixed = TRUE)[[1]]
  # `Packages required but not available:` puts them on the next line, quoted;
  # `Package required but not available: 'x'` puts one on the same line.
  named <- grep("required but not available", lines)
  if (length(named) == 0) {
    return(character())
  }
  block <- paste(
    lines[seq(named[[1]], min(named[[1]] + 1L, length(lines)))],
    collapse = " "
  )
  unique(gsub(
    "[‘’']",
    "",
    regmatches(
      block,
      gregexpr("[‘'][^’']+[’']", block)
    )[[1]]
  ))
}

# What a status that `classify_status()` can only call "failed" actually means,
# in words. A reader of the summary has to tell "broken under the dev version"
# apart from "broken everywhere" without opening the artifact, and the one word
# in the manifest cannot say it. Empty for the two statuses that compared.
status_message <- function(status) {
  switch(
    status,
    "+" = ,
    "-" = "",
    "i-" = "installs against the CRAN version, fails to install against the dev version",
    "i+" = "fails to install against either version",
    "t-" = "check timed out against the dev version, not against the CRAN version",
    "t+" = "check timed out against both versions",
    sprintf("check comparison inconclusive (status `%s`)", status)
  )
}

needs_recheck <- function(result) {
  !(result %in% c("ok"))
}

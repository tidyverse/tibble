# Shared helpers for the revdep2 workflow scripts.
# Sourced by plan.R, build.R, shard.R and collect.R; base R plus jsonlite only,
# so every job can use it before any heavyweight dependency is installed.

# ------------------------------------------------------------- environment --

`%||%` <- function(x, y) if (is.null(x)) y else x

env_chr <- function(name, default = "") {
  value <- Sys.getenv(name, unset = "")
  if (identical(value, "")) default else value
}

env_num <- function(name, default) {
  value <- suppressWarnings(as.numeric(env_chr(name)))
  if (length(value) != 1 || is.na(value)) default else value
}

env_flag <- function(name) {
  tolower(env_chr(name)) %in% c("1", "true", "yes")
}

# GitHub run ids passed `.Machine$integer.max` in 2026, so they are carried as
# strings everywhere here: `as.integer("31048405399")` is a silent NA, and an
# NA reaching `if (run > 0)` takes the whole planning job down.
# "0" is the "no such run" sentinel, which is also what the workflow's job
# outputs and plan.json already use.
run_id_chr <- function(x) {
  if (is.null(x) || length(x) != 1 || is.na(x)) "0" else trimws(as.character(x))
}

inform <- function(...) {
  message(paste0(...))
}

now_utc <- function() {
  format(Sys.time(), "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")
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
    function(i) paste0("| ", paste(esc(unlist(df[i, ])), collapse = " | "), " |"),
    character(1)
  )
  c(header, rule, rows)
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
    omitted <- sprintf("... (%d earlier lines omitted)", length(lines) - max_lines)
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

# ------------------------------------------------------------ CRAN metadata --

cran_repo <- function() {
  env_chr("REVDEP2_CRAN_MIRROR", "https://cloud.r-project.org")
}

# available.packages() for the canonical CRAN mirror, fetched once.
cran_db <- local({
  db <- NULL
  function() {
    if (is.null(db)) {
      inform("Fetching CRAN package metadata from ", cran_repo())
      db <<- utils::available.packages(
        repos = cran_repo(),
        filters = c("CRAN", "duplicates")
      )
    }
    db
  }
})

base_packages <- function() {
  rownames(utils::installed.packages(priority = c("base", "recommended")))
}

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
classify_status <- function(status, new_issues) {
  if (status %in% c("+", "-")) {
    if (identical(status, "-") && new_issues > 0) "newly_broken" else "ok"
  } else {
    "failed"
  }
}

needs_recheck <- function(result) {
  !(result %in% c("ok"))
}

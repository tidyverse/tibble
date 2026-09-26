# Choose the R-hub platforms to check the package on, and write them to the
# `config` output as a comma-separated list, empty for none.
#
# Run from the package's checkout. The first of these that is set wins:
#
#   * `REQUESTED`, the `config` input of the action;
#   * `Config/gha/rhub-platforms` in DESCRIPTION, a comma- or space-separated
#     list, or `none` to skip the checks;
#   * the default: `nosuggests` for every package, plus `gcc-asan`,
#     `clang-asan`, `clang-ubsan`, `valgrind` and `rchk` when `src/` holds
#     sources to compile. rchk inspects the package's shared object and fails
#     on a package without one, so it belongs to compiled code only.

requested <- trimws(Sys.getenv("REQUESTED"))
# read.dcf(), not `grep`: a DCF value may wrap onto continuation lines.
declared <- read.dcf("DESCRIPTION", fields = "Config/gha/rhub-platforms")[1, 1]

# The file types R CMD INSTALL compiles from src/.
sources <- dir(
  "src",
  pattern = "[.](c|cc|cpp|cxx|f|f90|f95|m|mm)$",
  ignore.case = TRUE,
  recursive = TRUE
)
compiled <- length(sources) > 0

if (nzchar(requested)) {
  spec <- requested
  origin <- "the `config` input of this run"
} else if (!is.na(declared)) {
  spec <- declared
  origin <- "`Config/gha/rhub-platforms` in DESCRIPTION"
} else if (compiled) {
  spec <- "nosuggests gcc-asan clang-asan clang-ubsan valgrind rchk"
  origin <- "the default for a package with compiled code in src/"
} else {
  spec <- "nosuggests"
  origin <- "the default for a package without compiled code"
}

platforms <- strsplit(trimws(spec), "[[:space:],]+")[[1]]
platforms <- platforms[nzchar(platforms)]

# The list is spliced into a shell command by r-hub/actions/setup,
# so anything but a plain platform name is refused here.
bad <- grep("^[A-Za-z0-9._-]+$", platforms, value = TRUE, invert = TRUE)
if (length(bad) > 0) {
  stop("Not an R-hub platform name: ", paste0("'", bad, "'", collapse = ", "), call. = FALSE)
}
if ("none" %in% platforms) {
  if (length(platforms) > 1) {
    stop("`none` cannot be combined with other platforms.", call. = FALSE)
  }
  platforms <- character()
}

config <- paste(platforms, collapse = ",")
cat("config=", config, "\n", sep = "", file = Sys.getenv("GITHUB_OUTPUT"), append = TRUE)

summary <- c(
  "## R-hub platforms",
  "",
  if (length(platforms) > 0) {
    paste0("Checking on ", paste0("`", platforms, "`", collapse = ", "), ", from ", origin, ".")
  } else {
    paste0("No checks, as set by ", origin, ".")
  },
  ""
)
writeLines(summary)
cat(summary, sep = "\n", file = Sys.getenv("GITHUB_STEP_SUMMARY"), append = TRUE)

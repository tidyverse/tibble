# Work around RStudio's habit of running the "Test package" command
# with --vanilla
if (Sys.getenv("RSTUDIO") != "" && is.null(getOption("testthat.default_reporter"))) {
  options(testthat.default_reporter = c("summary", "progress"))
}

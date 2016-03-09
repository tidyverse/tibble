.onLoad <- function(libname, pkgname) {
  op <- options()
  op.tibble <- list(
    tibble.width = NULL,
    tibble.print_min = 10L,
    tibble.print_max = 20L
  )
  toset <- !(names(op.tibble) %in% names(op))
  if(any(toset)) options(op.tibble[toset])

  invisible()
}

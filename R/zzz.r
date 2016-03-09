#' @name tibble-package
#' @section Package options:
#' Display options for \code{tbl_df}, used by \code{\link{trunc_mat}} and
#' (indirectly) by \code{\link{print.tbl_df}}.
#' \describe{
(op.tibble <- lst(
  #' \item{\code{tibble.print_max}}{Row number threshold: Maximum number of rows
  #'   printed. Set to \code{Inf} to always print all rows.  Default: 20.}
  tibble.print_max = 20L,

  #' \item{\code{tibble.print_min}}{Number of rows printed if row number
  #'   threshold is exceeded. Default: 10.}
  tibble.print_min = 10L,

  #' \item{\code{tibble.width}}{Output width. Default: \code{NULL} (use
  #'   \code{width} option).}
  tibble.width = NULL
#' }
))

.onLoad <- function(libname, pkgname) {
  op <- options()
  toset <- !(names(op.tibble) %in% names(op))
  if(any(toset)) options(op.tibble[toset])

  invisible()
}

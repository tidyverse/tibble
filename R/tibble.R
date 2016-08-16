#' @useDynLib tibble
#' @importFrom Rcpp sourceCpp
#' @import assertthat
#' @importFrom utils head tail
#' @aliases NULL
#' @details The S3 class \code{tbl_df} wraps a local data frame. The main
#' advantage to using a \code{tbl_df} over a regular data frame is the printing:
#' tbl objects only print a few rows and all the columns that fit on one screen,
#' describing the rest of it as text.
#'
#' @section Methods:
#'
#' \code{tbl_df} implements four important base methods:
#'
#' \describe{
#' \item{print}{By default only prints the first 10 rows (at most 20), and the
#'   columns that fit on screen; see \code{\link{print.tbl_df}}}
#' \item{\code{[}}{Never simplifies (drops), so always returns data.frame}
#' \item{\code{[[}, \code{$}}{Calls \code{\link{.subset2}} directly,
#'   so is considerably faster. Returns \code{NULL} if column does not exist,
#'   \code{$} warns.}
#' }
#' @section Important functions:
#' \code{\link{tibble}} and \code{\link{tribble}} for construction,
#' \code{\link{as_tibble}} for coercion,
#' and \code{\link{print.tbl_df}} and \code{\link{glimpse}} for display.
"_PACKAGE"

#' @name tibble-package
#' @section Package options:
#' Display options for \code{tbl_df}, used by \code{\link{trunc_mat}} and
#' (indirectly) by \code{\link{print.tbl_df}}.
#' \describe{
(op.tibble <- list(
  #' \item{\code{tibble.print_max}}{Row number threshold: Maximum number of rows
  #'   printed. Set to \code{Inf} to always print all rows.  Default: 20.}
  tibble.print_max = 20L,

  #' \item{\code{tibble.print_min}}{Number of rows printed if row number
  #'   threshold is exceeded. Default: 10.}
  tibble.print_min = 10L,

  #' \item{\code{tibble.width}}{Output width. Default: \code{NULL} (use
  #'   \code{width} option).}
  tibble.width = NULL,

  #' \item{\code{tibble.max_extra_cols}}{Number of extra columns
  #'   printed in reduced form. Default: 100.}
  tibble.max_extra_cols = 100L
  #' }
))

tibble_opt <- function(x) {
  x_tibble <- paste0("tibble.", x)
  res <- getOption(x_tibble)
  if (!is.null(res))
    return(res)

  x_dplyr <- paste0("dplyr.", x)
  res <- getOption(x_dplyr)
  if (!is.null(res))
    return(res)

  op.tibble[[x_tibble]]
}

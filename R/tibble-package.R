#' @useDynLib tibble, .registration = TRUE
#' @importFrom utils head tail
#' @importFrom pkgconfig set_config
#' @import rlang
#' @aliases NULL tibble-package
#' @details The S3 class `tbl_df` wraps a local data frame.
#'
#' @section Methods:
#'
#' `tbl_df` implements four important base methods:
#'
#' \describe{
#' \item{print}{By default only prints the first 10 rows (at most 20), and the
#'   columns that fit on screen; see [print.tbl()]}
#' \item{\code{[}}{Does not simplify (drop) by default, returns a data frame}
#' \item{\code{[[}, `$`}{Calls [.subset2()] directly,
#'   so is considerably faster. Returns `NULL` if column does not exist,
#'   `$` warns.}
#' }
#' @section Important functions:
#' [tibble()] and [tribble()] for construction,
#' [as_tibble()] for coercion,
#' and [print.tbl()] and [glimpse()] for display.
#' @examples
#' tibble(a = 1:26, b = letters)
#' as_tibble(iris)
"_PACKAGE"

## user-facing docs kept in `formatting` topic; see utils-format.r
op.tibble <- list(
  tibble.print_max = 20L,
  tibble.print_min = 10L,
  tibble.width = NULL,
  tibble.max_extra_cols = 100L
)

tibble_opt <- function(x) {
  x_tibble <- paste0("tibble.", x)
  res <- getOption(x_tibble)
  if (!is.null(res)) {
    return(res)
  }

  x_dplyr <- paste0("dplyr.", x)
  res <- getOption(x_dplyr)
  if (!is.null(res)) {
    return(res)
  }

  op.tibble[[x_tibble]]
}

#' View your data
#'
#' The default method of this generic calls [View()] (only in interactive
#' sessions) and returns the input.
#'
#' @export
#' @examples
#' \dontrun{
#' view(iris)
#' }
view <- function(x, title = NULL, ...) UseMethod("view")

#' @export
view.default <- function(x, title = NULL, ...) {
  if (interactive()) {
    View(x)
  }
  invisible(x)
}

#' View your data
#'
#' The default method of this generic calls [View()] (only in interactive
#' sessions) and returns the input.
#'
#' @param x The object to view
#' @param title The title to display, by default the unquoted expression
#' @param ... Unused, for extensibility
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
    utils::View(x)
  }
  invisible(x)
}

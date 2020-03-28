#' View an object
#'
#' @description
#' \lifecycle{experimental}
#'
#' Calls [utils::View()] on the input and returns it, invisibly.
#' The RStudio IDE overrides `utils::View()`, this is picked up
#' correctly.
#'
#' @param x The object to display.
#' @param title The title to use for the display, by default
#'   the deparsed expression is used.
#' @param ... Unused, must be empty.
#'
#' @export
view <- function(x, title = NULL, ...) {
  check_dots_empty()

  if (!interactive()) return(invisible(x))

  if (is.null(title)) {
    title <- expr_deparse(substitute(x))
  }

  view_fun <- get("View", envir = as.environment("package:utils"))
  eval_tidy(quo(view_fun({{x}}, !!title)))

  invisible(x)
}

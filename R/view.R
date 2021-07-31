#' View an object
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' Calls [utils::View()] on the input and returns it, invisibly.
#' If the input is not a data frame, it is processed using a variant of
#' `as.data.frame(head(x, n))`.
#' A message is printed if the number of rows exceeds `n`.
#' This function has no effect in non[interactive] sessions.
#'
#' @details
#' The RStudio IDE overrides `utils::View()`, this is picked up
#' correctly.
#'
#' @param x The object to display.
#' @param title The title to use for the display, by default
#'   the deparsed expression is used.
#' @param ... Unused, must be empty.
#' @param n Maximum number of rows to display. Only used if `x` is not a
#'   data frame. Uses the `view_max` [option][tibble_options] by default.
#'
#' @export
view <- function(x, title = NULL, ..., n = NULL) {
  check_dots_empty()

  if (!interactive()) return(invisible(x))

  if (is.null(title)) {
    title <- expr_deparse(substitute(x))
  }

  if (!is.data.frame(x)) {
    if (is.null(n)) {
      n <- get_tibble_option_view_max()
    }
    x <- head(x, n + 1)
    x <- as.data.frame(x)
    if (nrow(x) > n) {
      message("Showing the first ", n, " rows.")
      x <- head(x, n)
    }
  }

  view_fun <- get("View", envir = as.environment("package:utils"))
  # Construct call with defused arguments, some versions of RStudio evaluate
  # in the global environment (?).
  eval_tidy(quo(view_fun(!!x, !!title)))

  invisible(x)
}

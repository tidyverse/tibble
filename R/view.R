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

  if (!is_interactive()) {
    return(invisible(x))
  }

  # The user's expression and the environment to re-evaluate it in
  quo <- enquo0(x)
  expr <- quo_get_expr(quo)
  env <- quo_get_env(quo)

  if (is.null(title)) {
    title <- as_label(expr)
  }

  # Retrieve the `View()` function, which includes the special
  # hooks created by RStudio or Positron
  fn <- get("View", envir = as.environment("package:utils"))

  if (!is.data.frame(x)) {
    return(view_with_coercion(x, n, title, fn))
  }

  # Make a `View()` call that we evaluate in the parent frame,
  # as if the user called `View()` directly rather than `view()`.
  # If `expr` directly references a data frame in the parent frame, this
  # allows RStudio and Positron to "track" that original object
  # for live updates in the data viewer.
  inject((!!fn)(!!expr, !!title), env = env)

  invisible(x)
}

view_with_coercion <- function(x, n, title, fn) {
  if (is.null(n)) {
    n <- get_tibble_option_view_max()
  }

  x <- head(x, n + 1)
  x <- as.data.frame(x)

  if (nrow(x) > n) {
    message("Showing the first ", n, " rows.")
    x <- vec_slice(x, seq_len(n))
  }

  # Since we just created `x`, there won't be anything for
  # RStudio or Positron to "track", so don't even make an effort
  # to try and evaluate in the parent frame with the original
  # expression
  fn(x, title)

  invisible(x)
}

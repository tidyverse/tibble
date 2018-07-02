#' View an object
#'
#' By default, calls [utils::View()] on the input and returns it,
#' invisibly.
#' The RStudio IDE overrides `utils::View()`, this is picked up
#' correctly.
#'
#' @param x The object to display.
#' @param title The title to use for the display, by default
#'   the deparsed expression is used.
#'
#' @export
view <- function(x, title = NULL, ...) {
  UseMethod("view")
}

#' @export
view.default <- function(x, title = NULL, ...) {
  if (is.null(title)) {
    title <- enlabel_s3(x)
  }

  view_fun <- get("View", envir = as.environment("package:utils"))
  view_fun(x, title)

  invisible(x)
}

# Dirty hack, remove after r-lib/rlang#303 is implemented
enlabel_s3 <- function(x) {
  method_call <- sys.call(-1)
  method_name <- gsub("[.].*$", "", as.character(method_call[[1]]))

  generic_call <- find_generic_call(method_name)
  if (!is.null(generic_call)) {
    x_arg <- match.call(get(method_name), generic_call)[["x"]]
  } else {
    x_arg <- enexpr(x)
  }

  expr_deparse(x_arg)
}

find_generic_call <- function(method_name) {
  calls <- sys.calls()
  for (call in rev(calls)) {
    if (as.character(call[[1]]) == method_name) return(call)
  }

  NULL
}

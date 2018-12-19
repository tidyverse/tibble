#' Deprecated functions
#'
#' @description
#' \Sexpr[results=rd, stage=render]{tibble:::lifecycle("deprecated")}
#'
#' Use [tibble()] instead of `data_frame()`.
#'
#' @export
#' @keywords internal
#' @name deprecated
data_frame <- function(...) {
  # Unquote-splice to avoid argument matching
  tibble(!!!quos(...))
}

#' @description
#' Use [quasiquotation] instead of `tibble_()`, `data_frame_()`, and `lst_()`.
#'
#' @export
#' @keywords internal
#' @rdname deprecated
tibble_ <- function(xs) {
  xs <- compat_lazy_dots(xs, caller_env())
  tibble(!!!xs)
}

#' @export
#' @rdname deprecated
data_frame_ <- tibble_

#' @export
#' @rdname deprecated
lst_ <- function(xs) {
  xs <- compat_lazy_dots(xs, caller_env())
  lst(!!!xs)
}

#' @description
#' Use [as_tibble()] instead of `as_data_frame()` or `as.tibble()`, but mind the
#' new signature and semantics.
#'
#' @export
#' @rdname deprecated
as_data_frame <- function(x, ...) {
  as_tibble(x, ...)
}

#' @export
#' @rdname deprecated
as.tibble <- function(x, ...) {
  as_tibble(x, ...)
}

#' @include tribble.R
#' @description
#' Use [tribble()] instead of `frame_data()`.
#' @export
#' @rdname deprecated
frame_data <- tribble

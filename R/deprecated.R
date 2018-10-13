#' Deprecated functions
#'
#' Use [as_tibble()] instead of `as_data_frame()` or `as.tibble()`, but mind the new signature and semantics.
#'
#' @export
#' @keywords internal
#' @name deprecated
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

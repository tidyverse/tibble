#' Deprecated functions
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' Use [tibble()] instead of `data_frame()`.
#'
#' @export
#' @keywords internal
#' @name deprecated
data_frame <- function(...) {
  deprecate_stop("1.1.0", "data_frame()", "tibble()")

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
  deprecate_stop("2.0.0", "tibble_()", "tibble()",
    details = '`tibble()` supports dynamic dots, see `?"dyn-dots"`.'
  )

  xs <- compat_lazy_dots(xs, caller_env())
  tibble(!!!xs)
}

#' @export
#' @rdname deprecated
data_frame_ <- function(xs) {
  deprecate_stop("2.0.0", "data_frame_()", "tibble()",
    details = '`tibble()` supports dynamic dots, see `?"dyn-dots"`.'
  )

  xs <- compat_lazy_dots(xs, caller_env())
  tibble(!!!xs)
}

#' @export
#' @rdname deprecated
lst_ <- function(xs) {
  deprecate_stop("2.0.0", "lst_()", "lst()",
    details = '`lst()` supports dynamic dots, see `?"dyn-dots"`.'
  )

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
  deprecate_stop("2.0.0", "as_data_frame()",
    details = "Please use `as_tibble()` (with slightly different semantics) to convert to a tibble, or `as.data.frame()` to convert to a data frame."
  )

  as_tibble(x, ...)
}

#' @export
#' @rdname deprecated
as.tibble <- function(x, ...) {
  deprecate_stop("2.0.0", "as.tibble()", "as_tibble()",
    details = "The signature and semantics have changed, see `?as_tibble`."
  )

  as_tibble(x, ...)
}

#' @description
#' Use [tribble()] instead of `frame_data()`.
#' @export
#' @rdname deprecated
frame_data <- function(...) {
  deprecate_stop("2.0.0", "frame_data()", "tribble()")

  tribble(...)
}

#' Name repair
#'
#' Please review [vctrs::vec_as_names()].
#'
#' @name name-repair
#' @keywords internal
NULL

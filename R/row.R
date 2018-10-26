#' Construct a tibble row
#'
#' Constructs a tibble that is guaranteed to have only one row.
#' Complex objects are always wrapped in a list.
#'
#' @family constructors
#'
#' @inheritParams tibble
#' @export
#' @examples
#' tibble_row(a = 1, b = 2:3, c = lm(hp ~ cyl, mtcars), d = list(1))
tibble_row <- function(...,
                       .name_repair = c("check_unique", "unique", "syntactic", "minimal")) {

  xs <- quos(..., .named = TRUE)
  xlq <- lst_quos(xs, transform = expand_wrap)
  lst_to_tibble(xlq$output, .rows = 1L, .name_repair)
}

expand_wrap <- function(x, i) {
  x[[i]] <- wrap_non_atomic(x[[i]])
  x
}

#' @rdname tibble_row
#' @usage NULL
wrap_non_atomic <- function(x) {
  #' @details
  #' The function tests each column with [is_atomic()] and `n = 1`.
  if (!is_atomic(x, 1L)) {
    #' If the test fails, it is wrapped in a list.
    list(x)
  } else {
    x
  }
}

#' @description
#' `as_tibble_row()` expects a list and coerces it to a one-row tibble
#' following the same rules.
#' It is to `tibble_row()` what [as_tibble()] is to [tibble()].
#'
#' @param x A named list.
#' @inheritParams as_tibble
#'
#' @rdname tibble_row
as_tibble_row <- function(x,
                          .name_repair = c("check_unique", "unique", "syntactic", "minimal")) {
  xl <- map(x, wrap_non_atomic)
  lst_to_tibble(xl, .rows = 1L, .name_repair)
}

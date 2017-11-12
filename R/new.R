#' Constructor
#'
#' Creates a subclass of a tibble.
#'
#' @param x A tibble-like object
#' @param ... Passed on to [structure()]
#' @param subclass Subclasses to assign to the new object, default: none
#' @export
new_tibble <- function(x, ..., subclass = NULL) {
  stopifnot(is.list(x))

  x <- update_tibble_attrs(x, ...)
  x <- set_tibble_class(x, subclass = subclass)
  x
}

update_tibble_attrs <- function(x, ...) {
  # Can't use structure() here because it breaks the row.names attribute
  attribs <- list(...)

  # reduce2() is not in the purrr compat layer
  nested_attribs <- map2(names(attribs), attribs, function(name, value) set_names(list(value), name))
  x <- reduce(
    .init = x,
    nested_attribs,
    function(x, attr) {
      if (!is.null(attr[[1]])) {
        attr(x, names(attr)) <- attr[[1]]
      }
      x
    }
  )

  x
}

set_tibble_class <- function(x, subclass = NULL) {
  class(x) <- c(subclass, "tbl_df", "tbl", "data.frame")
  x
}

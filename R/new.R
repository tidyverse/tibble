#' Constructor
#'
#' Creates a subclass of a tibble.
#'
#' @param x A tibble-like object
#' @param ... Passed on to [structure()]
#' @param subclass Subclasses to assign to the new object, default: none
#' @export
new_tibble <- function(x, ..., subclass = NULL) {
  # Can't use structure() here because it breaks the row.names attribute
  attribs <- list(...)

  # reduce2() is not in the purrr compat layer
  nested_attribs <- map2(names(attribs), attribs, function(name, value) list(name = value))
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

  class(x) <- c(subclass, "tbl_df", "tbl", "data.frame")
  x
}

#' Constructor
#'
#' Creates a subclass of a tibble.
#'
#' @param x A tibble-like object
#' @param subclass Subclasses to assign to the new object, default: none
#' @export
new_tibble <- function(x, subclass = NULL) {
  stopifnot(is.list(x))

  x <- set_tibble_class(x, subclass = subclass)
  x
}

set_tibble_class <- function(x, subclass = NULL) {
  class(x) <- c(subclass, "tbl_df", "tbl", "data.frame")
  x
}

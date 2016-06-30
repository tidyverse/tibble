#' Convenience function to check presence of a named element
#'
#' This function returns a logical value that indicates if a data frame or
#' another named object contains an element with a specific name.
#'
#' @param x A data frame or another named object
#' @param name Element name(s) to check
#' @value A logical vector of the same length as \code{name}
#' @examples
#' has_name(iris, "Species")
#' has_name(mtcars, "gears")
#' @export
has_name <- function(x, name) {
  name %in% names2(x)
}

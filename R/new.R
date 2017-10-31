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
  attribs <- modifyList(attributes(x), attribs)
  if (!has_rownames(x) && "row.names" %in% names(attribs)) {
    attribs[["row.names"]] <- .row_names_info(x, 0)
  }
  attributes(x)[names(attribs)] <- attribs

  class(x) <- c(subclass, "tbl_df", "tbl", "data.frame")
  x
}

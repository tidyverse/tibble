#' Row names
#'
#' \code{has_rownames} checks if a data frame has row names.
#' @param df Input data frame
#' @export
#' @rdname rownames
#' @examples
#' has_rownames(mtcars)
#' has_rownames(iris)
has_rownames <- function(df) {
  stopifnot(is.data.frame(df))
  .row_names_info(df) > 0L
}

#' \code{remove_rownames} removes all row names.
#' @export
#' @rdname rownames
#' @examples
#' rownames(remove_rownames(mtcars))
remove_rownames <- function(df) {
  stopifnot(is.data.frame(df))
  attr(df, "row.names") <- .set_row_names(nrow(df))
  df
}

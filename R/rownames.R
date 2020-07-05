#' Tools for working with row names
#'
#' While a tibble can have row names (e.g., when converting from a regular data
#' frame), they are removed when subsetting with the \code{[} operator.
#' A warning will be raised when attempting to assign non-\code{NULL} row names
#' to a tibble.
#' Generally, it is best to avoid row names, because they are basically a
#' character column with different semantics to every other column. These
#' functions allow to you detect if a data frame has row names
#' (\code{has_rownames}), remove them (\code{remove_rownames}), or convert
#' them back-and-forth between an explicit column (\code{rownames_to_column}
#' and \code{column_to_rownames}).
#'
#' In the printed output, the presence of row names is indicated by a star just
#' above the row numbers.
#'
#' @param df A data frame
#' @param var Name of column to use for rownames.
#' @examples
#' has_rownames(mtcars)
#' has_rownames(iris)
#' has_rownames(remove_rownames(mtcars))
#'
#' head(rownames_to_column(mtcars))
#'
#' mtcars_tbl <- as_tibble(rownames_to_column(mtcars))
#' mtcars_tbl
#' column_to_rownames(as.data.frame(mtcars_tbl))
#' @name rownames
NULL


#' @export
#' @rdname rownames
has_rownames <- function(df) {
  .row_names_info(df) > 0L
}

#' @export
#' @rdname rownames
remove_rownames <- function(df) {
  stopifnot(is.data.frame(df))
  rownames(df) <- NULL
  df
}

#' @export
#' @rdname rownames
rownames_to_column <- function(df, var = "rowname") {
  stopifnot(is.data.frame(df))

  if (has_name(df, var))
    stopc("There is a column named ", var, " already!")

  rn <- tibble(rownames(df))
  names(rn) <- var

  attribs <- attributes(df)

  new_df <- c(rn, df)
  attribs[["names"]] <- names(new_df)

  attributes(new_df) <- attribs[names(attribs) != "row.names"]
  attr(new_df, "row.names") <- .set_row_names(nrow(df))
  new_df
}

#' @rdname rownames
#' @export
column_to_rownames <- function(df, var = "rowname") {
  stopifnot(is.data.frame(df))

  if (has_rownames(df))
    stopc("This data frame already has row names.")

  if (!has_name(df, var))
    stopc("This data frame has no column named ", var, ".")

  rownames(df) <- df[[var]]
  df[[var]] <- NULL
  df
}

#' @export
`row.names<-.tbl_df` <- function(x, value) {
  if (!is.null(value)) {
    warningc("Setting row names on a tibble is deprecated.")
  }
  NextMethod()
}

raw_rownames <- function(x) {
  .row_names_info(x, 0L) %||%  .set_row_names(.row_names_info(x, 2L))
}

#' Tools for working with row names
#'
#' While a tibble can have row names (e.g., when converting from a regular data
#' frame), they are removed when subsetting with the `[` operator.
#' A warning will be raised when attempting to assign non-`NULL` row names
#' to a tibble.
#' Generally, it is best to avoid row names, because they are basically a
#' character column with different semantics to every other column. These
#' functions allow to you detect if a data frame has row names
#' (`has_rownames()`), remove them (`remove_rownames()`), or convert
#' them back-and-forth between an explicit column (`rownames_to_column()`
#' and `column_to_rownames()`).
#' Also included is `rowid_to_column()` which
#' adds a column at the start of the dataframe of ascending sequential row
#' ids starting at 1. Note that this will remove any existing row names.
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

  if (has_name(df, var)) {
    stopc("Column `", var, "` already exists")
  }

  new_df <- add_column(df, !!(var) := rownames(df), .before = 1)
  new_df
}

#' @export
#' @rdname rownames
rowid_to_column <- function(df, var = "rowid") {
  stopifnot(is.data.frame(df))

  if (has_name(df, var)) {
    stopc("Column `", var, "` already exists")
  }

  new_df <- add_column(df, !!(var) := seq_len(nrow(df)), .before = 1)
  new_df
}

#' @rdname rownames
#' @export
column_to_rownames <- function(df, var = "rowname") {
  stopifnot(is.data.frame(df))

  if (has_rownames(df)) {
    stopc("`df` already has row names")
  }

  if (!has_name(df, var)) {
    stopc("Column `num2` not found")
  }

  rownames(df) <- df[[var]]
  df[[var]] <- NULL
  df
}

#' @export
`row.names<-.tbl_df` <- function(x, value) {
  if (!is_null(value)) {
    warningc("Setting row names on a tibble is deprecated.")
  }
  NextMethod()
}

raw_rownames <- function(x) {
  .row_names_info(x, 0L) %||%  .set_row_names(.row_names_info(x, 2L))
}

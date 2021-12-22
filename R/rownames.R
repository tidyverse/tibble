#' Tools for working with row names
#'
#' @description
#' While a tibble can have row names (e.g., when converting from a regular data
#' frame), they are removed when subsetting with the `[` operator.
#' A warning will be raised when attempting to assign non-`NULL` row names
#' to a tibble.
#' Generally, it is best to avoid row names, because they are basically a
#' character column with different semantics than every other column.
#'
#' These functions allow to you detect if a data frame has row names
#' (`has_rownames()`), remove them (`remove_rownames()`), or convert
#' them back-and-forth between an explicit column (`rownames_to_column()`
#' and `column_to_rownames()`).
#' Also included is `rowid_to_column()`, which adds a column at the start of the
#' dataframe of ascending sequential row ids starting at 1. Note that this will
#' remove any existing row names.
#'
#' @return `column_to_rownames()` always returns a data frame.
#'   `has_rownames()` returns a scalar logical.
#'   All other functions return an object of the same class as the input.
#'
#' @param .data A data frame.
#' @param var Name of column to use for rownames.
#' @examples
#' # Detect row names ----------------------------------------------------
#' has_rownames(mtcars)
#' has_rownames(trees)
#'
#' # Remove row names ----------------------------------------------------
#' remove_rownames(mtcars) %>% has_rownames()
#'
#' # Convert between row names and column --------------------------------
#' mtcars_tbl <- rownames_to_column(mtcars, var = "car") %>% as_tibble()
#' mtcars_tbl
#' column_to_rownames(mtcars_tbl, var = "car") %>% head()
#'
#' # Adding rowid as a column --------------------------------------------
#' rowid_to_column(trees) %>% head()
#'
#' @name rownames
NULL


#' @export
#' @rdname rownames
has_rownames <- function(.data) {
  .row_names_info(.data) > 0L && !is.na(.row_names_info(.data, 0L)[[1L]])
}

#' @export
#' @rdname rownames
remove_rownames <- function(.data) {
  stopifnot(is.data.frame(.data))
  rownames(.data) <- NULL
  .data
}

#' @export
#' @rdname rownames
rownames_to_column <- function(.data, var = "rowname") {
  # rename, because .data has special semantics in tidy evaluation
  df <- .data

  stopifnot(is.data.frame(df))

  # Side effect: check unique names
  repaired_names(c(unique(names2(df)), var), repair_hint = FALSE)

  new_df <- add_column(df, !!var := rownames(df), .before = 1)
  remove_rownames(new_df)
}

#' @export
#' @rdname rownames
rowid_to_column <- function(.data, var = "rowid") {
  # rename, because .data has special semantics in tidy evaluation
  df <- .data

  stopifnot(is.data.frame(df))

  # Side effect: check unique names
  repaired_names(c(unique(names2(df)), var), repair_hint = FALSE)

  new_df <- add_column(df, !!var := seq_len(nrow(df)), .before = 1)
  remove_rownames(new_df)
}

#' @rdname rownames
#' @export
column_to_rownames <- function(.data, var = "rowname") {
  stopifnot(is.data.frame(.data))

  if (has_rownames(.data)) {
    cnd_signal(error_already_has_rownames())
  }

  if (!has_name(.data, var)) {
    cnd_signal(error_unknown_column_names(var))
  }

  .data <- as.data.frame(.data)
  rownames(.data) <- .data[[var]]
  .data[[var]] <- NULL
  .data
}

#' @export
`row.names<-.tbl_df` <- function(x, value) {
  if (!is.null(value)) {
    warn("Setting row names on a tibble is deprecated.")
  }
  NextMethod()
}

raw_rownames <- function(x) {
  .row_names_info(x, 0L) %||% .set_row_names(.row_names_info(x, 2L))
}

# Errors ------------------------------------------------------------------

error_already_has_rownames <- function() {
  tibble_error("`.data` must be a data frame without row names.")
}

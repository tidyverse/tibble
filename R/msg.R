data_has_n_cols <- function(n) {
  paste0("`.data` has ", n, " columns")
}

error_unsupported_index <- function(j) {
  paste0("Can't subset with `[` using an object of class ", class(j)[[1L]], ".")
}

error_na_column_index <- function() {
  "Can't use numeric NA as column index with `[`."
}

error_nonint_column_index <- function(pos, value) {
  bullets(
    "Must use integers to index columns with `[`:",
    paste0("Position ", pos, " equals ", value)
  )
}

error_small_column_index <- function(n, pos, value) {
  bullets(
    "Negative column indexes in `[` must match number of columns:",
    data_has_n_cols(n),
    paste0("Position ", pos, " equals ", value)
  )
}

error_large_column_index <- function(n, pos, value) {
  bullets(
    "Positive column indexes in `[` must match number of columns:",
    data_has_n_cols(n),
    paste0("Position ", pos, " equals ", value)
  )
}

error_dim_column_index <- function(j) {
  paste0("Must use a vector in `[`, not an object of class ", class(j)[[1L]], ".")
}

error_mismatch_column_flag <- function(n, j) {
  bullets(
    "Length of logical index vector for `[` must equal number of columns (or 1):",
    data_has_n_cols(n),
    paste0("Index vector has length ", j)
  )
}

error_na_column_flag <- function() {
  "Can't use logical NA when selecting columns with `[`."
}

error_unknown_names <- function(names) {
  pluralise_commas("Can't find column(s) ", tick(names), " in `.data`.")
}

error_existing_names <- function(names) {
  pluralise_commas("Column(s) ", tick(names), " already exist[s] in `.data`.")
}

error_add_rows_to_grouped_df <- function() {
  "Can't add rows to grouped data frames"
}

error_inconsistent_new_rows <- function(names) {
  bullets(
    "New rows in `add_row()` must use columns that already exist:",
    error_unknown_names(names)
  )
}

error_inconsistent_cols <- function(expected_nrow, nrow_set_method, vars, vars_len) {
  bullets(
    "All columns in a tibble must have consistent lengths:",
    paste0("Expected column length is ", expected_nrow, " based on ", nrow_set_method),
    paste0("Column ", tick(vars), " has length ", vars_len)
  )
}

error_inconsistent_new_cols <- function(n, df) {
  bullets(
    "New columns in `add_column()` must be consistent with `.data`:",
    pluralise_count("`.data` has ", n, " row(s)"),
    paste0(
      pluralise_n("New column(s) contribute[s]", ncol(df)), " ",
      nrow(df),
      " rows"
    )
  )
}

error_duplicate_new_cols <- function(names) {
  bullets(
    "Can't add duplicate columns with `add_column()`:",
    error_existing_names(names)
  )
}

error_both_before_after <- function() {
  "Can't specify both `.before` and `.after`."
}

error_already_has_rownames <- function() {
  "`df` must be a data frame without row names in `column_to_rownames()`."
}

error_as_tibble_needs_rownames <- function() {
  "Object passed to `as_tibble()` must have row names if the `rownames` argument is set."
}

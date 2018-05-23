data_has_n_cols <- function(n) {
  paste0("`.data` has ", n, " columns")
}

error_unsupported_index <- function(j) {
  paste0("Can't subset with `[` using an index of class ", class(j)[[1L]], ".")
}

error_na_column_index <- function() {
  "Can't use numeric NA as column index with `[`."
}

error_nonint_column_index <- function(pos, value) {
  bullets(
    "Must use integers to index columns:",
    paste0("Position ", pos, " equals ", value)
  )
}

error_small_column_index <- function(n, pos, value) {
  bullets(
    "Negative column indexes must match number of columns:",
    data_has_n_cols(n),
    paste0("Position ", pos, " equals ", value)
  )
}

error_large_column_index <- function(n, pos, value) {
  bullets(
    "Positive column indexes must match number of columns:",
    data_has_n_cols(n),
    paste0("Position ", pos, " equals ", value)
  )
}

error_mismatch_column_flag <- function(n, j) {
  bullets(
    "Length of logical index vector must equal number of columns (or 1):",
    data_has_n_cols(n),
    paste0("Index vector has length ", j)
  )
}

error_na_column_flag <- function() {
  "Can't use logical NA when selecting columns with `[`."
}

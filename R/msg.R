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

error_na_column_flag <- function() {
  "Can't use logical NA when selecting columns with `[`."
}

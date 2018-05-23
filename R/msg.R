error_unsupported_index <- function(j) {
  paste0("Can't subset with `[` using an index of class ", class(j)[[1L]], ".")
}

error_na_column_index <- function() {
  "Can't use NA as column index with `[`."
}

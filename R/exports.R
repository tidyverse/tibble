matrixToDataFrame <- function(x) {
  .Call(`tibble_matrixToDataFrame`, x)
}

string_to_indices <- function(x) {
  .Call(`tibble_string_to_indices`, as.character(x))
}

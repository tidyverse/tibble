check_needs_no_dim <- function(j) {
  if (needs_dim(j)) {
    abort(error_dim_column_index(j))
  }
}

# check_names_before_after ------------------------------------------------

check_names_before_after <- function(j, x) {
  if (!is_bare_character(j)) {
    return(j)
  }

  check_needs_no_dim(j)
  check_names_before_after_character(j, x)
}

check_names_before_after_character <- function(j, names) {
  pos <- safe_match(j, names)
  if (anyNA(pos)) {
    unknown_names <- j[is.na(pos)]
    abort(error_unknown_column_names(unknown_names))
  }
  pos
}

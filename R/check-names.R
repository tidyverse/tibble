check_names_df <- function(j, ...) UseMethod("check_names_df")

#' @export
check_names_df.default <- function(j, ...) {
  stopc(error_unsupported_index(j))
}

#' @export
check_names_df.character <- function(j, x) {
  check_names_before_after.character(j, names(x))
}

#' @export
check_names_df.numeric <- function(j, x) {
  check_needs_no_dim(j)

  if (anyNA(j)) {
    stopc(error_na_column_index())
  }

  non_integer <- which(j != trunc(j))
  if (has_length(non_integer)) {
    stopc(error_nonint_column_index(non_integer, j[non_integer]))
  }
  neg_too_small <- which(j < -length(x))
  if (has_length(neg_too_small)) {
    stopc(error_small_column_index(length(x), neg_too_small, j[neg_too_small]))
  }
  pos_too_large <- which(j > length(x))
  if (has_length(pos_too_large)) {
    stopc(error_large_column_index(length(x), pos_too_large, j[pos_too_large]))
  }

  seq_along(x)[j]
}

#' @export
check_names_df.logical <- function(j, x) {
  check_needs_no_dim(j)

  if (!(length(j) %in% c(1L, length(x)))) {
    stopc(error_mismatch_column_flag(length(x), length(j)))
  }
  if (anyNA(j)) {
    stopc(error_na_column_flag())
  }
  seq_along(x)[j]
}

check_needs_no_dim <- function(j) {
  if (needs_dim(j)) {
    stopc(error_dim_column_index(j))
  }
}

# check_names_before_after ------------------------------------------------

check_names_before_after <- function(j, ...) UseMethod("check_names_before_after")

#' @export
check_names_before_after.default <- function(j, ...) {
  j
}

#' @export
check_names_before_after.character <- function(j, names) {
  check_needs_no_dim(j)

  pos <- safe_match(j, names)
  if (anyNA(pos)) {
    unknown_names <- j[is.na(pos)]
    stopc(pluralise_msg("Column(s) ", unknown_names), " not found")
  }
  pos
}

check_names_df <- function(j, x) {
  if (is.object(j)) {
    abort(error_unsupported_index(j))
  } else {
    if (length(dim(j)) > 1) {
      abort(error_dim_column_index(j))
    }

    switch(typeof(j),
      integer = ,
      double = check_names_df_numeric(j, x),
      character = check_names_before_after_character(j, names(unclass(x))),
      logical = check_names_df_logical(j, x),
      abort(error_unsupported_index(j))
    )
  }
}

check_names_df_numeric <- function(j, x) {
  if (anyNA(j)) {
    abort(error_na_column_index())
  }

  n <- length(unclass(x))

  if (any(j != trunc(j)) || any(abs(j) > n)) {
    non_integer <- which(j != trunc(j))
    if (has_length(non_integer)) {
      abort(error_nonint_column_index(non_integer, j[non_integer]))
    }
    neg_too_small <- which(j < -n)
    if (has_length(neg_too_small)) {
      abort(error_small_column_index(n, neg_too_small, j[neg_too_small]))
    }
    pos_too_large <- which(j > n)
    if (has_length(pos_too_large)) {
      abort(error_large_column_index(n, pos_too_large, j[pos_too_large]))
    }
  }

  j
}

check_names_df_logical <- function(j, x) {
  if (!(length(j) %in% c(1L, length(x)))) {
    abort(error_mismatch_column_flag(length(x), length(j)))
  }
  if (anyNA(j)) {
    abort(error_na_column_flag())
  }
  seq_along(x)[j]
}

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
    abort(error_unknown_names(unknown_names))
  }
  pos
}

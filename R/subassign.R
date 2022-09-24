#' @rdname subsetting
#' @export
`$<-.tbl_df` <- function(x, name, value) {
  value_arg <- substitute(value)
  j <- vectbl_as_new_col_index(as_string(name), x, name, value_arg = value_arg)

  tbl_subassign(
    x,
    i = NULL, j, list(value),
    i_arg = NULL, value_arg = value_arg
  )
}

#' @rdname subsetting
#' @export
`[[<-.tbl_df` <- function(x, i, j, ..., value) {
  i_arg <- substitute(i)
  j_arg <- substitute(j)
  value_arg <- substitute(value)

  if (missing(i)) {
    abort_assign_columns_non_missing_only()
  }

  if (missing(j)) {
    if (nargs() < 4) {
      j <- i
      i <- NULL
      j_arg <- i_arg
      i_arg <- NULL
    } else {
      abort_assign_columns_non_missing_only()
    }
  }

  if (!is.null(i)) {
    i <- vectbl_as_row_location2(i, fast_nrow(x), i_arg, assign = TRUE)
  }

  if (is.object(j)) {
    j <- vectbl_as_col_subscript2(j, j_arg, assign = TRUE)
  }

  # Side effect: check scalar
  if (is.symbol(j)) {
    # FIXME: as_utf8_character() needs rlang > 0.4.11
    j <- chr_unserialise_unicode(as.character(j))
  } else {
    if (!is.vector(j) || length(j) != 1L || is.na(j) || (is.numeric(j) && j < 0) || is.logical(j)) {
      vectbl_as_col_location2(j, length(x), j_arg = j_arg, assign = TRUE)
    }
  }

  j <- vectbl_as_new_col_index(j, x, j_arg)

  # New columns are added to the end, provide index to avoid matching column
  # names again
  value <- list(value)

  # j is already pretty
  tbl_subassign(x, i, j, value, i_arg = i_arg, value_arg = value_arg)
}


#' @rdname subsetting
#' @export
`[<-.tbl_df` <- function(x, i, j, ..., value) {
  i_arg <- substitute(i)
  j_arg <- substitute(j)
  value_arg <- substitute(value)

  # The order is important: first check missingness of i...
  if (missing(i)) {
    i <- NULL
    i_arg <- NULL
  } else if (is.null(i)) {
    i <- integer()
  } else if (is.matrix(i) && missing(j) && nargs() < 4) {
    # Special case:
    return(tbl_subassign_matrix(x, i, value, i_arg, value_arg))
  }

  # ...then missingness of j
  if (missing(j)) {
    if (nargs() >= 4) {
      j <- NULL
      j_arg <- NULL
    } else {
      j <- i
      i <- NULL
      j_arg <- i_arg
      i_arg <- NULL
    }
  } else if (is.null(j)) {
    j <- integer()
    j_arg <- NULL
  }

  # Convert to row index
  if (!is.null(i)) {
    i <- vectbl_as_new_row_index(i, x, i_arg)
  }

  # Wrap value in a list if needed
  if (is.null(i)) {
    if (is.null(value)) {
      value <- list(value)
    } else {
      value <- result_vectbl_wrap_rhs(value)
      if (is.null(value)) {
        abort_need_rhs_vector_or_null(value_arg)
      }
    }
  } else {
    value <- result_vectbl_wrap_rhs(value)
    if (is.null(value)) {
      abort_need_rhs_vector(value_arg)
    }
  }

  if (!is.null(j_arg)) {
    j <- vectbl_as_new_col_index(j, x, j_arg, names2(value), value_arg)
    j_arg <- NULL
  }

  tbl_subassign(x, i, j, value, i_arg, value_arg)
}

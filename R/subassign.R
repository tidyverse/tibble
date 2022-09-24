#' @rdname subsetting
#' @export
`$<-.tbl_df` <- function(x, name, value) {
  tbl_subassign(
    x,
    i = NULL, as_string(name), list(value),
    i_arg = NULL, j_arg = name, value_arg = substitute(value)
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
  tbl_subassign(x, i, j, value, i_arg = i_arg, j_arg = NULL, value_arg = value_arg)
}


#' @rdname subsetting
#' @export
`[<-.tbl_df` <- function(x, i, j, ..., value) {
  i_arg <- substitute(i)
  j_arg <- substitute(j)

  if (missing(i)) {
    i <- NULL
    i_arg <- NULL
  } else if (is.null(i)) {
    i <- integer()
  }

  if (missing(j)) {
    j <- NULL
    j_arg <- NULL
  } else if (is.null(j)) {
    j <- integer()
  }

  if (is.null(j) && nargs() < 4) {
    j <- i
    i <- NULL
    j_arg <- i_arg
    i_arg <- NULL

    # Special case:
    if (is.matrix(j)) {
      return(tbl_subassign_matrix(x, j, value, j_arg, substitute(value)))
    }
  }

  tbl_subassign(x, i, j, value, i_arg, j_arg, substitute(value))
}

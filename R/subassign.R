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

vectbl_as_new_row_index <- function(i, x, i_arg) {
  if (is.null(i)) {
    i
  } else if (is_bare_numeric(i)) {
    if (anyDuplicated.default(i)) {
      abort_duplicate_row_subscript_for_assignment(i)
    }

    nr <- fast_nrow(x)

    # Only update existing, caller knows how to deal with OOB
    numtbl_as_row_location_assign(i, nr, i_arg)
  } else if (is_logical(i)) {
    # Don't allow OOB logical
    vectbl_as_row_location(i, fast_nrow(x), i_arg, assign = TRUE)
  } else {
    i <- vectbl_as_row_index(i, x, i_arg, assign = TRUE)
    if (anyDuplicated.default(i, incomparables = NA)) {
      abort_duplicate_row_subscript_for_assignment(i)
    }
    i
  }
}

vectbl_as_new_col_index <- function(j, x, j_arg, names = "", value_arg = NULL) {
  # Creates a named index vector
  # Values: index
  # Name: column name (for all columns)

  if (is_bare_character(j)) {
    if (anyNA(j)) {
      abort_assign_columns_non_na_only()
    }

    names <- j

    j <- match(names, names(x))
    new <- which(is.na(j))
    if (length(new) > 0) {
      # FIXME: Check consistency with assigning to the same existing column twice
      j[new] <- seq.int(length(x) + 1L, length.out = length(new))
    } else {
      new <- NULL
    }
  } else if (is_bare_numeric(j)) {
    if (anyNA(j)) {
      abort_assign_columns_non_na_only()
    }

    j <- numtbl_as_col_location_assign(j, length(x), j_arg = j_arg)

    old <- (j <= length(x))
    new <- which(!old)
    j_new <- j[new]

    # FIXME: Recycled names are not repaired
    # FIXME: Hard-coded name repair
    if (length(names) != 1L) {
      # Side effect: check compatibility
      vec_recycle(names, length(j), x_arg = as_label(value_arg), call = my_caller_env())
    } else if (length(j) != 1L) {
      # length(names) == 1
      names <- vec_recycle(names, length(j), x_arg = as_label(value_arg))
    }

    if (length(new) > 0) {
      j[new] <- j_new
      names[new][names[new] == ""] <- paste0("...", j_new)
    } else {
      new <- NULL
    }

    names[old] <- names(x)[j[old]]
  } else {
    j <- vectbl_as_col_location(j, length(x), names(x), j_arg = j_arg, assign = TRUE)

    if (anyNA(j)) {
      abort_na_column_index(which(is.na(j)))
    }

    if (length(names) != 1L) {
      # Side effect: check compatibility
      vec_recycle(names, length(j), x_arg = as_label(value_arg), call = my_caller_env())
    } else if (length(j) != 1L) {
      # length(names) == 1
      names <- vec_recycle(names, length(j), x_arg = as_label(value_arg))
    }

    old <- (j <= length(x))
    names[old] <- names(x)[j[old]]

    new <- NULL
  }

  if (anyDuplicated.default(j)) {
    abort_assign_duplicate_column_subscript(j)
  }

  names(j) <- names
  attr(j, "new") <- new
  j
}

numtbl_as_row_location_assign <- function(i, n, i_arg, call = my_caller_env()) {
  subclass_row_index_errors(
    num_as_location(i, n, missing = "error", oob = "extend", zero = "error", call = call),
    i_arg = i_arg, assign = TRUE
  )
}

vectbl_as_row_location <- function(i, n, i_arg, assign = FALSE, call = my_caller_env()) {
  if (is_bare_atomic(i) && is.matrix(i) && ncol(i) == 1) {
    what <- paste0(
      "tibble::", if (assign) "`[<-`" else "`[`",
      "(i = 'can\\'t be a matrix')"
    )

    lifecycle::deprecate_soft("3.0.0", what,
                              details = "Convert to a vector.",
                              env = foreign_caller_env()
    )
    i <- i[, 1]
  }

  subclass_row_index_errors(vec_as_location(i, n, call = call), i_arg = i_arg, assign = assign)
}

numtbl_as_col_location_assign <- function(j, n, j_arg, call = my_caller_env()) {
  subclass_col_index_errors(
    num_as_location(j, n, missing = "error", oob = "extend", zero = "error", call = call),
    j_arg = j_arg, assign = TRUE
  )
}

result_vectbl_wrap_rhs <- function(value) {
  if (!vec_is(value)) {
    NULL
  } else if (is.list(value)) {
    # Also covers the case of data frames
    unclass(value)
  } else if (is.array(value)) {
    if (any(dim(value)[-1:-2] != 1)) {
      return(NULL)
    }
    dim(value) <- head(dim(value), 2)
    as.list(as.data.frame(value, stringsAsFactors = FALSE))
  } else {
    list(value)
  }
}

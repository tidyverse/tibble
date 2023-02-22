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

vectbl_as_new_row_index <- function(i, x, i_arg, call) {
  if (is.null(i)) {
    i
  } else if (is_bare_numeric(i)) {
    if (anyDuplicated.default(i)) {
      abort_duplicate_row_subscript_for_assignment(i, call)
    }

    nr <- fast_nrow(x)

    # Only update existing, caller knows how to deal with OOB
    numtbl_as_row_location_assign(i, nr, i_arg, call)
  } else if (is_logical(i)) {
    # Don't allow OOB logical
    vectbl_as_row_location(i, fast_nrow(x), i_arg, assign = TRUE, call = call)
  } else {
    i <- vectbl_as_row_index(i, x, i_arg, assign = TRUE, call = call)
    if (anyDuplicated.default(i, incomparables = NA)) {
      abort_duplicate_row_subscript_for_assignment(i, call)
    }
    i
  }
}

vectbl_as_new_col_index <- function(j, x, j_arg, names = "", value_arg = NULL, call = caller_env()) {
  # Creates a named index vector
  # Values: index
  # Name: column name (for all columns)

  if (is.object(j)) {
    j <- vectbl_as_col_subscript(j, j_arg = j_arg, assign = TRUE, call = call)
  }

  if (is.character(j)) {
    if (anyNA(j)) {
      abort_assign_columns_non_na_only(call)
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
  } else if (is.numeric(j)) {
    if (anyNA(j)) {
      abort_assign_columns_non_na_only(call)
    }

    j <- numtbl_as_col_location_assign(j, length(x), j_arg, call)

    old <- (j <= length(x))
    new <- which(!old)
    j_new <- j[new]

    # FIXME: Recycled names are not repaired
    # FIXME: Hard-coded name repair
    if (length(names) != 1L) {
      # Side effect: check compatibility
      vec_recycle(names, length(j), x_arg = as_label(value_arg), call = call)
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
    j <- vectbl_as_col_location(j, length(x), names(x), j_arg = j_arg, assign = TRUE, call = call)

    if (anyNA(j)) {
      abort_na_column_index(which(is.na(j)), call)
    }

    if (length(names) != 1L) {
      # Side effect: check compatibility
      vec_recycle(names, length(j), x_arg = as_label(value_arg), call = call)
    } else if (length(j) != 1L) {
      # length(names) == 1
      names <- vec_recycle(names, length(j), x_arg = as_label(value_arg))
    }

    old <- (j <= length(x))
    names[old] <- names(x)[j[old]]

    new <- NULL
  }

  if (anyDuplicated.default(j)) {
    abort_duplicate_column_subscript_for_assignment(j, call)
  }

  names(j) <- names
  attr(j, "new") <- new
  j
}

numtbl_as_row_location_assign <- function(i, n, i_arg, call) {
  subclass_row_index_errors(
    num_as_location(i, n, missing = "error", oob = "extend", zero = "error", call = call),
    i_arg = i_arg, assign = TRUE
  )
}

vectbl_as_row_location <- function(i, n, i_arg, assign = FALSE, call) {
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

numtbl_as_col_location_assign <- function(j, n, j_arg, call) {
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

# Errors ------------------------------------------------------------------

abort_need_rhs_vector <- function(value_arg, call = caller_env()) {
  tibble_abort(call = call, paste0(tick(as_label(value_arg)), " must be a vector, a bare list, a data frame or a matrix."))
}

abort_need_rhs_vector_or_null <- function(value_arg, call = caller_env()) {
  tibble_abort(call = call, paste0(tick(as_label(value_arg)), " must be a vector, a bare list, a data frame, a matrix, or NULL."))
}

abort_assign_columns_non_na_only <- function(call = caller_env()) {
  tibble_abort(call = call, "Can't use NA as column index in a tibble for assignment.")
}

abort_assign_columns_non_missing_only <- function(call = caller_env()) {
  tibble_abort(call = call, "Subscript can't be missing for tibbles in `[[<-`.")
}

abort_duplicate_column_subscript_for_assignment <- function(j, call = caller_env()) {
  j <- unique(j[duplicated(j)])
  tibble_abort(call = call, pluralise_commas("Column index(es) ", j, " [is](are) used more than once for assignment."), j = j)
}

abort_assign_rows_non_na_only <- function(call = caller_env()) {
  tibble_abort(call = call, "Can't use NA as row index in a tibble for assignment.")
}

abort_duplicate_row_subscript_for_assignment <- function(i, call = caller_env()) {
  i <- unique(i[duplicated(i)])
  tibble_abort(call = call, pluralise_commas("Row index(es) ", i, " [is](are) used more than once for assignment."), i = i)
}

abort_assign_incompatible_size <- function(nrow, value, j, i_arg, value_arg, parent = NULL, call = caller_env()) {
  if (is.null(i_arg)) {
    target <- "existing data"
    existing <- pluralise_count("Existing data has ", nrow, " row(s)")
  } else {
    target <- paste0("row subscript ", tick(as_label(i_arg)))
    existing <- pluralise_count("", nrow, " row(s) must be assigned")
  }

  new <- paste0(pluralise_count("has ", vec_size(value[[j]]), " row(s)"))
  if (length(value) != 1) {
    new <- paste0("Element ", j, " of assigned data ", new)
  } else {
    new <- paste0("Assigned data ", new)
  }

  tibble_abort(
    bullets(
      paste0("Assigned data ", tick(as_label(value_arg)), " must be compatible with ", target, ":"),
      x = existing,
      x = new,
      i = if (nrow != 1) "Only vectors of size 1 are recycled",
      i = if (nrow == 1 && vec_size(value[[j]]) != 1) "Row updates require a list value. Do you need `list()` or `as.list()`?"
    ),
    expected = nrow,
    actual = vec_size(value[[j]]),
    j = j,
    parent = parent,
    call = call
  )
}

abort_assign_incompatible_type <- function(x, value, j, value_arg, parent = NULL, call = caller_env()) {
  name <- names(x)[[j]]

  tibble_abort(
    bullets(
      paste0("Assigned data ", tick(as_label(value_arg)), " must be compatible with existing data:"),
      i = paste0("Error occurred for column ", tick(name))
    ),
    expected = x[[j]],
    actual = value[[j]],
    name = name,
    j = j,
    parent = parent,
    call = call
  )
}

abort_assign_vector <- function(value, j, value_arg, parent = NULL, call = caller_env()) {
  tibble_abort(
    paste0("Assigned data ", tick(as_label(value_arg)), " must be a vector."),
    actual = value[[j]],
    j = j,
    parent = parent,
    call = call
  )
}

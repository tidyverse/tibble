vectbl_as_row_index <- function(i, x, i_arg, assign = FALSE) {
  stopifnot(!is.null(i))

  nr <- fast_nrow(x)

  if (is.character(i)) {
    is_na_orig <- is.na(i)

    if (has_rownames(x)) {
      i <- match(i, rownames(x))
    } else {
      i <- string_to_indices(i)
      i <- fix_oob(i, nr, warn = FALSE)
    }

    i <- fix_oob_invalid(i, is_na_orig)
    i
  } else if (is.numeric(i)) {
    i <- fix_oob(i, nr)
    vectbl_as_row_location(i, nr, i_arg, assign)
  } else {
    vectbl_as_row_location(i, nr, i_arg, assign)
  }
}

fix_oob <- function(i, n, warn = TRUE) {
  if (any(i > 0, na.rm = TRUE)) {
    fix_oob_positive(i, n, warn)
  } else if (any(i < 0, na.rm = TRUE)) {
    fix_oob_negative(i, n, warn)
  } else {
    # Will throw error in vec_as_location()
    i
  }
}

fix_oob_positive <- function(i, n, warn = TRUE) {
  oob <- which(i > n)
  if (warn && length(oob) > 0) {
    deprecate_soft("3.0.0", "tibble::`[.tbl_df`(i = 'must lie in [0, rows] if positive,')",
      details = "Use `NA_integer_` as row index to obtain a row full of `NA` values.",
      env = foreign_caller_env()
    )
  }

  i[oob] <- NA_integer_
  i
}

fix_oob_negative <- function(i, n, warn = TRUE) {
  oob <- (i < -n)
  if (warn && any(oob, na.rm = TRUE)) {
    deprecate_soft("3.0.0", "tibble::`[.tbl_df`(i = 'must lie in [-rows, 0] if negative,')",
      details = "Use `NA_integer_` as row index to obtain a row full of `NA` values.",
      env = foreign_caller_env()
    )
  }

  i <- i[!oob]
  if (is_empty(i)) i <- seq_len(n)
  i
}

fix_oob_invalid <- function(i, is_na_orig) {
  oob <- which(is.na(i) & !is_na_orig)

  if (length(oob) > 0) {
    deprecate_soft("3.0.0", "tibble::`[.tbl_df`(i = 'must use valid row names')",
      details = "Use `NA_integer_` as row index to obtain a row full of `NA` values.",
      env = foreign_caller_env()
    )

    i[oob] <- NA_integer_
  }
  i
}

tbl_subset2 <- function(x, j, j_arg) {
  if (is.matrix(j)) {
    deprecate_soft("3.0.0", "tibble::`[[.tbl_df`(j = 'can\\'t be a matrix",
      details = "Recursive subsetting is deprecated for tibbles.",
      env = foreign_caller_env()
    )

    return(as.matrix(x)[[j]])
  }

  if (is.object(j)) {
    j <- vectbl_as_col_subscript2(j, j_arg)
  }

  if (is.numeric(j)) {
    if (length(j) == 1L) {
      if (is.na(j) || j < 1 || j > length(x) || (is.double(j) && j != trunc(j))) {
        # Side effect: throw error for invalid j
        vectbl_as_col_location2(j, length(x), j_arg = j_arg)
      }
    } else if (length(j) == 2L) {
      deprecate_soft("3.0.0", "tibble::`[[.tbl_df`(j = 'can\\'t be a vector of length 2')",
        details = "Recursive subsetting is deprecated for tibbles.",
        env = foreign_caller_env()
      )
    } else {
      # Side effect: throw error for invalid j
      vectbl_as_col_location2(j, length(x), j_arg = j_arg)
    }
  } else if (is.symbol(j)) {
    # FIXME: Only relevant for R < 3.4
    j <- as.character(j)
  } else if (is.logical(j) || length(j) != 1L || !is_bare_atomic(j) || is.na(j)) {
    # Side effect: throw error for invalid j
    vectbl_as_col_location2(j, length(x), names(x), j_arg = j_arg)
  }

  .subset2(x, j)
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
    abort_duplicate_column_subscript_for_assignment(j)
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

vectbl_as_row_location2 <- function(i, n, i_arg, assign = FALSE, call = my_caller_env()) {
  subclass_row_index_errors(vec_as_location2(i, n, call = call), i_arg = i_arg, assign = assign)
}

numtbl_as_col_location_assign <- function(j, n, j_arg, call = my_caller_env()) {
  subclass_col_index_errors(
    num_as_location(j, n, missing = "error", oob = "extend", zero = "error", call = call),
    j_arg = j_arg, assign = TRUE
  )
}

vectbl_as_col_location <- function(j,
                                   n,
                                   names = NULL,
                                   j_arg,
                                   assign = FALSE,
                                   call = my_caller_env()) {
  subclass_col_index_errors(
    vec_as_location(j, n, names, call = call),
    j_arg = j_arg,
    assign = assign
  )
}

vectbl_as_col_location2 <- function(j, n, names = NULL, j_arg, assign = FALSE, call = my_caller_env()) {
  subclass_col_index_errors(vec_as_location2(j, n, names, call = call), j_arg = j_arg, assign = assign)
}

vectbl_as_col_subscript2 <- function(j, j_arg, assign = FALSE, call = my_caller_env()) {
  subclass_col_index_errors(vec_as_subscript2(j, logical = "error", call = call), j_arg = j_arg, assign = assign)
}

is_tight_sequence_at_end <- function(i_new, n) {
  all(sort(i_new) == seq2(n + 1, n + length(i_new)))
}

fast_nrow <- function(x) {
  .row_names_info(x, 2L)
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

# External ----------------------------------------------------------------

vectbl_restore <- function(xo, x) {
  .Call(`tibble_restore_impl`, xo, x)
}

# Errors ------------------------------------------------------------------

abort_need_rhs_vector <- function(value_arg) {
  tibble_abort(paste0(tick(as_label(value_arg)), " must be a vector, a bare list, a data frame or a matrix."))
}

abort_need_rhs_vector_or_null <- function(value_arg) {
  tibble_abort(paste0(tick(as_label(value_arg)), " must be a vector, a bare list, a data frame, a matrix, or NULL."))
}

abort_na_column_index <- function(j) {
  tibble_abort(pluralise_commas("Can't use NA as column index with `[` at position(s) ", j, "."), j = j)
}

abort_dim_column_index <- function(j) {
  # friendly_type_of() doesn't distinguish between matrices and arrays
  tibble_abort(paste0("Must use a vector in `[`, not an object of class ", class(j)[[1]], "."))
}

abort_assign_columns_non_na_only <- function() {
  tibble_abort("Can't use NA as column index in a tibble for assignment.")
}

abort_subset_columns_non_missing_only <- function() {
  tibble_abort("Subscript can't be missing for tibbles in `[[`.")
}

abort_assign_columns_non_missing_only <- function() {
  tibble_abort("Subscript can't be missing for tibbles in `[[<-`.")
}

abort_duplicate_column_subscript_for_assignment <- function(j) {
  j <- unique(j[duplicated(j)])
  tibble_abort(pluralise_commas("Column index(es) ", j, " [is](are) used more than once for assignment."), j = j)
}

abort_assign_rows_non_na_only <- function() {
  tibble_abort("Can't use NA as row index in a tibble for assignment.")
}

abort_duplicate_row_subscript_for_assignment <- function(i) {
  i <- unique(i[duplicated(i)])
  tibble_abort(pluralise_commas("Row index(es) ", i, " [is](are) used more than once for assignment."), i = i)
}

abort_assign_incompatible_size <- function(nrow, value, j, i_arg, value_arg, parent = NULL, call = my_caller_env()) {
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

abort_assign_incompatible_type <- function(x, value, j, value_arg, parent = NULL, call = my_caller_env()) {
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

abort_assign_vector <- function(value, j, value_arg, parent = NULL, call = my_caller_env()) {
  tibble_abort(
    paste0("Assigned data ", tick(as_label(value_arg)), " must be a vector."),
    actual = value[[j]],
    j = j,
    parent = parent,
    call = call
  )
}

# Subclassing errors ------------------------------------------------------

subclass_col_index_errors <- function(expr, j_arg, assign) {
  withCallingHandlers(
    expr,
    vctrs_error_subscript = function(cnd) {
      cnd$subscript_arg <- j_arg
      cnd$subscript_elt <- "column"
      if (isTRUE(assign) && !isTRUE(cnd$subscript_action %in% c("negate"))) {
        cnd$subscript_action <- "assign"
      }
      cnd_signal(cnd)
    }
  )
}

subclass_row_index_errors <- function(expr, i_arg, assign) {
  withCallingHandlers(
    expr,
    vctrs_error_subscript = function(cnd) {
      cnd$subscript_arg <- i_arg
      cnd$subscript_elt <- "row"
      if (isTRUE(assign) && !isTRUE(cnd$subscript_action %in% c("negate"))) {
        cnd$subscript_action <- "assign"
      }
      cnd_signal(cnd)
    }
  )
}

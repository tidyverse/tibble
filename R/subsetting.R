#' Subsetting tibbles
#'
#' @description
#' Accessing columns, rows, or cells via `$`, `[[`, or `[` is mostly similar to
#' [regular data frames][base::Extract.data.frame]. However, the
#' behavior is different for tibbles and data frames in some cases:
#' * `[` always returns a tibble by default, even if
#'   only one column is accessed.
#' * Partial matching of column names with `$` and `[[` is not supported, a
#'   warning is given and `NULL` is returned.
#' * Only scalars (vectors of length one) or vectors with the
#'   same length as the number of rows can be used for assignment.
#' * Rows outside of the tibble's boundaries cannot be accessed.
#' * When updating with `[[<-` and `[<-`, type changes of entire columns are
#'   supported, but updating a part of a column requires that the new value is
#'   coercible to the existing type.
#'   See [vec_slice()] for the underlying implementation.
#'
#' Unstable return type and implicit partial matching can lead to surprises and
#' bugs that are hard to catch. If you rely on code that requires the original
#' data frame behavior, coerce to a data frame via [as.data.frame()].
#'
#' @details
#' For better compatibility with older code written for regular data frames,
#' `[` supports a `drop` argument which defaults to `FALSE`.
#' New code should use `[[` to turn a column into a vector.
#'
#' @param value A value to store in a row, column, range or cell.
#'   Tibbles are stricter than data frames in what is accepted here.
#'
#' @name subsetting
#' @examples
#' df <- data.frame(a = 1:3, bc = 4:6)
#' tbl <- tibble(a = 1:3, bc = 4:6)
#'
#' # Subsetting single columns:
#' df[, "a"]
#' tbl[, "a"]
#' tbl[, "a", drop = TRUE]
#' as.data.frame(tbl)[, "a"]
#'
#' # Subsetting single rows with the drop argument:
#' df[1, , drop = TRUE]
#' tbl[1, , drop = TRUE]
#' as.list(tbl[1, ])
#'
#' # Accessing non-existent columns:
#' df$b
#' tbl$b
#'
#' df[["b", exact = FALSE]]
#' tbl[["b", exact = FALSE]]
#'
#' df$bd <- c("n", "e", "w")
#' tbl$bd <- c("n", "e", "w")
#' df$b
#' tbl$b
#'
#' df$b <- 7:9
#' tbl$b <- 7:9
#' df$b
#' tbl$b
#'
#' # Identical behavior:
#' tbl[1, ]
#' tbl[1, c("bc", "a")]
#' tbl[, c("bc", "a")]
#' tbl[c("bc", "a")]
#' tbl["a"]
#' tbl$a
#' tbl[["a"]]
NULL

#' @rdname subsetting
#' @inheritParams base::`[.data.frame`
#' @export
`$.tbl_df` <- function(x, name) {
  j <- match(as_string(name), names2(x))
  if (is.na(j)) {
    warn(paste0("Unknown or uninitialised column: `", name, "`."))
    NULL
  } else {
    .subset2(x, j)
  }
}


#' @rdname subsetting
#' @export
`$<-.tbl_df` <- function(x, name, value) {
  tbl_subassign(
    x, i = NULL, as_string(name), list(value),
    i_arg = NULL, j_arg = NULL, value_arg = substitute(value)
  )
}

#' @rdname subsetting
#' @param i,j Row and column indices. If `j` is omitted, `i` is used as column index.
#' @param ... Ignored.
#' @param exact Ignored, with a warning.
#' @export
`[[.tbl_df` <- function(x, i, j, ..., exact = TRUE) {
  if (!exact) {
    warn("`exact` ignored.")
  }

  n_dots <- dots_n(...)
  if (n_dots > 0) {
    warn("Extra arguments ignored.")
  }

  # Ignore exact as an argument for counting
  n_real_args <- nargs() - !missing(exact) - n_dots

  # Column subsetting if nargs() == 2L
  if (n_real_args <= 2L) {
    if (missing(i)) {
      abort(error_subset_columns_non_missing_only())
    }
    tbl_subset2(x, j = i, j_arg = substitute(i))
  } else if (missing(j) || missing(i)) {
    abort(error_subset_columns_non_missing_only())
  } else {
    i_arg <- substitute(i)
    i <- vectbl_as_row_location2(i, fast_nrow(x), i_arg)
    x <- tbl_subset2(x, j = j, j_arg = substitute(j))

    if (is.null(x)) {
      x
    } else {
      vec_slice(x, i)
    }
  }
}

#' @rdname subsetting
#' @inheritParams base::`[[<-.data.frame`
#' @export
`[[<-.tbl_df` <- function(x, i, j, ..., value) {
  i_arg <- substitute(i)
  j_arg <- substitute(j)

  if (missing(i)) {
    abort(error_assign_columns_non_missing_only())
  }

  if (missing(j)) {
    if (nargs() < 4) {
      j <- i
      i <- NULL
      j_arg <- i_arg
      i_arg <- NULL
    } else {
      abort(error_assign_columns_non_missing_only())
    }
  }

  if (!is_null(i)) {
    i <- vectbl_as_row_location2(i, fast_nrow(x), i_arg)
  }

  value <- list(value)

  j <- vectbl_as_new_col_index(j, x, value, j_arg, substitute(value))

  # Side effect: check scalar, allow OOB position
  if (!identical(unname(j), NA_integer_)) {
    vectbl_as_col_location2(j, length(x) + 1L, j_arg = j_arg)
  }

  # New columns are added to the end, provide index to avoid matching column
  # names again
  names(value) <- names(j)
  j <- coalesce2(unname(j), ncol(x) + 1L)

  tbl_subassign(x, i, j, value, i_arg = NULL, j_arg = NULL, value_arg = substitute(value))
}


#' @rdname subsetting
#' @param drop Coerce to a vector if fetching one column via `tbl[, j]` .
#'   Default `FALSE`, ignored when accessing a column via `tbl[j]` .
#' @export
`[.tbl_df` <- function(x, i, j, drop = FALSE, ...) {
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

  # Ignore drop as an argument for counting
  n_real_args <- nargs() - !missing(drop)

  # Column or matrix subsetting if nargs() == 2L
  if (n_real_args <= 2L) {
    if (!missing(drop)) {
      warn("`drop` argument ignored for subsetting a tibble with `x[j]`, it has an effect only for `x[i, j]`.")
      drop <- FALSE
    }

    j <- i
    i <- NULL
    j_arg <- i_arg
    i_arg <- NULL

    # Special case, returns a vector:
    if (is.matrix(j)) {
      return(tbl_subset_matrix(x, j, j_arg))
    }
  }

  # From here on, i, j and drop contain correct values:
  xo <- tbl_subset_col(x, j = j, j_arg)

  if (!is.null(i)) {
    xo <- tbl_subset_row(xo, i = i, i_arg)
  }

  if (drop && length(xo) == 1L) {
    tbl_subset2(xo, 1L, j_arg)
  } else {
    vectbl_restore(xo, x)
  }
}

#' @rdname subsetting
#' @inheritParams base::`[<-.data.frame`
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

vectbl_as_row_index <- function(i, x, i_arg) {
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
    vectbl_as_row_location(i, nr, i_arg)
  } else {
    vectbl_as_row_location(i, nr, i_arg)
  }
}

fix_oob <- function(i, n, warn = TRUE) {
  if (all(i >= 0, na.rm = TRUE)) {
    fix_oob_positive(i, n, warn)
  } else if (all(i <= 0, na.rm = TRUE)) {
    fix_oob_negative(i, n, warn)
  } else {
    # Will throw error in vec_as_location()
    i
  }
}

fix_oob_positive <- function(i, n, warn = TRUE) {
  oob <- which(i > n)
  if (warn) {
    warn_oob(oob, n)
  }

  i[oob] <- NA_integer_
  i
}

warn_oob <- function(oob, n) {
  if (has_length(oob)) {
    deprecate_soft("3.0.0", "tibble::`[.tbl_df`(i = 'must lie in [0, rows] if positive,')",
      details = "Use `NA` as row index to obtain a row full of `NA` values.")
  }
}

fix_oob_negative <- function(i, n, warn = TRUE) {
  oob <- (i < -n)
  if (warn) {
    warn_oob_negative(which(oob), n)
  }

  i <- i[!oob]
  if (is_empty(i)) i <- seq_len(n)
  i
}

warn_oob_negative <- function(oob, n) {
  if (has_length(oob)) {
    deprecate_soft("3.0.0", "tibble::`[.tbl_df`(i = 'must lie in [-rows, 0] if negative,')",
      details = "Use `NA` as row index to obtain a row full of `NA` values.")
  }
}

fix_oob_invalid <- function(i, is_na_orig) {
  oob <- which(is.na(i) & !is_na_orig)

  if (has_length(oob)) {
    deprecate_soft("3.0.0", "tibble::`[.tbl_df`(i = 'must use valid row names')",
      details = "Use `NA` as row index to obtain a row full of `NA` values.")

    i[oob] <- NA_integer_
  }
  i
}

vectbl_as_col_index <- function(j, x, j_arg) {
  stopifnot(!is.null(j))

  if (vec_is(j) && anyNA(j)) {
    abort(error_na_column_index(which(is.na(j))))
  }

  vectbl_as_col_location(j, length(x), names(x), j_arg = j_arg)
}

tbl_subset2 <- function(x, j, j_arg) {
  if (is.matrix(j)) {
    deprecate_soft("3.0.0", "tibble::`[[.tbl_df`(j = 'can\\'t be a matrix",
      details = "Recursive subsetting is deprecated for tibbles.")

    return(as.matrix(x)[[j]])
  } else if (has_length(j, 2) && is.numeric(j)) {
    deprecate_soft("3.0.0", "tibble::`[[.tbl_df`(j = 'can\\'t be a vector of length 2')",
      details = "Recursive subsetting is deprecated for tibbles.")

    return(.subset2(x, j))
  } else if (is.character(j)) {
    # Side effect: check that j is a scalar and not NA, allow invalid column names
    vectbl_as_col_location2(j, length(x) + 1L, c(names(x), j), j_arg = j_arg)

    # Don't warn when accessing invalid column names
    return(.subset2(x, j))
  }

  j <- vectbl_as_col_location2(j, length(x), names(x), j_arg = j_arg)
  .subset2(x, j)
}

tbl_subset_col <- function(x, j, j_arg) {
  if (is_null(j)) return(x)
  j <- vectbl_as_col_index(j, x, j_arg = j_arg)
  xo <- .subset(x, j)
  xo <- set_repaired_names(xo, .name_repair = "minimal")
  set_tibble_class(xo, nrow = fast_nrow(x))
}

tbl_subset_row <- function(x, i, i_arg) {
  if (is_null(i)) return(x)
  i <- vectbl_as_row_index(i, x, i_arg)
  xo <- lapply(unclass(x), vec_slice, i = i)
  set_tibble_class(xo, nrow = length(i))
}

tbl_subassign <- function(x, i, j, value, i_arg, j_arg, value_arg) {
  if (!vec_is(value)) {
    if (!is_null(i)) {
      abort(error_need_rhs_vector(value_arg))
    }
    if (!is_null(value)) {
      abort(error_need_rhs_vector_or_null(value_arg))
    }
  }

  if (is_null(value) || is_atomic(value)) {
    value <- list(value)
  } else {
    value <- unclass(value)
  }

  if (!is_bare_list(value)) {
    abort(error_need_rhs_vector_or_null(value_arg))
  }

  i <- vectbl_as_new_row_index(i, x, i_arg)

  if (is.null(i)) {
    if (is.null(j)) {
      j <- seq_along(x)
    } else {
      j <- vectbl_as_new_col_index(j, x, value, j_arg, value_arg)
    }

    value <- vectbl_recycle_rhs(value, fast_nrow(x), length(j), i_arg = NULL, value_arg)
    xo <- tbl_subassign_col(x, j, value)
  } else if (is_empty(i)) {
    return(x)
  } else {
    # Fill up rows first if necessary
    x <- tbl_expand_to_nrow(x, i)

    if (is.null(j)) {
      value <- vectbl_recycle_rhs(value, length(i), length(x), i_arg, value_arg)
      xo <- tbl_subassign_row(x, i, value, value_arg)
    } else {
      # Optimization: match only once
      # (Invariant: x[[j]] is equivalent to x[[vec_as_location(j)]],
      # allowed by corollary that only existing columns can be updated)
      j <- vectbl_as_new_col_index(j, x, value, j_arg, value_arg)
      new_cols <- which(is.na(j))
      value <- vectbl_recycle_rhs(value, length(i), length(j), i_arg, value_arg)

      # Fill up columns if necessary
      if (any(new_cols)) {
        x <- tbl_subassign_col(
          x, j[new_cols],
          map(value[new_cols], vec_slice, rep(NA_integer_, fast_nrow(x)))
        )
        j <- match(names(j), names(x))
      }

      xj <- tbl_subset_col(x, j, j_arg)
      xj <- tbl_subassign_row(xj, i, value, value_arg)
      xo <- tbl_subassign_col(x, j, unclass(xj))
    }
  }

  vectbl_restore(xo, x)
}

vectbl_as_new_row_index <- function(i, x, i_arg) {
  if (is.null(i)) {
    i
  } else if (is_bare_numeric(i)) {
    if (anyDuplicated(i)) {
      abort(error_duplicate_row_subscript_for_assignment(i))
    }

    nr <- fast_nrow(x)

    new <- which(i > nr)
    i_new <- i[new]
    i[new] <- NA
    i <- vectbl_as_row_location(i, nr, i_arg)

    if (!is_tight_sequence_at_end(i_new, nr)) {
      abort(error_new_rows_at_end_only(nr, i_new))
    }

    # Restore, caller knows how to deal
    i[new] <- i_new
    i
  } else if (is_logical(i)) {
    # Don't allow OOB logical
    vectbl_as_row_location(i, fast_nrow(x), i_arg)
  } else {
    i <- vectbl_as_row_index(i, x, i_arg)
    if (anyDuplicated(i, incomparables = NA)) {
      abort(error_duplicate_row_subscript_for_assignment(i))
    }
    i
  }
}

vectbl_as_new_col_index <- function(j, x, value, j_arg, value_arg) {
  # Creates a named index vector
  # Values: index
  # Name: column name (for new columns)

  if (vec_is(j) && anyNA(j)) {
    abort(error_assign_columns_non_na_only())
  }

  if (is_bare_character(j)) {
    set_names(match(j, names(x)), j)
  } else if (is_bare_numeric(j)) {
    if (anyDuplicated(j)) {
      abort(error_duplicate_column_subscript_for_assignment(j))
    }

    new <- which(j > ncol(x))
    j_new <- j[new]
    j[new] <- NA
    j <- vectbl_as_col_location(j, ncol(x), j_arg = j_arg)

    if (!is_tight_sequence_at_end(j_new, ncol(x))) {
      abort(error_new_columns_at_end_only(ncol(x), j_new))
    }

    # FIXME: Recycled names are not repaired
    # FIXME: Hard-coded name repair
    names <- vectbl_recycle_rhs_names(names2(value), length(j), value_arg)
    names[new][names[new] == ""] <- paste0("...", j_new)

    set_names(j, names)
  } else {
    j <- vectbl_as_col_index(j, x, j_arg)
    if (anyDuplicated(j)) {
      abort(error_duplicate_column_subscript_for_assignment(j))
    }
    j
  }
}

vectbl_as_row_location <- function(i, n, i_arg) {
  subclass_row_index_errors(vec_as_location(i, n, arg = as_label(i_arg)), i_arg = i_arg)
}

vectbl_as_row_location2 <- function(i, n, i_arg) {
  subclass_row_index_errors(vec_as_location2(i, n, arg = as_label(i_arg)), i_arg = i_arg)
}

vectbl_as_col_location <- function(i, n, names = NULL, j_arg) {
  subclass_col_index_errors(vec_as_location(i, n, names, arg = as_label(j_arg)), j_arg = j_arg)
}

vectbl_as_col_location2 <- function(i, n, names = NULL, j_arg) {
  subclass_col_index_errors(vec_as_location2(i, n, names, arg = as_label(j_arg)), j_arg = j_arg)
}

is_tight_sequence_at_end <- function(i_new, n) {
  all(sort(i_new) == seq2(n + 1, n + length(i_new)))
}

tbl_subassign_col <- function(x, j, value) {
  is_data <- !map_lgl(value, is_null)
  nrow <- fast_nrow(x)

  x <- unclass(x)

  # Create or update
  for (jj in which(is_data)) {
    ji <- coalesce2(j[[jj]], names(j)[[jj]])
    x[[ji]] <- value[[jj]]
  }

  # Remove
  j_remove <- j[!is_data & !is.na(j)]
  if (has_length(j_remove)) x <- x[-j_remove]

  # Restore
  set_tibble_class(x, nrow)
}

coalesce2 <- function(x, y) {
  if (is.na(x)) y else x
}

tbl_expand_to_nrow <- function(x, i) {
  nrow <- fast_nrow(x)

  new_nrow <- max(i, nrow)

  if (is.na(new_nrow)) {
    abort(error_assign_rows_non_na_only())
  }

  if (new_nrow != nrow) {
    # FIXME: vec_expand()?
    i_expand <- c(seq_len(nrow), rep(NA_integer_, new_nrow - nrow))
    x <- vec_slice(x, i_expand)
  }

  x
}

tbl_subassign_row <- function(x, i, value, value_arg) {
  nrow <- fast_nrow(x)
  x <- unclass(x)

  tryCatch(
    for (j in seq_along(x)) {
      xj <- x[[j]]
      vec_slice(xj, i) <- value[[j]]
      x[[j]] <- xj
    },

    vctrs_error_incompatible_type = function(cnd) {
      cnd_signal(error_incompatible_new_data_type(x, value, j, value_arg, cnd_message(cnd)))
    }
  )

  set_tibble_class(x, nrow)
}

fast_nrow <- function(x) {
  .row_names_info(x, 2L)
}

vectbl_recycle_rhs <- function(value, nrow, ncol, i_arg, value_arg, full) {
  tryCatch(
    for (j in seq_along(value)) {
      if (!is.null(value[[j]])) {
        value[[j]] <- vec_recycle(value[[j]], nrow)
      }
    },

    vctrs_error_recycle_incompatible_size = function(cnd) {
      cnd_signal(error_inconsistent_new_data_size(nrow, value, j, i_arg, value_arg))
    }
  )

  # Errors have been caught beforehand in vectbl_recycle_rhs_names()
  vec_recycle(value, ncol)
}

vectbl_recycle_rhs_names <- function(names, n, value_arg) {
  unname(vec_recycle(set_names(names), n, x_arg = as_label(value_arg)))
}

# Dedicated functions for faster subsetting
set_tibble_class <- function(x, nrow) {
  attr(x, "row.names") <- .set_row_names(nrow)
  class(x) <- tibble_class
  x
}

# External ----------------------------------------------------------------

vectbl_restore <- function(xo, x) {
  .Call(`tibble_restore_impl`, xo, x)
}

string_to_indices <- function(x) {
  .Call(`tibble_string_to_indices`, as.character(x))
}

# Errors ------------------------------------------------------------------

error_need_rhs_vector <- function(value_arg) {
  tibble_error(paste0("`", as_label(value_arg), "` must be a vector, a bare list or a data frame in `[<-`."))
}

error_need_rhs_vector_or_null <- function(value_arg) {
  tibble_error(paste0("`", as_label(value_arg), "` must be a vector, a bare list, a data frame or NULL in `[<-`."))
}

error_na_column_index <- function(j) {
  tibble_error(pluralise_commas("Can't use NA as column index with `[` at position(s) ", j, "."), j = j)
}

error_dim_column_index <- function(j) {
  tibble_error(paste0("Must use a vector in `[`, not an object of class ", class(j)[[1L]], "."))
}

error_assign_columns_non_na_only <- function() {
  tibble_error("Can't use NA as column index in a tibble for assignment.")
}

error_subset_columns_non_missing_only <- function() {
  tibble_error("Subscript can't be missing for tibbles in `[[`.")
}

error_assign_columns_non_missing_only <- function() {
  tibble_error("Subscript can't be missing for tibbles in `[[<-`.")
}

error_new_columns_at_end_only <- function(ncol, j) {
  j <- j[j > ncol + 1]
  tibble_error(
    pluralise_commas("Can't assign column(s) ", j, " in a tibble with ", ncol, pluralise_n(" column(s).", ncol)),
    ncol = ncol, j = j
  )
}

error_duplicate_column_subscript_for_assignment <- function(j) {
  j <- unique(j[duplicated(j)])
  tibble_error(pluralise_commas("Column index(es) ", j, " [is](are) used more than once for assignment."), j = j)
}

error_assign_rows_non_na_only <- function() {
  tibble_error("Can't use NA as row index in a tibble for assignment.")
}

error_new_rows_at_end_only <- function(nrow, i) {
  i <- i[i > nrow + 1]
  tibble_error(
    pluralise_commas("Can't assign row(s) ", i, " in a tibble with ", nrow, pluralise_n(" row(s).", nrow)),
    nrow = nrow, i = i
  )
}

error_duplicate_row_subscript_for_assignment <- function(i) {
  i <- unique(i[duplicated(i)])
  tibble_error(pluralise_commas("Row index(es) ", i, " [is](are) used more than once for assignment."), i = i)
}

error_inconsistent_new_data_size <- function(nrow, value, j, i_arg, value_arg) {
  if (is.null(i_arg)) {
    target <- "existing data"
    existing <- pluralise_count("Existing data has ", nrow, " row(s)")
  } else {
    target <- paste0("subscript `", as_label(i_arg), "`")
    existing <- pluralise_count("Subscript has ", nrow, " row(s)")
  }

  new <- paste0(pluralise_count("contributes ", vec_size(value[[j]]), " row(s)"))
  if (length(value) != 1) {
    new <- paste0("Element ", j, " of new data ", new)
  } else {
    new <- paste0("New data ", new)
  }

  tibble_error(
    bullets(
      paste0("New data `", as_label(value_arg), "` must be consistent with ", target, ":"),
      existing,
      new,
      "Only vectors of size 1 are recycled"
    ),
    expected = nrow,
    actual = vec_size(value[[j]]),
    j = j
  )
}

error_incompatible_new_data_type <- function(x, value, j, value_arg, message) {
  name <- names(x)[[j]]

  tibble_error(
    bullets(
      paste0("New data `", as_label(value_arg), "` must be compatible with existing data:"),
      paste0("Target: column ", tick(name)),
      paste0("Position: ", j),
      message
    ),
    expected = x[[j]],
    actual = value[[j]],
    name = name,
    j = j
  )
}

# Subclassing errors ------------------------------------------------------

subclass_col_index_errors <- function(expr, j_arg) {
  tryCatch(
    force(expr),
    vctrs_error_subscript = function(cnd) {
      cnd$subscript_arg <- j_arg
      cnd$subscript_elt <- "column"
      cnd_signal(cnd)
    }
  )
}

subclass_row_index_errors <- function(expr, i_arg) {
  tryCatch(
    force(expr),
    vctrs_error_subscript = function(cnd) {
      cnd$subscript_arg <- i_arg
      cnd$subscript_elt <- "row"
      cnd_signal(cnd)
    }
  )
}

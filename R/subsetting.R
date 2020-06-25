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
  out <- .subset2(x, name)
  if (is.null(out)) {
    warn(paste0("Unknown or uninitialised column: ", tick(name), "."))
  }
  out
}


#' @rdname subsetting
#' @export
`$<-.tbl_df` <- function(x, name, value) {
  tbl_subassign(
    x, i = NULL, as_string(name), list(value),
    i_arg = NULL, j_arg = name, value_arg = substitute(value)
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
      cnd_signal(error_subset_columns_non_missing_only())
    }
    tbl_subset2(x, j = i, j_arg = substitute(i))
  } else if (missing(j) || missing(i)) {
    cnd_signal(error_subset_columns_non_missing_only())
  } else {
    i_arg <- substitute(i)
    i <- vectbl_as_row_location2(i, fast_nrow(x), i_arg)
    x <- tbl_subset2(x, j = j, j_arg = substitute(j))

    if (is.null(x)) {
      x
    } else {
      vectbl_strip_names(vec_slice(x, i))
    }
  }
}

#' @rdname subsetting
#' @inheritParams base::`[[<-.data.frame`
#' @export
`[[<-.tbl_df` <- function(x, i, j, ..., value) {
  i_arg <- substitute(i)
  j_arg <- substitute(j)
  value_arg <- substitute(value)

  if (missing(i)) {
    cnd_signal(error_assign_columns_non_missing_only())
  }

  if (missing(j)) {
    if (nargs() < 4) {
      j <- i
      i <- NULL
      j_arg <- i_arg
      i_arg <- NULL
    } else {
      cnd_signal(error_assign_columns_non_missing_only())
    }
  }

  if (!is.null(i)) {
    i <- vectbl_as_row_location2(i, fast_nrow(x), i_arg, assign = TRUE)
  }

  value <- list(value)

  j <- vectbl_as_new_col_index(j, x, value, j_arg, value_arg)

  # Side effect: check scalar
  if (length(j) != 1L) {
    vectbl_as_col_location2(j, length(x) + 1L, j_arg = j_arg, assign = TRUE)
  }
  # New columns are added to the end, provide index to avoid matching column
  # names again
  names(value) <- names(j)

  tbl_subassign(x, i, j, value, i_arg = NULL, j_arg = NULL, value_arg = value_arg)
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
  xo <- x

  if (!is.null(j)) {
    j <- vectbl_as_col_location(j, length(xo), names(xo), j_arg = j_arg, assign = FALSE)

    if (anyNA(j)) {
      cnd_signal(error_na_column_index(which(is.na(j))))
    }

    xo <- .subset(x, j)

    if (anyDuplicated(j)) {
      xo <- set_repaired_names(xo, .name_repair = "minimal")
    }

    xo <- set_tibble_class(xo, nrow = fast_nrow(x))
  }

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
                   env = foreign_caller_env())
  }

  i[oob] <- NA_integer_
  i
}

fix_oob_negative <- function(i, n, warn = TRUE) {
  oob <- (i < -n)
  if (warn && any(oob, na.rm = TRUE)) {
    deprecate_soft("3.0.0", "tibble::`[.tbl_df`(i = 'must lie in [-rows, 0] if negative,')",
                   details = "Use `NA_integer_` as row index to obtain a row full of `NA` values.",
                   env = foreign_caller_env())
  }

  i <- i[!oob]
  if (is_empty(i)) i <- seq_len(n)
  i
}

fix_oob_invalid <- function(i, is_na_orig) {
  oob <- which(is.na(i) & !is_na_orig)

  if (has_length(oob)) {
    deprecate_soft("3.0.0", "tibble::`[.tbl_df`(i = 'must use valid row names')",
      details = "Use `NA_integer_` as row index to obtain a row full of `NA` values.",
      env = foreign_caller_env())

    i[oob] <- NA_integer_
  }
  i
}

tbl_subset2 <- function(x, j, j_arg) {
  if (is.matrix(j)) {
    deprecate_soft("3.0.0", "tibble::`[[.tbl_df`(j = 'can\\'t be a matrix",
      details = "Recursive subsetting is deprecated for tibbles.",
      env = foreign_caller_env())

    return(as.matrix(x)[[j]])
  } else if (is.numeric(j)) {
    if (length(j) == 1L) {
      if (is.na(j) || j < 1 || j > length(x) || (is.double(j) && j != trunc(j))) {
        # Side effect: throw error for invalid j
        vectbl_as_col_location2(j, length(x), j_arg = j_arg)
      }
    } else if (length(j) == 2L) {
      deprecate_soft("3.0.0", "tibble::`[[.tbl_df`(j = 'can\\'t be a vector of length 2')",
        details = "Recursive subsetting is deprecated for tibbles.",
        env = foreign_caller_env())
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

tbl_subset_row <- function(x, i, i_arg) {
  if (is.null(i)) return(x)
  i <- vectbl_as_row_index(i, x, i_arg)
  xo <- lapply(unclass(x), vec_slice, i = i)
  set_tibble_class(xo, nrow = length(i))
}

tbl_subassign <- function(x, i, j, value, i_arg, j_arg, value_arg) {
  if (!is.null(i_arg) && !is.null(i)) {
    i <- vectbl_as_new_row_index(i, x, i_arg)
  }

  if (is.null(i)) {
    value <- vectbl_wrap_rhs_col(value, value_arg)

    if (is.null(j)) {
      j <- seq_along(x)
    } else if (!is.null(j_arg)) {
      j <- vectbl_as_new_col_index(j, x, value, j_arg, value_arg)
    }

    value <- vectbl_recycle_rhs(value, fast_nrow(x), length(j), i_arg = NULL, value_arg)
    xo <- tbl_subassign_col(x, j, value)
  } else if (is_empty(i)) {
    return(x)
  } else {
    # Fill up rows first if necessary
    x <- tbl_expand_to_nrow(x, i)
    value <- vectbl_wrap_rhs_row(value, value_arg)

    if (is.null(j)) {
      value <- vectbl_recycle_rhs(value, length(i), length(x), i_arg, value_arg)
      xo <- tbl_subassign_row(x, i, value, value_arg)
    } else {
      # Optimization: match only once
      # (Invariant: x[[j]] is equivalent to x[[vec_as_location(j)]],
      # allowed by corollary that only existing columns can be updated)
      if (!is.null(j_arg)) {
        j <- vectbl_as_new_col_index(j, x, value, j_arg, value_arg)
      }
      new <- which(j > length(x))
      value <- vectbl_recycle_rhs(value, length(i), length(j), i_arg, value_arg)

      # Fill up columns if necessary
      if (has_length(new)) {
        init <- map(value[new], vec_slice, rep(NA_integer_, fast_nrow(x)))
        names(init) <- coalesce2(names2(j)[new], names2(value)[new])

        x <- tbl_subassign_col(x, j[new], init)
      }

      xj <- .subset(x, j)
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
      cnd_signal(error_duplicate_row_subscript_for_assignment(i))
    }

    nr <- fast_nrow(x)

    new <- which(i > nr)
    if (length(new) > 0) {
      i_new <- i[new]
      i[new] <- NA

      if (!is_tight_sequence_at_end(i_new, nr)) {
        cnd_signal(error_new_rows_at_end_only(nr, i_new))
      }
    }

    # Only update existing, caller knows how to deal with OOB
    i <- vectbl_as_row_location(i, nr, i_arg, assign = TRUE)

    # Restore, caller knows how to deal
    if (length(new) > 0) {
      i[new] <- i_new
    }
    i
  } else if (is_logical(i)) {
    # Don't allow OOB logical
    vectbl_as_row_location(i, fast_nrow(x), i_arg, assign = TRUE)
  } else {
    i <- vectbl_as_row_index(i, x, i_arg, assign = TRUE)
    if (anyDuplicated(i, incomparables = NA)) {
      cnd_signal(error_duplicate_row_subscript_for_assignment(i))
    }
    i
  }
}

vectbl_as_new_col_index <- function(j, x, value, j_arg, value_arg) {
  # Creates a named index vector
  # Values: index
  # Name: column name (for new columns)

  if (vec_is(j) && anyNA(j)) {
    cnd_signal(error_assign_columns_non_na_only())
  }

  if (is_bare_character(j)) {
    out <- match(j, names(x))
    new <- which(is.na(out))
    if (has_length(new)) {
      out[new] <- seq.int(length(x) + 1L, length.out = length(new))
    }
    set_names(out, j)
  } else if (is_bare_numeric(j)) {
    if (anyDuplicated(j)) {
      cnd_signal(error_duplicate_column_subscript_for_assignment(j))
    }

    new <- which(j > length(x))
    if (length(new) > 0) {
      j_new <- j[new]
      j[new] <- NA

      if (!is_tight_sequence_at_end(j_new, length(x))) {
        cnd_signal(error_new_columns_at_end_only(length(x), j_new))
      }
    }

    j <- vectbl_as_col_location(j, length(x), j_arg = j_arg, assign = TRUE)
    # FIXME: Recycled names are not repaired
    # FIXME: Hard-coded name repair
    names <- vectbl_recycle_rhs_names(names2(value), length(j), value_arg)

    if (length(new) > 0) {
      j[new] <- j_new
      names[new][names[new] == ""] <- paste0("...", j_new)
    }

    set_names(j, names)
  } else {
    j <- vectbl_as_col_location(j, length(x), names(x), j_arg = j_arg, assign = TRUE)

    if (anyNA(j)) {
      cnd_signal(error_na_column_index(which(is.na(j))))
    }

    if (anyDuplicated(j)) {
      cnd_signal(error_duplicate_column_subscript_for_assignment(j))
    }

    j
  }
}

vectbl_as_row_location <- function(i, n, i_arg, assign = FALSE) {
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

  subclass_row_index_errors(vec_as_location(i, n), i_arg = i_arg, assign = assign)
}

vectbl_as_row_location2 <- function(i, n, i_arg, assign = FALSE) {
  subclass_row_index_errors(vec_as_location2(i, n), i_arg = i_arg, assign = assign)
}

vectbl_as_col_location <- function(j, n, names = NULL, j_arg, assign = FALSE) {
  subclass_col_index_errors(vec_as_location(j, n, names), j_arg = j_arg, assign = assign)
}

vectbl_as_col_location2 <- function(j, n, names = NULL, j_arg, assign = FALSE) {
  subclass_col_index_errors(vec_as_location2(j, n, names), j_arg = j_arg, assign = assign)
}

is_tight_sequence_at_end <- function(i_new, n) {
  all(sort(i_new) == seq2(n + 1, n + length(i_new)))
}

tbl_subassign_col <- function(x, j, value) {
  is_data <- !vapply(value, is.null, NA)
  nrow <- fast_nrow(x)

  x <- unclass(x)

  # Grow, assign new names
  new <- which(j > length(x))
  if (has_length(new)) {
    length(x) <- max(j[new])
    names(x)[ j[new] ] <- coalesce2(names2(j)[new], names2(value)[new])
  }

  # Update
  for (jj in which(is_data)) {
    ji <- j[[jj]]
    x[[ji]] <- value[[jj]]
  }

  # Remove
  j_remove <- j[!is_data & !is.na(j)]
  if (has_length(j_remove)) x <- x[-j_remove]

  # Restore
  set_tibble_class(x, nrow)
}

coalesce2 <- function(x, y) {
  use_y <- which(is.na(x))
  x[use_y] <- y[use_y]
  x
}

tbl_expand_to_nrow <- function(x, i) {
  nrow <- fast_nrow(x)

  new_nrow <- max(i, nrow)

  if (is.na(new_nrow)) {
    cnd_signal(error_assign_rows_non_na_only())
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

  withCallingHandlers(
    for (j in seq_along(x)) {
      xj <- x[[j]]
      vec_slice(xj, i) <- value[[j]]
      x[[j]] <- xj
    },

    vctrs_error = function(cnd) {
      cnd_signal(error_assign_incompatible_type(x, value, j, value_arg, cnd_message(cnd)))
    }
  )

  set_tibble_class(x, nrow)
}

fast_nrow <- function(x) {
  .row_names_info(x, 2L)
}

vectbl_strip_names <- function(x) {
  maybe_row_names <- is.data.frame(x) || is.array(x)

  if (maybe_row_names) {
    row.names(x) <- NULL
  } else {
    names(x) <- NULL
  }

  x
}

vectbl_wrap_rhs_col <- function(value, value_arg) {
  if (is.null(value)) {
    return(list(value))
  }

  value <- result_vectbl_wrap_rhs(value)
  if (is.null(value)) {
    cnd_signal(error_need_rhs_vector_or_null(value_arg))
  }

  value
}

vectbl_wrap_rhs_row <- function(value, value_arg) {
  value <- result_vectbl_wrap_rhs(value)
  if (is.null(value)) {
    cnd_signal(error_need_rhs_vector(value_arg))
  }

  value
}

result_vectbl_wrap_rhs <- function(value) {
  if (!vec_is(value)) {
    NULL
  } else if (is.array(value)) {
    if (any(dim(value)[-1:-2] != 1)) {
      return(NULL)
    }
    dim(value) <- head(dim(value), 2)
    as.list(as.data.frame(value, stringsAsFactors = FALSE))
  } else if (is_atomic(value)) {
    list(value)
  } else {
    unclass(value)
  }
}

vectbl_recycle_rhs <- function(value, nrow, ncol, i_arg, value_arg) {
  withCallingHandlers(
    for (j in seq_along(value)) {
      if (!is.null(value[[j]])) {
        value[[j]] <- vec_recycle(value[[j]], nrow)
      }
    },

    vctrs_error_recycle_incompatible_size = function(cnd) {
      cnd_signal(error_assign_incompatible_size(nrow, value, j, i_arg, value_arg))
    }
  )

  # Errors have been caught beforehand in vectbl_recycle_rhs_names()
  vec_recycle(value, ncol)
}

vectbl_recycle_rhs_names <- function(names, n, value_arg) {
  if (n == 1L && length(names) == 1L) {
    return(names)
  }
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
  tibble_error(paste0(tick(as_label(value_arg)), " must be a vector, a bare list, a data frame or a matrix."))
}

error_need_rhs_vector_or_null <- function(value_arg) {
  tibble_error(paste0(tick(as_label(value_arg)), " must be a vector, a bare list, a data frame, a matrix, or NULL."))
}

error_na_column_index <- function(j) {
  tibble_error(pluralise_commas("Can't use NA as column index with `[` at position(s) ", j, "."), j = j)
}

error_dim_column_index <- function(j) {
  # friendly_type_of() doesn't distinguish between matrices and arrays
  tibble_error(paste0("Must use a vector in `[`, not an object of class ", class(j)[[1]], "."))
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

error_assign_incompatible_size <- function(nrow, value, j, i_arg, value_arg) {
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

  tibble_error(
    bullets(
      paste0("Assigned data ", tick(as_label(value_arg)), " must be compatible with ", target, ":"),
      x = existing,
      x = new,
      i = if (nrow != 1) "Only vectors of size 1 are recycled",
      i = if (nrow == 1 && vec_size(value[[j]]) != 1) "Row updates require a list value. Do you need `list()` or `as.list()`?"
    ),
    expected = nrow,
    actual = vec_size(value[[j]]),
    j = j
  )
}

error_assign_incompatible_type <- function(x, value, j, value_arg, message) {
  name <- names(x)[[j]]

  tibble_error(
    bullets(
      paste0("Assigned data ", tick(as_label(value_arg)), " must be compatible with existing data:"),
      i = paste0("Error occurred for column ", tick(name)),
      x = message
    ),
    expected = x[[j]],
    actual = value[[j]],
    name = name,
    j = j
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

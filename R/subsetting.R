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
  tbl_subassign(x, i = NULL, as_string(name), list(value))
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
    tbl_subset2(x, j = i)
  } else if (missing(j)) {
    error_missing_column_index()
  } else {
    i <- vec_as_row_index(i, x)
    check_scalar(i)

    x <- tbl_subset2(x, j = j)
    if (is.null(x)) return(x)
    vec_slice(x, i)
  }
}

#' @rdname subsetting
#' @inheritParams base::`[[<-.data.frame`
#' @export
`[[<-.tbl_df` <- function(x, i = NULL, j = NULL, value) {
  if (is.null(j) && nargs() < 4) {
    j <- i
    i <- NULL
  }

  if (!is_null(i)) {
    i <- vec_as_row_index(i, x)
    check_scalar(i)
  }

  if (is_null(j)) {
    error_missing_column_index()
  }

  value <- list(value)

  j <- vec_as_new_col_index(j, x, value)
  check_scalar(j)

  # New columns are added to the end, provide index to avoid matching column
  # names again
  names(value) <- names(j)
  j <- coalesce2(unname(j), ncol(x) + 1L)

  tbl_subassign(x, i, j, value)
}


#' @rdname subsetting
#' @param drop Coerce to a vector if fetching one column via `tbl[, j]` .
#'   Default `FALSE`, ignored when accessing a column via `tbl[j]` .
#' @export
`[.tbl_df` <- function(x, i = NULL, j = NULL, drop = FALSE) {
  # Ignore drop as an argument for counting
  n_real_args <- nargs() - !missing(drop)

  # Column subsetting if nargs() == 2L
  if (n_real_args <= 2L) {
    if (!missing(drop)) warn("`drop` ignored")

    xo <- tbl_subset_col(x, j = i)
    vec_restore(xo, x)
  } else {
    xo <- x
    xo <- tbl_subset_col(xo, j = j)
    xo <- tbl_subset_row(xo, i = i)

    if (drop && length(xo) == 1L) {
      tbl_subset2(xo, 1L)
    } else {
      vec_restore(xo, x, n = fast_nrow(xo))
    }
  }
}

#' @rdname subsetting
#' @inheritParams base::`[<-.data.frame`
#' @export
`[<-.tbl_df` <- function(x, i = NULL, j = NULL, value) {
  if (is.null(j) && nargs() < 4) {
    j <- i
    i <- NULL
  }

  tbl_subassign(x, i, j, value)
}

vec_as_row_index <- function(i, x) {
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

    oob <- which(is.na(i) & !is_na_orig)

    if (has_length(oob)) {
      warn_deprecated("Only valid row names can be used for indexing. Use `NA` as row index to obtain a row full of `NA` values.")
      i[oob] <- NA_integer_
    }
  } else if (is.numeric(i)) {
    i <- fix_oob(i, nr)
    i <- vec_as_index(i, nr)
  } else if (is.logical(i)) {
    if (length(i) != 1L && length(i) != nr) {
      warn_deprecated(paste0(
        "Length of logical index must be 1",
        if (nr != 1) paste0(" or ", nr),
        ", not ", length(i)
      ))
      return(seq_len(nr)[i])
    }
  }

  vec_as_index(i, nr)
}

fix_oob <- function(i, n, warn = TRUE) {
  if (all(i >= 0, na.rm = TRUE)) {
    fix_oob_positive(i, n, warn)
  } else if (all(i <= 0, na.rm = TRUE)) {
    fix_oob_negative(i, n, warn)
  } else {
    # Will throw error in vec_as_index()
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
    warn_deprecated(paste0(
      "Row indexes must be between 0 and the number of rows (", n, "). ",
      "Use `NA` as row index to obtain a row full of `NA` values."
    ))
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
    warn_deprecated(paste0(
      "Negative row indexes must be between 0 and the number of rows negated (", -n, "). ",
      "Use `NA` as row index to obtain a row full of `NA` values."
    ))
  }
}

vec_as_col_index <- function(j, x) {
  stopifnot(!is.null(j))

  if (anyNA(j)) {
    abort(error_na_column_index(which(is.na(j))))
  }

  vec_as_index(j, length(x), names(x))
}

tbl_subset2 <- function(x, j) {
  if (is.matrix(j)) {
    signal_soft_deprecated("Calling `[[` with a matrix (recursive subsetting) is deprecated and will eventually be converted to an error.")
    return(as.matrix(x)[[j]])
  } else if (has_length(j, 2) && is.numeric(j)) {
    signal_soft_deprecated("Calling `[[` with a vector of length 2 (recursive subsetting) is deprecated and will eventually be converted to an error.")
    return(.subset2(x, j))
  } else if (is.numeric(j)) {
    # Always an error or a warning
    j <- vec_as_index(j, length(x))
  }

  check_scalar(j)
  if (is.logical(j) && !is.na(j)) {
    # FIXME: #647, https://github.com/tidyverse/tibble/issues/647

    # Special case: scalar TRUE or FALSE
    error_double_bracket_logical()
  }

  # Let .subset2() handle character indexes
  .subset2(x, j)
}

tbl_subset_col <- function(x, j) {
  if (is_null(j)) return(x)
  j <- vec_as_col_index(j, x)
  xo <- .subset(x, j)
  set_tibble_class(xo, nrow = fast_nrow(x))
}

tbl_subset_row <- function(x, i) {
  if (is_null(i)) return(x)
  i <- vec_as_row_index(i, x)
  xo <- lapply(unclass(x), vec_slice, i = i)
  set_tibble_class(xo, nrow = length(i))
}

tbl_subassign <- function(x, i, j, value) {
  if (is_null(value) || is_atomic(value)) {
    value <- list(value)
  } else {
    value <- unclass(value)
  }
  stopifnot(is_bare_list(value))

  if (is.null(i)) {
    if (is.null(j)) j <- seq_along(x)

    xo <- tbl_subassign_col(x, j, value)
  } else if (is.null(j)) {
    xo <- tbl_subassign_row(x, i, value)
  } else {
    # Optimization: match only once
    # (Invariant: x[[j]] is equivalent to x[[vec_as_index(j)]],
    # allowed by corollary that only existing columns can be updated)
    j <- vec_as_col_index(j, x)

    xj <- tbl_subset_col(x, j)
    xj <- tbl_subassign_row(xj, i, value)
    xo <- tbl_subassign_col(x, j, unclass(xj))
  }

  vec_restore(xo, x)
}

vec_as_new_row_index <- function(i, x) {
  if (is_bare_numeric(i)) {
    if (anyDuplicated(i)) {
      abort(error_duplicate_subscript_for_assignment())
    }

    nr <- fast_nrow(x)

    new <- which(i > nr)
    i_new <- i[new]
    i[new] <- NA
    i <- vec_as_index(i, nr)

    if (!is_tight_sequence_at_end(i_new, nr)) {
      abort(error_new_rows_at_end_only())
    }

    # Restore, caller knows how to deal
    i[new] <- i_new
    i
  } else if (is_logical(i)) {
    # Don't allow OOB logical
    vec_as_index(i, fast_nrow(x))
  } else {
    i <- vec_as_row_index(i, x)
    if (anyDuplicated(i)) {
      abort(error_duplicate_subscript_for_assignment())
    }
    i
  }
}

vec_as_new_col_index <- function(j, x, value) {
  # Creates a named index vector
  # Values: index,
  # Name: column name (for new columns)

  if (anyNA(j)) {
    abort(error_new_columns_non_na_only())
  }

  if (is_bare_character(j)) {
    set_names(match(j, names(x)), j)
  } else if (is_bare_numeric(j)) {
    if (anyDuplicated(j)) {
      abort(error_duplicate_subscript_for_assignment())
    }

    new <- which(j > ncol(x))
    j_new <- j[new]
    j[new] <- NA
    j <- vec_as_index(j, ncol(x))

    if (!is_tight_sequence_at_end(j_new, ncol(x))) {
      abort(error_new_columns_at_end_only())
    }

    # FIXME: Recycled names are not repaired
    # FIXME: Hard-coded name repair
    names <- vec_recycle(names2(value), length(j))
    names[new][names[new] == ""] <- paste0("...", j_new)

    set_names(j, names)
  } else {
    j <- vec_as_col_index(j, x)
    if (anyDuplicated(j)) {
      abort(error_duplicate_subscript_for_assignment())
    }
    j
  }
}

is_tight_sequence_at_end <- function(i_new, n) {
  all(sort(i_new) == seq2(n + 1, n + length(i_new)))
}

tbl_subassign_col <- function(x, j, value) {
  j <- vec_as_new_col_index(j, x, value)

  value <- vec_recycle(value, length(j))

  is_data <- !map_lgl(value, is_null)
  nrow <- fast_nrow(x)

  x <- unclass(x)

  # Create or update
  for (jj in which(is_data)) {
    ji <- coalesce2(j[[jj]], names(j)[[jj]])
    x[[ji]] <- vec_recycle(value[[jj]], nrow)
  }

  # Remove
  j_remove <- j[!is_data]
  if (has_length(j_remove)) x <- x[-j_remove]

  # Restore
  set_tibble_class(x, nrow)
}

coalesce2 <- function(x, y) {
  if (is.na(x)) y else x
}

tbl_subassign_row <- function(x, i, value) {
  value <- vec_recycle(value, ncol(x))

  nrow <- fast_nrow(x)
  i <- vec_as_new_row_index(i, x)

  new_nrow <- max(i, nrow)

  if (is.na(new_nrow)) {
    error_na_new_row()
  }

  if (new_nrow != nrow) {
    # FIXME: vec_expand()?
    i_expand <- c(seq_len(nrow), rep(NA_integer_, new_nrow - nrow))
    x <- vec_slice(x, i_expand)
  }

  x <- unclass(x)

  for (j in seq_along(x)) {
    xj <- x[[j]]
    vec_slice(xj, i) <- value[[j]]
    x[[j]] <- xj
  }

  set_tibble_class(x, new_nrow)
}

check_scalar <- function(ij) {
  if (!has_length(ij, 1)) {
    abort(error_need_scalar())
  }
}

fast_nrow <- function(x) {
  .row_names_info(x, 2L)
}

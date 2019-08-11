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
  if (is.character(name)) {
    ret <- .subset2(x, name)
    if (is.null(ret)) warningc("Unknown or uninitialised column: '", name, "'.")
    return(ret)
  }
  .subset2(x, name)
}


#' @rdname subsetting
#' @export
`$<-.tbl_df` <- function(x, name, value) {
  name <- as_string(name)
  value <- col_recycle(value, x, name)

  tbl_extract2_assign_do(x, name, value)
}

#' @rdname subsetting
#' @param i,j Row and column indices. If `j` is omitted, `i` is used as column index.
#' @param ... Ignored.
#' @param exact Ignored, with a warning.
#' @export
`[[.tbl_df` <- function(x, i, j, ..., exact = TRUE) {
  if (!exact) {
    warningc("exact ignored")
  }
  if (missing(j)) {
    tbl_extract2(x, i = NULL, j = i)
  } else {
    tbl_extract2(x, i, j)
  }
}

tbl_extract2 <- function(x, i, j) {
  if (is.null(i)) {
    if (is.matrix(j)) {
      signal_soft_deprecated("Calling `[[` with a matrix (recursive subsetting) is deprecated and will eventually be converted to an error.")
      return(as.matrix(x)[[j]])
    } else if (has_length(j, 2)) {
      signal_soft_deprecated("Calling `[[` with a vector of length 2 (recursive subsetting) is deprecated and will eventually be converted to an error.")
      return(.subset2(x, j))
    }
  }

  vec_assert(j, size = 1)
  j <- vec_as_index_extract2_compat(j, ncol(x), names = names(x))

  if (is.null(i)) {
    .subset2(x, j)
  } else if (is.na(j)) {
    # Lifecycle warning already given
    NULL
  } else {
    i <- vec_as_index(i, vec_size(x))
    vec_assert(i, size = 1)

    x[i, j][[1L]]
  }
}

vec_as_index_extract2_compat <- function(j, n, names, match = TRUE) {
  if (is.character(j)) {
    vec_assert(j, size = 1)
    if (match) {
      j <- match(j, names)
      if (is.na(j)) {
        signal_soft_deprecated("Calling `[[` with an unknown column name is deprecated and will eventually be converted to an error.")
      }
    }
    j
  } else {
    j <- vec_as_index(j, n)
    vec_assert(j, size = 1)
  }
  j
}

#' @rdname subsetting
#' @inheritParams base::`[[<-.data.frame`
#' @export
`[[<-.tbl_df` <- function(x, i, j, value) {
  if (missing(j)) {
    tbl_extract2_assign(x, j = i, value)
  } else {
    tbl_extract2_assign2(x, i, j, value)
  }
}

tbl_extract2_assign2 <- function(x, i, j, value) {
  vec_assert(value, size = 1)

  i <- vec_as_index(i, vec_size(x))
  vec_assert(i, size = 1)

  # Strict matching!
  j <- vec_as_index(j, ncol(x), names = names(x))

  column <- tbl_extract2(x, i = NULL, j)
  vec_slice(column, i) <- value
  tbl_extract2_assign_do(x, j, column)
}

tbl_extract2_assign <- function(x, j, value) {
  vec_assert(j, size = 1)
  j <- vec_as_index_extract2_compat(j, ncol(x), names = names(x), match = FALSE)

  value <- vec_recycle(value, vec_size(x))
  tbl_extract2_assign_do(x, j, value)
}

tbl_extract2_assign_do <- function(x, j, value) {
  old_class <- class(x)
  xx <- unclass(x)
  xx[[j]] <- value
  vec_restore(structure(xx, class = old_class), x)
}

col_recycle <- function(value, x, name) {
  tryCatch(
    vec_recycle(value, vec_size(x)),
    vctrs_error_recycle_incompatible_size = function(e) {
      abort(error_inconsistent_cols(nrow(x), name, vec_size(value), "Existing data"))
    }
  )
}

#' @rdname subsetting
#' @param drop Coerce to a vector if fetching one column via `tbl[, j]` .
#'   Default `FALSE`, ignored when accessing a column via `tbl[j]` .
#' @export
`[.tbl_df` <- function(x, i = NULL, j = NULL, drop = FALSE) {
  # Ignore drop as an argument
  n_real_args <- nargs() - !missing(drop)

  # Column subsetting if nargs() == 2L
  if (n_real_args <= 2L) {
    if (!missing(drop)) {
      warningc("drop ignored")
    }

    if (missing(i)) {
      return(x)
    }

    slice_df(x, i = NULL, j = i, drop = FALSE)
  } else {
    slice_df(x, i, j, drop = drop)
  }
}

slice_df <- function(x, i, j, drop) {
  # First, subset columns
  if (is.null(j)) {
    result <- x
  } else {
    j <- check_names_df(j, x)
    result <- new_data_frame(.subset(x, j), n = fast_nrow(x))
  }

  # Next, subset rows
  if (is.null(i)) {
    if (has_length(result)) {
      i <- NULL
    } else {
      i <- seq_len(fast_nrow(x))
    }
  } else {
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

      i <- vec_as_index(i, nr)
    } else {
      if (is.numeric(i)) {
        i <- fix_oob(i, nr)
        i <- vec_as_index(i, nr)
      } else if (is.logical(i)) {
        if (length(i) != 1L && length(i) != nr) {
          warn_deprecated(paste0(
            "Length of logical index must be 1",
            if (nr != 1) paste0(" or ", nr),
            ", not ", length(i)
          ))
          i <- seq_len(nr)[i]
        } else {
          i <- vec_as_index(i, nr)
        }
      }
    }

    result <- vec_slice(result, i)
  }

  if (drop) {
    if (length(result) == 1L) {
      return(result[[1L]])
    }
  }

  vec_restore_tbl_df_with_i(result, x, i)
}

fast_nrow <- function(x) {
  .row_names_info(x, 2L)
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
    warn_oob(oob)
  }

  i[oob] <- NA_integer_
  i
}

fix_oob_negative <- function(i, n, warn = TRUE) {
  oob <- which(i < -n)
  if (warn) {
    warn_oob(oob)
  }

  i[oob] <- 0L
  i
}

warn_oob <- function(oob) {
  if (has_length(oob)) {
    warn_deprecated("Row indexes must be between 0 and the number of rows. Use `NA` as row index to obtain a row full of `NA` values.")
  }
}

vec_restore_tbl_df_with_i <- function(x, to, i = NULL) {
  if (is.null(i)) {
    n <- nrow(x)
  } else {
    n <- length(i)
  }
  vec_restore(x, to, n = n)
}

#' @rdname subsetting
#' @inheritParams base::`[<-.data.frame`
#' @export
`[<-.tbl_df` <- function(x, i, j, value) {
  if (missing(j)) {
    if (nargs() < 4) {
      j <- i
      i <- NULL
    } else {
      j <- names(x)
    }
  } else {
    if (missing(i)) i <- NULL
  }

  if (is.null(i)) {
    tbl_extract_assign(x, j, value)
  } else {
    tbl_extract_assign2(x, i, j, value)
  }
}

tbl_extract_assign2 <- function(x, i, j, value) {
  i <- vec_as_index(i, vec_size(x))
  value <- col_recycle(value, i, "RHS")

  vec_assert(value, size = vec_size(i))

  j <- vec_as_index_extract_compat(j, ncol(x), names = names(x), match = TRUE)

  if (is.data.frame(value)) {
    new_columns <- map2(.subset(x, j), value, function(column, value) {
      vec_slice(column, i) <- value
      column
    })
    names(new_columns) <- names(value)
  } else {
    new_columns <- map(unname(.subset(x, j)), function(column) {
      vec_slice(column, i) <- value
      column
    })
  }

  tbl_extract_assign_do(x, j, new_tibble(new_columns, nrow = nrow(x)))
}

tbl_extract_assign <- function(x, j, value) {
  value <- vec_recycle(value, vec_size(x))

  j <- vec_as_index_extract_compat(j, ncol(x), names = names(x), match = FALSE)

  if (!is.data.frame(value)) {
    value <- rep_along(j, list(value))
    if (is.character(j)) {
      names(value) <- j
    } else if (any(j > ncol(x))) {
      error_new_column_needs_name()
    }
  }

  tbl_extract_assign_do(x, j, value)
}

vec_as_index_extract_compat <- function(j, n, names, match) {
  # Strict matching, but allowing for extension!
  if (is.numeric(j)) {
    beyond <- which(j > n)

    if (has_length(beyond)) {
      if (any(j < 0)) {
        error_no_negative_indexes_with_new_columns()
      }

      # Check new columns are gapless
      new_cols <- seq2(n + 1L, max(j))
      if (has_length(setdiff(new_cols, j))) {
        error_append_column_needs_all_columns()
      }

      # Use j unchanged
    } else {
      j <- vec_as_index(j, n)
    }
  } else if (is.character(j)) {
    if (match) {
      j <- match(j, names)
      if (any(is.na(j))) {
        error_unknown_column_for_subsetting()
      }
    }
    j
  } else {
    j <- vec_as_index(j, n)
  }

  j
}

tbl_extract_assign_do <- function(x, j, value) {
  old_class <- class(x)
  xx <- unclass(x)

  xx[j] <- unclass(value)
  if (!is.character(j) && !is.null(names(value))) {
    names(xx)[j] <- names(value)
  }

  vec_restore(structure(xx, class = old_class), x)
}

#' Subsetting tibbles
#'
#' @description
#' Accessing columns, rows, or cells via `$`, `[[`, or `[` is mostly similar to
#' [regular data frames][base::Extract]. However, the
#' behavior is different for tibbles and data frames in some cases:
#' * `[` always returns a tibble by default, even if
#'   only one column is accessed.
#' * Partial matching of column names with `$` and `[[` is not supported, and
#'   `NULL` is returned.
#'   For `$`, a warning is given.
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
#' @param x A tibble.
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
#' @examplesIf (Sys.getenv("NOT_CRAN") != "true" || Sys.getenv("IN_PKGDOWN") == "true")
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
#' @examples
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
#' @param name A [name] or a string.
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
    x,
    i = NULL, as_string(name), list(value),
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
      # Drop inner names with double subscript
      vectbl_set_names(vec_slice(x, i), NULL)
    }
  }
}

#' @rdname subsetting
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
  if (is.null(j)) {
    xo <- x
  } else {
    j <- vectbl_as_col_location(j, length(x), names(x), j_arg = j_arg, assign = FALSE)

    if (anyNA(j)) {
      cnd_signal(error_na_column_index(which(is.na(j))))
    }

    xo <- .subset(x, j)

    if (anyDuplicated.default(j)) {
      xo <- set_repaired_names(xo, repair_hint = FALSE, .name_repair = "minimal")
    }
  }

  if (is.null(i)) {
    nrow <- fast_nrow(x)
  } else {
    i <- vectbl_as_row_index(i, x, i_arg)
    xo <- lapply(xo, vec_slice, i = i)
    nrow <- length(i)
  }

  if (drop && length(xo) == 1L) {
    tbl_subset2(xo, 1L, j_arg)
  } else {
    attr(xo, "row.names") <- .set_row_names(nrow)
    vectbl_restore(xo, x)
  }
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

tbl_subassign <- function(x, i, j, value, i_arg, j_arg, value_arg) {
  if (is.null(i)) {
    xo <- unclass(x)

    value <- vectbl_wrap_rhs_col(value, value_arg)

    if (is.null(j)) {
      j <- seq_along(xo)
      names(j) <- names2(j)
    } else if (!is.null(j_arg)) {
      j <- vectbl_as_new_col_index(j, xo, j_arg, names2(value), value_arg)
    }

    value <- vectbl_recycle_rhs_rows(value, fast_nrow(xo), i_arg = NULL, value_arg)
    value <- vectbl_recycle_rhs_cols(value, length(j))

    xo <- tbl_subassign_col(xo, j, value)
  } else if (is.null(i_arg)) {
    # x[NULL, ...] <- value
    return(x)
  } else {
    i <- vectbl_as_new_row_index(i, x, i_arg)

    # Fill up rows first if necessary
    x <- tbl_expand_to_nrow(x, i)
    value <- vectbl_wrap_rhs_row(value, value_arg)

    # Only after tbl_expand_to_nrow() which needs data frame
    xo <- unclass(x)

    if (is.null(j)) {
      xo <- tbl_subassign_row(xo, i, value, i_arg, value_arg)
    } else {
      # Optimization: match only once
      # (Invariant: x[[j]] is equivalent to x[[vec_as_location(j)]],
      # allowed by corollary that only existing columns can be updated)
      if (!is.null(j_arg)) {
        j <- vectbl_as_new_col_index(j, xo, j_arg, names2(value), value_arg)
      }

      # Fill up columns if necessary
      new <- attr(j, "new")
      if (!is.null(new)) {
        init <- map(value[new], vec_slice, rep(NA_integer_, fast_nrow(xo)))
        xo <- tbl_subassign_col(xo, j[new], init)
      }

      xj <- .subset(xo, j)
      xj <- tbl_subassign_row(xj, i, value, i_arg, value_arg)
      xo <- tbl_subassign_col(xo, j, xj)
    }
  }

  vectbl_restore(xo, x)
}

vectbl_as_new_row_index <- function(i, x, i_arg) {
  if (is.null(i)) {
    i
  } else if (is_bare_numeric(i)) {
    if (anyDuplicated.default(i)) {
      cnd_signal(error_duplicate_row_subscript_for_assignment(i))
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
      cnd_signal(error_duplicate_row_subscript_for_assignment(i))
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
      cnd_signal(error_assign_columns_non_na_only())
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
      cnd_signal(error_assign_columns_non_na_only())
    }

    j <- numtbl_as_col_location_assign(j, length(x), j_arg = j_arg)

    old <- (j <= length(x))
    new <- which(!old)
    j_new <- j[new]

    # FIXME: Recycled names are not repaired
    # FIXME: Hard-coded name repair
    if (length(names) != 1L) {
      # Side effect: check compatibility
      vec_recycle(names, length(j), x_arg = as_label(value_arg))
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
      cnd_signal(error_na_column_index(which(is.na(j))))
    }

    if (length(names) != 1L) {
      # Side effect: check compatibility
      vec_recycle(names, length(j), x_arg = as_label(value_arg))
    } else if (length(j) != 1L) {
      # length(names) == 1
      names <- vec_recycle(names, length(j), x_arg = as_label(value_arg))
    }

    old <- (j <= length(x))
    names[old] <- names(x)[j[old]]

    new <- NULL
  }

  if (anyDuplicated.default(j)) {
    cnd_signal(error_duplicate_column_subscript_for_assignment(j))
  }

  names(j) <- names
  attr(j, "new") <- new
  j
}

numtbl_as_row_location_assign <- function(i, n, i_arg) {
  subclass_row_index_errors(
    num_as_location(i, n, missing = "error", oob = "extend", zero = "error"),
    i_arg = i_arg, assign = TRUE
  )
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

numtbl_as_col_location_assign <- function(j, n, j_arg) {
  subclass_col_index_errors(
    num_as_location(j, n, missing = "error", oob = "extend", zero = "error"),
    j_arg = j_arg, assign = TRUE
  )
}

vectbl_as_col_location <- function(j,
                                   n,
                                   names = NULL,
                                   j_arg,
                                   assign = FALSE,
                                   call = caller_env()) {
  subclass_col_index_errors(
    vec_as_location(j, n, names, call = call),
    j_arg = j_arg,
    assign = assign
  )
}

vectbl_as_col_location2 <- function(j, n, names = NULL, j_arg, assign = FALSE) {
  subclass_col_index_errors(vec_as_location2(j, n, names), j_arg = j_arg, assign = assign)
}

vectbl_as_col_subscript2 <- function(j, j_arg, assign = FALSE) {
  subclass_col_index_errors(vec_as_subscript2(j, logical = "error"), j_arg = j_arg, assign = assign)
}

is_tight_sequence_at_end <- function(i_new, n) {
  all(sort(i_new) == seq2(n + 1, n + length(i_new)))
}

tbl_subassign_col <- function(x, j, value) {
  c <- .Call(`tibble_tbl_subassign_col`, x, j, value)
  r <- tbl_subassign_col_r(x, j, value)
  r
}

tbl_subassign_col_r <- function(x, j, value) {
  nrow <- fast_nrow(x)

  # Grow, assign new names
  new <- attr(j, "new")
  if (is.null(new)) {
    n_new <- 0
  } else {
    n_new <- max(j[new]) - length(x)
  }

  # Grow, assign new names
  if (!is.null(new)) {
    length(x) <- length(x) + n_new
    names(x)[j[new]] <- names2(j)[new]
  }

  order_j <- order(j)
  value <- value[order_j]
  j <- j[order_j]

  # Update
  to_remove <- integer()
  for (jj in seq_along(value)) {
    ji <- j[[jj]]
    value_jj <- value[[jj]]
    if (!is.null(value_jj)) {
      x[[ji]] <- value_jj
    } else {
      to_remove <- c(to_remove, ji)
    }
  }

  # Remove
  if (length(to_remove) > 0) {
    x <- x[-to_remove]
  }

  # Can be destroyed by setting length
  attr(x, "row.names") <- .set_row_names(nrow)
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

tbl_subassign_row <- function(x, i, value, i_arg, value_arg) {
  recycled_value <- vectbl_recycle_rhs_cols(value, length(x))

  withCallingHandlers(
    for (j in seq_along(x)) {
      x[[j]] <- vectbl_assign(x[[j]], i, recycled_value[[j]])
    },
    vctrs_error = function(cnd) {
      # Side effect: check if `value` can be recycled
      vectbl_recycle_rhs_rows(value, length(i), i_arg, value_arg)

      cnd_signal(error_assign_incompatible_type(x, recycled_value, j, value_arg, cnd_message(cnd)))
    }
  )

  x
}

fast_nrow <- function(x) {
  .row_names_info(x, 2L)
}

vectbl_assign <- function(x, i, value) {
  if (is.logical(value)) {
    if (.Call("tibble_need_coerce", value)) {
      value <- vec_slice(x, NA_integer_)
    }
  } else {
    if (.Call("tibble_need_coerce", x)) {
      d <- dim(x)
      dn <- dimnames(x)
      x <- vec_slice(value, rep(NA_integer_, length(x)))
      dim(x) <- d
      dimnames(x) <- dn
    }
  }

  vec_assign(x, i, value)
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

vectbl_recycle_rhs_rows <- function(value, nrow, i_arg, value_arg) {
  if (length(value) > 0L) {
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
  }

  value
}

vectbl_recycle_rhs_cols <- function(value, ncol) {
  if (length(value) != 1L || ncol != 1L) {
    # Errors have been caught beforehand in vectbl_as_new_col_index()
    value <- vec_recycle(value, ncol)
  }

  value
}

# External ----------------------------------------------------------------

vectbl_restore <- function(xo, x) {
  .Call(`tibble_restore_impl`, xo, x)
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

error_duplicate_column_subscript_for_assignment <- function(j) {
  j <- unique(j[duplicated(j)])
  tibble_error(pluralise_commas("Column index(es) ", j, " [is](are) used more than once for assignment."), j = j)
}

error_assign_rows_non_na_only <- function() {
  tibble_error("Can't use NA as row index in a tibble for assignment.")
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

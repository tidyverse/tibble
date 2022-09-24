all_subset <- function(x) {
  subset.tbl_df(x)
  subset2.tbl_df(x)
  dollar.tbl_df(x)
}

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
`dollar.tbl_df` <- function(x, name) {
  out <- .subset2(x, name)
  if (is.null(out)) {
    warn(paste0("Unknown or uninitialised column: ", tick(name), "."))
  }
  out
}

#' @rdname subsetting
#' @param i,j Row and column indices. If `j` is omitted, `i` is used as column index.
#' @param ... Ignored.
#' @param exact Ignored, with a warning.
#' @export
`subset2.tbl_df` <- function(x, i, j, ..., exact = TRUE) {
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
      abort_subset_columns_non_missing_only()
    }
    j <- vectbl_as_col_location2_extra(x, j = i, j_arg = substitute(i))
    .subset2(x, j)
  } else if (missing(j) || missing(i)) {
    abort_subset_columns_non_missing_only()
  } else {
    i_arg <- substitute(i)
    i <- vectbl_as_row_location2(i, fast_nrow(x), i_arg)
    j <- vectbl_as_col_location2_extra(x, j = j, j_arg = substitute(j))
    x <- .subset2(x, j)

    if (is.null(x)) {
      x
    } else {
      # Drop inner names with double subscript
      vectbl_set_names(vec_slice(x, i), NULL)
    }
  }
}

#' @rdname subsetting
#' @param drop Coerce to a vector if fetching one column via `tbl[, j]` .
#'   Default `FALSE`, ignored when accessing a column via `tbl[j]` .
#' @export
`subset.tbl_df` <- function(x, i, j, drop = FALSE, ...) {
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
      abort_na_column_index(which(is.na(j)))
    }

    xo <- .subset(x, j)

    if (anyDuplicated.default(j)) {
      xo <- set_repaired_names(xo, repair_hint = FALSE, .name_repair = "minimal")
    }
  }

  if (drop && length(xo) == 1L) {
    out <- .subset2(xo, 1L)
    if (!is.null(i)) {
      out <- vec_slice(out, i)
    }
    return(out)
  }

  attr(xo, "row.names") <- .set_row_names(fast_nrow(x))
  out <- vectbl_restore(xo, x)

  if (!is.null(i)) {
    i <- vectbl_as_row_index(i, x, i_arg)
    out <- vec_slice(out, i)
  }

  out
}

vectbl_as_col_location2_extra <- function(x, j, j_arg) {
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

  j
}

vectbl_as_col_subscript2 <- function(j, j_arg, assign = FALSE, call = my_caller_env()) {
  subclass_col_index_errors(vec_as_subscript2(j, logical = "error", call = call), j_arg = j_arg, assign = assign)
}

vectbl_as_col_location2 <- function(j, n, names = NULL, j_arg, assign = FALSE, call = my_caller_env()) {
  subclass_col_index_errors(vec_as_location2(j, n, names, call = call), j_arg = j_arg, assign = assign)
}

vectbl_as_row_location2 <- function(i, n, i_arg, assign = FALSE, call = my_caller_env()) {
  subclass_row_index_errors(vec_as_location2(i, n, call = call), i_arg = i_arg, assign = assign)
}

vectbl_set_names <- function(x, names = NULL) {
  # Work around https://github.com/r-lib/vctrs/issues/1419
  if (inherits(x, "vctrs_rcrd")) {
    # A rcrd can't have names?
    return(x)
  }
  vec_set_names(x, names)
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

fast_nrow <- function(x) {
  .row_names_info(x, 2L)
}

# External ----------------------------------------------------------------

vectbl_restore <- function(xo, x) {
  .Call(`tibble_restore_impl`, xo, x)
}

# Errors ------------------------------------------------------------------

abort_na_column_index <- function(j) {
  tibble_abort(pluralise_commas("Can't use NA as column index with `[` at position(s) ", j, "."), j = j)
}

abort_subset_columns_non_missing_only <- function() {
  tibble_abort("Subscript can't be missing for tibbles in `[[`.")
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

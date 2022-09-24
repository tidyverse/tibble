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

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
#' @param i,j Row and column indices. If `j` is omitted, `i` is used as column index.
#' @param ... Ignored.
#' @param exact Ignored, with a warning.
#' @export
`[[.tbl_df` <- function(x, i, j, ..., exact = TRUE) {
  if (!exact) {
    warningc("exact ignored")
  }
  if (missing(j)) {
    return(.subset2(x, i))
  }

  NextMethod()
}

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
#' @param drop Coerce to a vector if fetching one column via `tbl[, j]` .
#'   Default `FALSE`, ignored when accessing a column via `tbl[j]` .
#' @export
`[.tbl_df` <- function(x, i, j, drop = FALSE) {
  # Ignore drop as an argument
  n_real_args <- nargs() - !missing(drop)

  # Escape early if nargs() == 2L; ie, column subsetting
  if (n_real_args <= 2L) {
    if (!missing(drop)) warningc("drop ignored")

    if (missing(i)) {
      return(x)
    }

    i <- check_names_df(i, x)
    result <- .subset(x, i)

    nr <- fast_nrow(x)
    return(vec_restore_tbl_df_with_nr(result, x, nr))
  }

  # First, subset columns
  if (missing(j)) {
    result <- x
  } else {
    j <- check_names_df(j, x)
    result <- .subset(x, j)
  }

  # Next, subset rows
  if (missing(i)) {
    nr <- fast_nrow(x)
  } else {
    if (is.logical(i) && !(length(i) %in% c(1L, fast_nrow(x)))) {
      warningc(
        "Length of logical index must be 1",
        if (fast_nrow(x) != 1) paste0(" or ", fast_nrow(x)),
        ", not ", length(i)
      )
    }

    if (length(result) == 0) {
      nr <- length(attr(x, "row.names")[i])
    } else {
      if (is.character(i)) {
        if (has_rownames(x)) {
          i <- match(i, rownames(x))
        } else {
          i <- string_to_indices(i)
        }
      }
      result <- map(result, subset_rows, i)
      nr <- NROW(result[[1]])
    }
  }

  if (drop) {
    if (length(result) == 1L) {
      return(result[[1L]])
    }
  }

  vec_restore_tbl_df_with_nr(result, x, nr)
}

fast_nrow <- function(x) {
  .row_names_info(x, 2L)
}

subset_rows <- function(x, i) {
  if (is.data.frame(x) || is.matrix(x)) {
    x[i, , drop = FALSE]
  } else {
    x[i]
  }
}

# TODO: Consider changing to vec_restore.tbl_df() when vctrs is available,
# but this will impact performance of subsetting!
vec_restore_tbl_df_with_nr <- function(x, to, nr) {
  # Copy attribute, preserving existing names and rownames
  attr_to <- attributes(to)
  new_names <- names(unclass(x))
  new_nr <- .set_row_names(nr)
  attr_to[["names"]] <- new_names
  attr_to[["row.names"]] <- new_nr
  attributes(x) <- attr_to

  x
}

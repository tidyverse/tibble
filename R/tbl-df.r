#' @importFrom methods setOldClass
#' @exportClass tbl_df
setOldClass(c("tbl_df", "tbl", "data.frame"))

#' `tbl_df` class
#'
#' @description
#' Objects of class `tbl_df` have a class attribute consisting of `tbl_df`,
#' `tbl`, and `data.frame`. So-called tibbles are a special flavor of
#' [`data.frame`][base::data.frame()], created in order to have different
#' default behaviour, detailed below.
#'
#' @section tibbles vs. `data.frame`s:
#'
#' How default behaviour of tibbles differs from that of data frames, during
#' creation, access, and modification:
#'
#' * Column data is not coerced. A character vector is not turned into a factor.
#' * Column names are not munged, although missing names are auto-populated.
#' Duplicated column names are strongly discouraged. Read about [name-repair].
#' * Row names are not added and are strongly discouraged, in favor of storing
#' that info as a column. Read about [rownames].
#' * Recycling only happens for a length 1 input.
#' * When a single column is extracted from a tibble, it's returned as a
#' one-column tibble, not as a vector: `df[ , j, drop = FALSE]` is the default.
#' * List-columns are expressly anticipated and do not require special tricks.
#' * There is no partial matching when `$` is used to index by name. `df$name`
#' for a nonexistent name generates a warning.
#' * Printing and inspection are a very high priority. The goal is to convey as
#' much information as possible, in a concise way, even for large and complex
#' tibbles. Read about [formatting].
#'
#' The general ethos is that tibbles are lazy and surly: they do less and
#' complain more than base [`data.frame`s][base::data.frame()]. This forces
#' problems to be tackled earlier and more explicitly, typically leading to code
#' that is more expressive and robust.
#' @name tbl_df-class
#' @aliases tbl_df tbl_df-class
#' @seealso [tibble()], [as_tribble()], [tribble()], [print.tbl_df()],
#'   [glimpse()]
NULL

# Standard data frame methods --------------------------------------------------

#' @export
as.data.frame.tbl_df <- function(x, row.names = NULL, optional = FALSE, ...) {
  class(x) <- "data.frame"
  x
}

#' @rdname formatting
#' @export
print.tbl_df <- function(x, ..., n = NULL, width = NULL, n_extra = NULL) {
  NextMethod()

  if (!inherits(x, "tbl")) {
    message("The tibble must inherit from tbl_df and tbl, use tibble(), as_tibble() or new_tibble() for construction.")
  }

  invisible(x)
}

#' @rdname formatting
#' @export
print.tbl <- function(x, ..., n = NULL, width = NULL, n_extra = NULL) {
  cat_line(format(x, ..., n = n, width = width, n_extra = n_extra))
  invisible(x)
}

#' @rdname formatting
#' @export
format.tbl <- function(x, ..., n = NULL, width = NULL, n_extra = NULL) {
  mat <- trunc_mat(x, n = n, width = width, n_extra = n_extra)
  format(mat)
}

#' @rdname formatting
#' @export
format.tbl_df <- format.tbl

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

#' @export
`$.tbl_df` <- function(x, i) {
  if (is.character(i)) {
    ret <- .subset2(x, i)
    if (is.null(ret)) warningc("Unknown or uninitialised column: '", i, "'.")
    return(ret)
  }
  .subset2(x, i)
}

#' @export
`[.tbl_df` <- function(x, i, j, drop = FALSE) {
  nr <- nrow(x)

  # Ignore drop as an argument
  n_real_args <- nargs() - !missing(drop)

  # Escape early if nargs() == 2L; ie, column subsetting
  if (n_real_args <= 2L) {
    if (!missing(drop)) warningc("drop ignored")

    if (!missing(i)) {
      i <- check_names_df(i, x)
      result <- .subset(x, i)
    } else {
      result <- x
    }
    attr(result, "row.names") <- .set_row_names(nr)
    return(set_tibble_class(result))
  }

  # First, subset columns
  if (!missing(j)) {
    j <- check_names_df(j, x)
    result <- .subset(x, j)
  } else {
    result <- x
  }

  # Next, subset rows
  if (!missing(i)) {
    if (is.logical(i) && !(length(i) %in% c(1, nrow(x)))) {
      warningc(
        "Length of logical index must be 1",
        if (nrow(x) != 1) paste0(" or ", nrow(x)),
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

  attr(result, "row.names") <- .set_row_names(nr)
  set_tibble_class(result)
}

subset_rows <- function(x, i) {
  if (is.data.frame(x) || is.matrix(x)) {
    x[i, , drop = FALSE]
  } else {
    x[i]
  }
}

#' @importFrom methods setOldClass
setOldClass(c("tbl_df", "tbl", "data.frame"))

# Standard data frame methods --------------------------------------------------

#' @export
as.data.frame.tbl_df <- function(x, row.names = NULL, optional = FALSE, ...) {
  class(x) <- "data.frame"
  x
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

#' @rdname formatting
#' @export
print.tbl <- function(x, ..., n = NULL, width = NULL, n_extra = NULL) {
  cat_line(format(x, ..., n = n, width = width, n_extra = n_extra))
  invisible(x)
}

#' @rdname formatting
#' @export
print.tbl_df <- print.tbl

#' @export
`[[.tbl_df` <- function(x, i, j, ..., exact = TRUE) {
  if (missing(j)) {
    colname <- i
  } else {
    colname <- j
  }
  if (!exact) {
    warningc("exact ignored")
  }

  NextMethod()
}

#' @export
`$.tbl_df` <- function(x, i) {
  if (is.character(i) && !has_name(x, i)) {
    warningc("Unknown or uninitialised column: '", i, "'.")
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
    return(as_tibble.data.frame(result, validate = FALSE))
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
      result <- map(result, `[`, i)
      nr <- length(result[[1]])
    }
  }

  attr(result, "row.names") <- .set_row_names(nr)

  if (drop && length(result) == 1L) {
    result[[1L]]
  } else {
    as_tibble.data.frame(result, validate = FALSE)
  }
}

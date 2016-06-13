methods::setOldClass(c("tbl_df", "tbl", "data.frame"))

# Standard data frame methods --------------------------------------------------

#' @export
as.data.frame.tbl_df <- function(x, row.names = NULL, optional = FALSE, ...) {
  class(x) <- "data.frame"
  x
}

#' @rdname formatting
#' @export
print.tbl_df <- function(x, ..., n = NULL, width = NULL) {
  print(trunc_mat(x, n = n, width = width))
  invisible(x)
}

#' @export
`[[.tbl_df` <- function(x, i, j, ..., exact = TRUE) {
  if (missing(j))
    colname <- i
  else
    colname <- j
  if (is.character(colname) && length(colname) == 1L && !(colname %in% names(x))) {
    stop("Unknown column '", colname, "'", call. = FALSE)
  }
  if (!exact) {
    warning("exact ignored", call. = FALSE)
  }

  NextMethod()
}

#' @export
`$.tbl_df` <- function(x, i) {
  if (is.character(i) && !(i %in% names(x))) {
    stop("Unknown column '", i, "'", call. = FALSE)
  }

  .subset2(x, i)
}

#' @export
`[.tbl_df` <- function(x, i, j, drop = FALSE) {
  if (drop) warning("drop ignored", call. = FALSE)

  nr <- nrow(x)

  # Escape early if nargs() == 2L; ie, column subsetting
  if (nargs() <= 2L) {
    if (!missing(i)) {
      i <- check_names_df(i, x)
      result <- .subset(x, i)
    } else {
      result <- x
    }
    attr(result, "row.names") <- .set_row_names(nr)
    return(as_data_frame.data.frame(result))
  }

  # First, subset columns
  if (!missing(j)) {
    j <- check_names_df(j, x)
    x <- .subset(x, j)
  }

  # Next, subset rows
  if (!missing(i)) {
    if (length(x) == 0) {
      nr <- length(attr(x, "row.names")[i])
    } else {
      x <- lapply(x, `[`, i)
      nr <- length(x[[1]])
    }
  }

  attr(x, "row.names") <- .set_row_names(nr)
  as_data_frame.data.frame(x)
}

#' @export
cbind.tbl_df <- function(..., deparse.level = 1) {
  as_data_frame(cbind.data.frame(..., deparse.level = deparse.level))
}

#' @export
rbind.tbl_df <- function(..., deparse.level = 1, make.row.names = FALSE,
                         stringsAsFactors = FALSE) {
  if (make.row.names) {
    warning("row names not supported for tibble", call. = FALSE)
  }
  if (stringsAsFactors) {
    warning("not converting strings to factors for tibble", call. = FALSE)
  }
  as_data_frame(rbind.data.frame(..., deparse.level = deparse.level,
                                 make.row.names = FALSE,
                                 stringsAsFactors = FALSE))
}

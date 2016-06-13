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

check_names_df <- function(j, ...) UseMethod("check_names_df")

check_names_df.default <- function(j, ...) {
  stop("unsupported index type: ", class(j)[[1L]])
}

check_names_df.character <- function(j, x) {
  check_needs_no_dim(j)

  pos <- safe_match(j, names(x))
  if(any(is.na(pos))){
    names <- j[is.na(pos)]
    stop("undefined columns: ", paste(names, collapse = ", "), call. = FALSE)
  }
  pos
}

check_names_df.numeric <- function(j, x) {
  check_needs_no_dim(j)

  if (any(is.na(j))) {
    stop("NA column indexes not supported", call. = FALSE)
  }

  non_integer <- (j != trunc(j))
  if (any(non_integer)) {
    stop("invalid non-integer column indexes: ", paste(j[non_integer], collapse = ", "), call. = FALSE)
  }
  neg_too_small <- (j < -length(x))
  if (any(neg_too_small)) {
    stop("invalid negative column indexes: ", paste(j[neg_too_small], collapse = ", "), call. = FALSE)
  }
  pos_too_large <- (j > length(x))
  if (any(pos_too_large)) {
    stop("invalid column indexes: ", paste(j[pos_too_large], collapse = ", "), call. = FALSE)
  }

  seq_along(x)[j]
}

check_names_df.logical <- function(j, x) {
  check_needs_no_dim(j)

  if (!(length(j) %in% c(1L, length(x)))) {
    stop("length of logical index vector must be 1 or ", length(x), ", got: ", length(j), call. = FALSE)
  }
  if (any(is.na(j))) {
    stop("NA column indexes not supported", call. = FALSE)
  }
  seq_along(x)[j]
}

check_needs_no_dim <- function(j) {
  if (needs_dim(j)) {
    stop("unsupported use of matrix or array for column indexing", call. = FALSE)
  }
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

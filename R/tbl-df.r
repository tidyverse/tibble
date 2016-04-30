methods::setOldClass(c("tbl_df", "tbl", "data.frame"))

# Standard data frame methods --------------------------------------------------

#' @export
as.data.frame.tbl_df <- function(x, row.names = NULL, optional = FALSE, ...) {
  structure(x, class = "data.frame")
}

#' @rdname formatting
#' @export
print.tbl_df <- function(x, ..., n = NULL, width = NULL) {
  cat("Source: local data frame ", dim_desc(x), "\n", sep = "")
  cat("\n")
  print(trunc_mat(x, n = n, width = width))

  invisible(x)
}

.check_names_df <- function(x, j){
  if( is.character(j) && any( wrong <- ! j %in% names(x) ) ){
    names <- j[wrong]
    stop( sprintf( "undefined columns: %s", paste(names, collapse = ", " ) ) ) ;
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
      .check_names_df(x, i)
      result <- .subset(x, i)
    } else {
      result <- x
    }
    attr(result, "row.names") <- .set_row_names(nr)
    return(cast_to_data_frame(result))
  }

  # First, subset columns
  if (!missing(j)) {
    .check_names_df(x,j)
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
  cast_to_data_frame(x)
}

#' Coerce lists and matrices to data frames
#'
#' [as.data.frame()] is effectively a thin wrapper around `data.frame`,
#' and hence is rather slow (because it calls [data.frame()] on each element
#' before [cbind]ing together). `as_tibble` is a new S3 generic
#' with more efficient methods for matrices and data frames.
#'
#' This is an S3 generic. tibble includes methods for data frames (adds tbl_df
#' classes), tibbles (returns unchanged input), lists, matrices, and tables.
#' Other types are first coerced via `as.data.frame()` with
#' `stringsAsFactors = FALSE`.
#'
#' `as_data_frame` and `as.tibble` are aliases.
#'
#' @param x A list. Each element of the list must have the same length.
#' @param ... Other arguments passed on to individual methods.
#' @param validate When `TRUE`, verifies that the input is a valid data
#'   frame (i.e. all columns are named, and are 1d vectors or lists). You may
#'   want to suppress this when you know that you already have a valid data
#'   frame and you want to save some time, or to explicitly enable it
#'   if you have a tibble that you want to re-check.
#' @param rownames If `NULL`, remove row names (default for matrices, may become
#'   default for data frames in the future). If `NA`, keep row names (current
#'   default for data frames). Otherwise, the name of the new column that will
#'   contain the existing row names.
#' @export
#' @examples
#' l <- list(x = 1:500, y = runif(500), z = 500:1)
#' df <- as_tibble(l)
#'
#' m <- matrix(rnorm(50), ncol = 5)
#' colnames(m) <- c("a", "b", "c", "d", "e")
#' df <- as_tibble(m)
#'
#' # as_tibble is considerably simpler than as.data.frame
#' # making it more suitable for use when you have things that are
#' # lists
#' \dontrun{
#' if (requireNamespace("microbenchmark", quiet = TRUE)) {
#'   l2 <- replicate(26, sample(letters), simplify = FALSE)
#'   names(l2) <- letters
#'   microbenchmark::microbenchmark(
#'     as_tibble(l2, validate = FALSE),
#'     as_tibble(l2),
#'     as.data.frame(l2)
#'   )
#' }
#'
#' if (requireNamespace("microbenchmark", quiet = TRUE)) {
#'   m <- matrix(runif(26 * 100), ncol = 26)
#'   colnames(m) <- letters
#'   microbenchmark::microbenchmark(
#'     as_tibble(m),
#'     as.data.frame(m)
#'   )
#' }
#' }
as_tibble <- function(x, ...) {
  UseMethod("as_tibble")
}

#' @export
#' @rdname as_tibble
as_tibble.tbl_df <- function(x, ..., validate = FALSE, rownames = NULL) {
  if (validate) return(NextMethod())
  x
}

#' @export
#' @rdname as_tibble
as_tibble.data.frame <- function(x, validate = TRUE, ..., rownames = NA) {
  old_rownames <- raw_rownames(x)
  result <- list_to_tibble(x, validate)
  if (is.null(rownames)) {
    result
  } else if (is.na(rownames)) {
    attr(result, "row.names") <- old_rownames
    result
  } else {
    add_column(result, !! rownames := old_rownames, .before = 1L)
  }
}

#' @export
#' @rdname as_tibble
as_tibble.list <- function(x, validate = TRUE, ...) {
  if (length(x) == 0) {
    list_to_tibble(repair_names(list()), validate = FALSE)
  } else {
    list_to_tibble(x, validate)
  }
}

list_to_tibble <- function(x, validate) {
  # this is to avoid any method dispatch that may happen when processing x
  x <- unclass(x)

  if (validate) {
    x <- check_tibble(x)
  } else if (has_null_names(x)) {
    names(x) <- rep_along(x, "")
  }
  x <- recycle_columns(x)

  new_tibble(x)
}

#' @export
#' @rdname as_tibble
as_tibble.matrix <- function(x, ..., rownames = NULL) {
  as_tibble(repair_names(matrixToDataFrame(x)), ..., rownames = rownames)
}

#' @export
as_tibble.poly <- function(x, ...) {
  as_tibble(unclass(x))
}

#' @export
as_tibble.ts <- function(x, ...) {
  as_tibble(as.data.frame(x, ...))
}

#' @export
#' @param n Name for count column, default: `"n"`.
#' @rdname as_tibble
as_tibble.table <- function(x, n = "n", ...) {
  as_tibble(as.data.frame(x, responseName = n, stringsAsFactors = FALSE))
}

#' @export
#' @rdname as_tibble
as_tibble.NULL <- function(x, ...) {
  as_tibble(list())
}

#' @export
#' @rdname as_tibble
as_tibble.default <- function(x, ...) {
  value <- x
  as_tibble(as.data.frame(value, stringsAsFactors = FALSE, ...))
}

#' @export
#' @rdname as_tibble
#' @usage NULL
as.tibble <- function(x, ...) {
  UseMethod("as_tibble")
}

#' @export
#' @rdname as_tibble
#' @usage NULL
as_data_frame <- function(x, ...) {
  UseMethod("as_data_frame")
}

#' @export
as_data_frame.tbl_df <- as_tibble.tbl_df

#' @export
as_data_frame.data.frame <- as_tibble.data.frame

#' @export
as_data_frame.list <- as_tibble.list

#' @export
as_data_frame.matrix <- as_tibble.matrix

#' @export
as_data_frame.table <- as_tibble.table

#' @export
as_data_frame.NULL <- as_tibble.NULL

#' @export
as_data_frame.default <- as_tibble.default

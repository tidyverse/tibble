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
#' if (requireNamespace("microbenchmark", quietly = TRUE)) {
#'   l2 <- replicate(26, sample(letters), simplify = FALSE)
#'   names(l2) <- letters
#'   microbenchmark::microbenchmark(
#'     as_tibble(l2, validate = FALSE),
#'     as_tibble(l2),
#'     as.data.frame(l2)
#'   )
#' }
#'
#' if (requireNamespace("microbenchmark", quietly = TRUE)) {
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
    if (is.na(old_rownames[1])) {
      abort(error_as_tibble_needs_rownames())
    }
    add_column(result, !!rownames := old_rownames, .before = 1L)
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

check_tibble <- function(x) {
  # Names
  names_x <- names2(x)
  bad_name <- which(is.na(names_x) | names_x == "")
  if (has_length(bad_name)) {
    abort(error_column_must_be_named(bad_name))
  }

  dups <- which(duplicated(names_x))
  if (has_length(dups)) {
    abort(error_column_must_have_unique_name(names_x[dups]))
  }

  # Types
  is_xd <- which(!map_lgl(x, is_1d))
  if (has_length(is_xd)) {
    classes <- map_chr(x[is_xd], function(x) class(x)[[1]])
    abort(error_column_must_be_vector(names_x[is_xd], classes))
  }

  x[] <- map(x, strip_dim)

  posixlt <- which(map_lgl(x, inherits, "POSIXlt"))
  if (has_length(posixlt)) {
    abort(error_time_column_must_be_posixct(names_x[posixlt]))
  }

  x
}

recycle_columns <- function(x) {
  # Validate column lengths, allow recycling
  lengths <- map_int(x, NROW)

  # Shortcut if all columns have the same length (including zero length!)
  if (all(lengths == lengths[1L])) return(x)

  max <- max(lengths[lengths != 1L], 0L)

  short <- which(lengths == 1)
  if (has_length(short)) {
    x[short] <- expand_vecs(x[short], max)
  }

  x
}

guess_nrow <- function(x) {
  if (!is.null(.row_names_info(x, 0L))) {
    list(nrow = .row_names_info(x, 2L), method = "row.names attribute")
  } else if (length(x) == 0) {
    list(nrow = 0L, method = "detected empty list")
  } else {
    col_lens <- map_int(x, NROW)
    longest_cols <- names(col_lens)[col_lens == max(col_lens)]
    list(nrow = max(map_int(x, NROW)),
         method = paste("the longest", pluralise("column(s)", longest_cols),
                        paste(tick(longest_cols), collapse = ",")))
  }
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

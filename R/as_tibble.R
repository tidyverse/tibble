#' Coerce vectors, lists, and matrices to data frames
#'
#' This is an S3 generic. Methods are included for:
#' - data frames (adds `"tbl_df"` classes)
#' - tibbles (returns unchanged input)
#' - lists and vectors (treats each element as a column)
#' - matrices
#' - tables
#' - default (coerces to a list)
#'
#' Vectors and unknown input is coerced to a list (unlike `as.data.frame()`):
#' for vectors, the returned tibble has as many columns as the vector has
#' elements.
#'
#' [as.data.frame()] is effectively a thin wrapper around `data.frame`,
#' and hence is rather slow (because it calls [data.frame()] on each element
#' before [cbind]ing together). `as_tibble` is a new S3 generic
#' with more efficient methods for matrices and data frames.
#'
#' The default behavior is to silently remove row names.
#' New code should explicitly convert row names to a new column using the `rownames`
#' argument.
#' For existing code that relies on row names remaining, call
#' `pkgconfig::set_config("tibble::rownames" = NA)` in your script or in your package's
#' [.onLoad()]  function.
#'
#' @seealso
#' [enframe()] converts a vector to a data frame with values in rows,
#' [name-repair] documents the details of name repair.
#'
#' [pkgconfig::set_config()]
#'
#' @param x A vector, list, or matrix. If a list, each element must have the same length.
#' @param ... Other arguments passed on to individual methods.
#' @inheritParams tibble
#' @param rownames Treatment of existing row names (for data frames and matrices):
#'   - `NULL`: remove row names
#'   - `NA`: keep row names (default, for compatibility; will issue a warning if row names
#'     are present in the input).
#'   - A string: the name of the new column that will contain the existing row names,
#'     which are no longer present in the result.
#' @param _n,validate For compatibility only, do not use for new code.
#' @export
#' @examples
#' l <- list(x = 1:500, y = runif(500), z = 500:1)
#' df <- as_tibble(l)
#'
#' m <- matrix(rnorm(50), ncol = 5)
#' colnames(m) <- c("a", "b", "c", "d", "e")
#' df <- as_tibble(m)
#'
#' as_tibble(1:3, .name_repair = "unique")
#'
#' # For list-like inputs, as_tibble() is considerably simpler than as.data.frame()
#' \dontrun{
#' if (requireNamespace("bench", quietly = TRUE)) {
#'   l2 <- replicate(26, sample(letters), simplify = FALSE)
#'   names(l2) <- letters
#'   bench::mark(
#'     as_tibble(l2, .name_repair = "syntactic"),
#'     as_tibble(l2, .name_repair = "unique"),
#'     as_tibble(l2, .name_repair = "none"),
#'     as_tibble(l2),
#'     as.data.frame(l2),
#'     check = FALSE
#'   )
#' }
#' }
as_tibble <- function(x, ...,
                      .rows = NULL,
                      .name_repair = c("check_unique", "unique", "syntactic", "none", "minimal"),
                      rownames = pkgconfig::get_config("tibble::rownames", NULL)) {
  UseMethod("as_tibble")
}

#' @export
#' @rdname as_tibble
as_tibble.data.frame <- function(x, validate = TRUE, ...,
                                 .rows = NULL,
                                 .name_repair = c("check_unique", "unique", "syntactic", "none", "minimal"),
                                 rownames = pkgconfig::get_config("tibble::rownames", NULL)) {
  if (!missing(validate)) {
    message("The `validate` argument to `as_tibble()` is deprecated. Please use `.name_repair` to control column names.")
    .name_repair <- if (isTRUE(validate)) "check_unique" else "none"
  }

  old_rownames <- raw_rownames(x)
  if (is.null(.rows)) {
    .rows <- nrow(x)
  }
  result <- as_tibble(unclass(x), ..., .rows = .rows, .name_repair = .name_repair)

  if (is.null(rownames)) {
    result
  } else if (is.na(rownames)) {
    attr(result, "row.names") <- old_rownames
    result
  } else {
    if (is.na(old_rownames[[1]])) {
      abort(error_as_tibble_needs_rownames())
    }
    add_column(result, !!rownames := old_rownames, .before = 1L)
  }
}

#' @export
#' @rdname as_tibble
as_tibble.list <- function(x, validate = TRUE, ..., .rows = NULL,
                           .name_repair = c("check_unique", "unique", "syntactic", "none", "minimal")) {
  if (!missing(validate)) {
    message("The `validate` argument to `as_tibble()` is deprecated. Please use `.name_repair` to control column names.")
    .name_repair <- if (isTRUE(validate)) "check_unique" else "none"
  }

  x <- set_repaired_names(x, .name_repair)
  x <- check_valid_cols(x)
  recycle_columns(x, .rows)
}

check_valid_cols <- function(x) {
  names_x <- names2(x)
  is_xd <- which(!map_lgl(x, is_1d_or_2d))
  if (has_length(is_xd)) {
    classes <- map_chr(x[is_xd], function(x) class(x)[[1]])
    abort(error_column_must_be_vector(names_x[is_xd], classes))
  }

  posixlt <- which(map_lgl(x, inherits, "POSIXlt"))
  if (has_length(posixlt)) {
    abort(error_time_column_must_be_posixct(names_x[posixlt]))
  }

  x
}

is_1d_or_2d <- function(x) {
  # dimension check is for matrices and data.frames
  (is_vector(x) && !needs_dim(x)) || is.data.frame(x) || is.matrix(x)
}

recycle_columns <- function(x, .rows) {
  lengths <- col_lengths(x)
  nrow <- guess_nrow(lengths, .rows)

  # Shortcut if all columns have the requested or implied length
  different_len <- which(lengths != nrow)
  if (is_empty(different_len)) return(new_valid_tibble(x, nrow))

  if (any(lengths[different_len] != 1)) {
    abort(error_inconsistent_cols(.rows, names(x), lengths))
  }

  short <- which(lengths == 1)
  if (has_length(short)) {
    x[short] <- expand_vecs(x[short], nrow)
  }

  new_valid_tibble(x, nrow)
}

guess_nrow <- function(lengths, .rows) {
  if (!is.null(.rows)) {
    return(.rows)
  }
  if (is_empty(lengths)) {
    return(0)
  }

  nontrivial_lengths <- lengths[lengths != 1L]
  if (is_empty(nontrivial_lengths)) {
    return(1)
  }

  max(nontrivial_lengths)
}

#' @export
#' @rdname as_tibble
as_tibble.matrix <- function(x, ...) {
  as_tibble(matrixToDataFrame(x), ...)
}

#' @export
as_tibble.poly <- function(x, ...) {
  as_tibble(unclass(x), ...)
}

#' @export
as_tibble.ts <- function(x, ...) {
  as_tibble(as.data.frame(x), ...)
}

#' @export
#' @param n Name for count column, default: `"n"`.
#' @rdname as_tibble
as_tibble.table <- function(x, `_n` = "n", ..., n = `_n`) {
  if (!missing(`_n`)) {
    warn("Please pass `n` as a named argument to `as_tibble.table()`.")
  }
  as_tibble(as.data.frame(x, responseName = n, stringsAsFactors = FALSE), ...)
}

#' @export
#' @rdname as_tibble
as_tibble.NULL <- function(x, ...) {
  as_tibble(list(), ...)
}

#' @export
#' @rdname as_tibble
as_tibble.default <- function(x, ...) {
  if (is_atomic(x)) {
    as_tibble(as.list(x), ...)
  } else {
    as_tibble(as.data.frame(x), ...)
  }
}

#' Deprecated coercion functions
#'
#' Use [as_tibble()] instead, but mind the new signature and semantics.
#'
#' @export
#' @keywords internal
as_data_frame <- function(x, ...) {
  as_tibble(x, ...)
}

#' @export
#' @rdname as_data_frame
as.tibble <- function(x, ...) {
  as_tibble(x, ...)
}

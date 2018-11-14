#' Coerce lists, matrices, and more to data frames
#'
#' `as_tibble()` turns an existing object, such as a data frame, list, or
#' matrix, into a so-called tibble, a data frame with class [`tbl_df`]. This is
#' in contrast with [tibble()], which builds a tibble from individual columns.
#' `as_tibble()` is to [`tibble()`] as [base::as.data.frame()] is to
#' [base::data.frame()].
#'
#' `as_tibble()` is an S3 generic, with methods for:
#' * [`data.frame`][base::data.frame()]: Thin wrapper around the `list` method
#'   that implements tibble's treatment of [rownames].
#' * list
#' * [`matrix`][methods::matrix-class], [`poly`][stats::poly()],
#'   [`ts`][stats::ts()], [`table`][base::table()]
#' * Default: An atomic vector is first coerced to a list and, unlike
#'   [base::as.data.frame()], the returned tibble has one column per element.
#'   Other inputs are first coerced with [base::as.data.frame()].
#'
#' @section Row names:
#' The default behavior is to silently remove row names.
#'
#' New code should explicitly convert row names to a new column using the
#' `rownames` argument.
#'
#' For existing code that relies on the retention of row names, call
#' `pkgconfig::set_config("tibble::rownames" = NA)` in your script or in your
#' package's [.onLoad()]  function.
#'
#' @seealso [tibble()] constructs a tibble from individual columns. [enframe()]
#'   converts a named vector to a tibble with a column of names and column of
#'   values. [name-repair] documents the details of name repair.
#'
#' @param x A data frame, list, matrix, or other object that could reasonably be
#'   coerced to a tibble.
#' @param ... Other arguments passed on to individual methods.
#' @inheritParams tibble
#' @param rownames How to treat existing row names of a data frame or matrix:
#'   * `NULL`: remove row names. This is the default.
#'   * `NA`: keep row names.
#'   * A string: the name of a new column. Existing rownames are transferred
#'     into this column and the `row.names` attribute is deleted.
#'  Read more in [rownames].

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
#' # For list-like inputs, `as_tibble()` is considerably simpler than
#' # `as.data.frame()` and hence faster
#' \dontrun{
#' if (requireNamespace("bench", quietly = TRUE)) {
#'   l2 <- replicate(26, sample(letters), simplify = FALSE)
#'   names(l2) <- letters
#'   bench::mark(
#'     as_tibble(l2, .name_repair = "universal"),
#'     as_tibble(l2, .name_repair = "unique"),
#'     as_tibble(l2, .name_repair = "minimal"),
#'     as_tibble(l2),
#'     as.data.frame(l2),
#'     check = FALSE
#'   )
#' }
#' }
as_tibble <- function(x, ...,
                      .rows = NULL,
                      .name_repair = c("check_unique", "unique", "universal", "minimal"),
                      rownames = pkgconfig::get_config("tibble::rownames", NULL)) {
  UseMethod("as_tibble")
}

#' @export
#' @rdname as_tibble
as_tibble.data.frame <- function(x, validate = TRUE, ...,
                                 .rows = NULL,
                                 .name_repair = c("check_unique", "unique", "universal", "minimal"),
                                 rownames = pkgconfig::get_config("tibble::rownames", NULL)) {
  if (!missing(validate)) {
    message("The `validate` argument to `as_tibble()` is deprecated. Please use `.name_repair` to control column names.")
    .name_repair <- if (isTRUE(validate)) "check_unique" else "minimal"
  }

  old_rownames <- raw_rownames(x)
  if (is.null(.rows)) {
    .rows <- nrow(x)
  }
  result <- as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair)

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
                           .name_repair = c("check_unique", "unique", "universal", "minimal")) {
  if (!missing(validate)) {
    message("The `validate` argument to `as_tibble()` is deprecated. Please use `.name_repair` to control column names.")
    .name_repair <- if (isTRUE(validate)) "check_unique" else "minimal"
  }

  x <- set_repaired_names(x, .name_repair)
  check_valid_cols(x)
  x[] <- map(x, strip_dim)
  recycle_columns(x, .rows)
}

# TODO: Still necessary with vctrs (because vctrs_size() already checks this)?
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

  invisible(x)
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
  if (is_empty(different_len)) return(new_tibble(x, nrow = nrow, subclass = NULL))

  if (any(lengths[different_len] != 1)) {
    abort(error_inconsistent_cols(.rows, names(x), lengths, "`.rows` argument"))
  }

  short <- which(lengths == 1)
  if (has_length(short)) {
    x[short] <- expand_vecs(x[short], nrow)
  }

  new_tibble(x, nrow = nrow, subclass = NULL)
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
  m <- matrixToDataFrame(x)
  colnames(m) <- colnames(x)
  as_tibble(m, ...)
}

#' @export
as_tibble.poly <- function(x, ...) {
  m <- matrixToDataFrame(unclass(x))
  colnames(m) <- colnames(x)
  as_tibble(m, ...)
}

#' @export
as_tibble.ts <- function(x, ...) {
  df <- as.data.frame(x)
  colnames(df) <- colnames(x)
  as_tibble(df, ...)
}

#' @export
#' @param n Name for count column, default: `"n"`.
#' @rdname as_tibble
as_tibble.table <- function(x, `_n` = "n", ..., n = `_n`) {
  if (!missing(`_n`)) {
    warn("Please pass `n` as a named argument to `as_tibble.table()`.")
  }

  df <- as.data.frame(x, stringsAsFactors = FALSE)
  names(df) <- c(names2(dimnames(x)), n)

  as_tibble(df, ...)
}

#' @export
#' @rdname as_tibble
as_tibble.NULL <- function(x, ...) {
  as_tibble(list(), ...)
}

#' @export
#' @rdname as_tibble
as_tibble.default <- function(x, ...) {
  value <- x
  if (is_atomic(value)) {
    warn_once("Calling `as_tibble()` on a vector is discouraged, because the behavior is likely to change in the future. Use `enframe(name = NULL)` instead.")
  }
  as_tibble(as.data.frame(value, stringsAsFactors = FALSE), ...)
}

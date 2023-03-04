#' Coerce lists, matrices, and more to data frames
#'
#' @description
#' `as_tibble()` turns an existing object, such as a data frame or
#' matrix, into a so-called tibble, a data frame with class [`tbl_df`]. This is
#' in contrast with [tibble()], which builds a tibble from individual columns.
#' `as_tibble()` is to [`tibble()`] as [base::as.data.frame()] is to
#' [base::data.frame()].
#'
#' `as_tibble()` is an S3 generic, with methods for:
#' * [`data.frame`][base::data.frame()]: Thin wrapper around the `list` method
#'   that implements tibble's treatment of [rownames].
#' * [`matrix`][base::matrix()], [`poly`][stats::poly()],
#'   [`ts`][stats::ts()], [`table`][base::table()]
#' * Default: Other inputs are first coerced with [base::as.data.frame()].
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
#' @section Life cycle:
#' Using `as_tibble()` for vectors is superseded as of version 3.0.0,
#' prefer the more expressive `as_tibble_row()` and
#' `as_tibble_col()` variants for new code.
#'
#' @seealso [tibble()] constructs a tibble from individual columns. [enframe()]
#'   converts a named vector to a tibble with a column of names and column of
#'   values. Name repair is implemented using [vctrs::vec_as_names()].
#'
#' @param x A data frame, list, matrix, or other object that could reasonably be
#'   coerced to a tibble.
#' @param ... Unused, for extensibility.
#' @inheritParams tibble
#' @param rownames How to treat existing row names of a data frame or matrix:
#'   * `NULL`: remove row names. This is the default.
#'   * `NA`: keep row names.
#'   * A string: the name of a new column. Existing rownames are transferred
#'     into this column and the `row.names` attribute is deleted.
#'     No name repair is applied to the new column name, even if `x` already contains
#'     a column of that name.
#'     Use `as_tibble(rownames_to_column(...))` to safeguard against this case.
#'
#'  Read more in [rownames].

#' @param _n,validate
#'   `r lifecycle::badge("soft-deprecated")`
#'
#'   For compatibility only, do not use for new code.
#' @export
#' @examples
#' m <- matrix(rnorm(50), ncol = 5)
#' colnames(m) <- c("a", "b", "c", "d", "e")
#' df <- as_tibble(m)
as_tibble <- function(x, ...,
                      .rows = NULL,
                      .name_repair = c("check_unique", "unique", "universal", "minimal"),
                      rownames = pkgconfig::get_config("tibble::rownames", NULL)) {
  UseMethod("as_tibble")
}

#' @export
#' @rdname as_tibble
as_tibble.data.frame <- function(x, validate = NULL, ...,
                                 .rows = NULL,
                                 .name_repair = c("check_unique", "unique", "universal", "minimal"),
                                 rownames = pkgconfig::get_config("tibble::rownames", NULL)) {
  if (!is.null(validate)) {
    deprecate_stop("2.0.0", "tibble::as_tibble(validate = )", "as_tibble(.name_repair =)")
  }

  old_rownames <- raw_rownames(x)
  if (is.null(.rows)) {
    .rows <- nrow(x)
  }

  result <- lst_to_tibble(unclass(x), .rows, .name_repair)

  if (is.null(rownames)) {
    result
  } else if (is.na(rownames)) {
    attr(result, "row.names") <- old_rownames
    result
  } else {
    if (length(old_rownames) > 0 && is.na(old_rownames[1L])) {
      # if implicit rownames
      old_rownames <- seq_len(abs(old_rownames[2L]))
    }
    old_rownames <- as.character(old_rownames)
    add_column(result, !!rownames := old_rownames, .before = 1L, .name_repair = "minimal")
  }
}

#' @export
#' @rdname as_tibble
as_tibble.list <- function(x, validate = NULL, ..., .rows = NULL,
                           .name_repair = c("check_unique", "unique", "universal", "minimal")) {
  if (!is.null(validate)) {
    deprecate_stop("2.0.0", "tibble::as_tibble(validate = )", "as_tibble(.name_repair =)")
  }

  lst_to_tibble(x, .rows, .name_repair, col_lengths(x))
}

lst_to_tibble <- function(x, .rows, .name_repair, lengths = NULL, call = caller_env()) {
  x <- unclass(x)
  x <- set_repaired_names(x, repair_hint = TRUE, .name_repair, call = call)
  x <- check_valid_cols(x, call = call)
  recycle_columns(x, .rows, lengths)
}

check_valid_cols <- function(x, pos = NULL, call = caller_env()) {
  names_x <- names2(x)

  is_xd <- which(!map_lgl(x, is_valid_col))
  if (has_length(is_xd)) {
    classes <- map_chr(x[is_xd], friendly_type_of)
    abort_column_scalar_type(names_x[is_xd], pos[is_xd], classes, call)
  }

  # 657
  x[] <- map(x, make_valid_col)
  invisible(x)
}

make_valid_col <- function(x) {
  if (is.expression(x)) {
    x <- as.list(x)
  }
  x
}

is_valid_col <- function(x) {
  # 657
  vec_is(x) || is.expression(x)
}

recycle_columns <- function(x, .rows, lengths) {
  nrow <- guess_nrow(lengths, .rows)

  # Shortcut if all columns have the requested or implied length
  different_len <- which(lengths != nrow)
  if (is_empty(different_len)) return(new_tibble(x, nrow = nrow, subclass = NULL))

  if (any(lengths[different_len] != 1)) {
    abort_incompatible_size(.rows, names(x), lengths, "Requested with `.rows` argument")
  }

  if (nrow != 1L) {
    short <- which(lengths == 1L)
    if (has_length(short)) {
      x[short] <- map(x[short], vec_recycle, nrow)
    }
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
as_tibble.matrix <- function(x, ..., validate = NULL, .name_repair = NULL) {
  m <- matrixToDataFrame(x)
  names <- colnames(x)
  if (is.null(.name_repair)) {
    if ((is.null(names) || any(bad_names <- duplicated(names) | names == "")) && has_length(x)) {
      deprecate_stop("2.0.0", "as_tibble.matrix(x = 'must have unique column names if `.name_repair` is omitted')",
        details = "Using compatibility `.name_repair`."
      )
      compat_names <- paste0("V", seq_along(m))
      if (is.null(names)) {
        names <- compat_names
      } else {
        names[bad_names] <- compat_names[bad_names]
      }
      .name_repair <- function(x) names
    } else {
      .name_repair <- "check_unique"
    }
    validate <- NULL
  }

  colnames(m) <- names
  as_tibble(m, ..., validate = validate, .name_repair = .name_repair)
}

#' @export
as_tibble.poly <- function(x, ...) {
  m <- matrixToDataFrame(unclass(x))
  colnames(m) <- colnames(x)
  as_tibble(m, ...)
}

#' @export
as_tibble.ts <- function(x, ..., .name_repair = "minimal") {
  df <- as.data.frame(x)
  if (length(dim(x)) == 2) {
    colnames(df) <- colnames(x)
  }
  as_tibble(df, ..., .name_repair = .name_repair)
}

#' @export
#' @param n Name for count column, default: `"n"`.
#' @rdname as_tibble
as_tibble.table <- function(x, `_n` = "n", ..., n = `_n`, .name_repair = "check_unique") {
  if (!missing(`_n`)) {
    warn("Please pass `n` as a named argument to `as_tibble.table()`.")
  }

  df <- as.data.frame(x, stringsAsFactors = FALSE)

  names(df) <- repaired_names(
    c(names2(dimnames(x)), n),
    repair_hint = TRUE, .name_repair = .name_repair
  )

  # Names already repaired:
  as_tibble(df, ..., .name_repair = "minimal")
}

#' @export
#' @rdname as_tibble
#' @usage \method{as_tibble}{NULL}(x, ...)
as_tibble.NULL <- function(x, ...) {
  if (missing(x)) {
    deprecate_stop("3.0.0", "as_tibble(x = 'can\\'t be missing')")
  }

  new_tibble(list(), nrow = 0)
}

#' @export
#' @rdname as_tibble
as_tibble.default <- function(x, ...) {
  value <- x
  if (is_atomic(value)) {
    signal_superseded(
      "3.0.0", "as_tibble(x = 'can\\'t be an atomic vector')",
      "as_tibble_col()"
    )
  }
  as_tibble(as.data.frame(value, stringsAsFactors = FALSE), ...)
}

#' @description
#' `as_tibble_row()` converts a vector to a tibble with one row.
#' If the input is a list, all elements must have size one.
#'
#' @rdname as_tibble
#' @export
#' @examples
#'
#' as_tibble_row(c(a = 1, b = 2))
#' as_tibble_row(list(c = "three", d = list(4:5)))
#' as_tibble_row(1:3, .name_repair = "unique")
as_tibble_row <- function(x,
                          .name_repair = c("check_unique", "unique", "universal", "minimal")) {
  if (!vec_is(x)) {
    abort_as_tibble_row_vector(x)
  }

  names <- vectbl_names2(x, .name_repair = .name_repair)

  # FIXME: Use vec_chop2() when https://github.com/r-lib/vctrs/pull/1226 is in
  if (is_bare_list(x)) {
    slices <- x
  } else {
    x <- vectbl_set_names(x, NULL)
    slices <- lapply(seq_len(vec_size(x)), vec_slice, x = x)
    names(slices) <- names
  }

  check_all_lengths_one(slices)

  new_tibble(slices, nrow = 1)
}

check_all_lengths_one <- function(x, call = caller_env()) {
  sizes <- col_lengths(x)

  bad_lengths <- which(sizes != 1)
  if (!is_empty(bad_lengths)) {
    abort_as_tibble_row_size_one(
      seq_along(x)[bad_lengths],
      names2(x)[bad_lengths],
      sizes[bad_lengths],
      call
    )
  }
}


#' @description
#' `as_tibble_col()` converts a vector to a tibble with one column.
#'
#' @param column_name Name of the column.
#'
#' @rdname as_tibble
#' @export
#' @examples
#'
#' as_tibble_col(1:3)
#' as_tibble_col(
#'   list(c = "three", d = list(4:5)),
#'   column_name = "data"
#' )
as_tibble_col <- function(x, column_name = "value") {
  # Side effect: checking that x is a vector
  tibble(!!column_name := x)
}

# External ----------------------------------------------------------------

matrixToDataFrame <- function(x) {
  .Call(`tibble_matrixToDataFrame`, x)
}

# Errors ------------------------------------------------------------------

abort_column_scalar_type <- function(names, positions, classes, call = caller_env()) {
  tibble_abort(
    call = call,
    problems(
      "All columns in a tibble must be vectors:",
      x = paste0("Column ", name_or_pos(names, positions), " is ", classes)
    ),
    names = names
  )
}

abort_as_tibble_row_vector <- function(x, call = caller_env()) {
  tibble_abort(call = call, paste0(
    "`x` must be a vector in `as_tibble_row()`, not ", class(x)[[1]], "."
  ))
}

abort_as_tibble_row_size_one <- function(j, name, size, call = caller_env()) {
  desc <- tick(name)
  desc[name == ""] <- paste0("at position ", j[name == ""])

  tibble_abort(call = call, problems(
    "All elements must be size one, use `list()` to wrap.",
    paste0("Element ", desc, " is of size ", size, ".")
  ))
}

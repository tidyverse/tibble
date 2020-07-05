#' Get a glimpse of your data
#'
#' This is like a transposed version of `print()`: columns run down the page,
#' and data runs across. This makes it possible to see every column in
#' a data frame. It's a little like [str()] applied to a data frame
#' but it tries to show you as much data as possible. (And it always shows
#' the underlying data, even when applied to a remote data source.)
#'
#' @section S3 methods:
#' `glimpse` is an S3 generic with a customised method for `tbl`s and
#' `data.frames`, and a default method that calls [str()].
#'
#' @param x An object to glimpse at.
#' @param width Width of output: defaults to the setting of the option
#'   `tibble.width` (if finite) or the width of the console.
#' @param ... Other arguments passed on to individual methods.
#' @return x original x is (invisibly) returned, allowing `glimpse()` to be
#'   used within a data pipe line.
#' @export
#' @examples
#' glimpse(mtcars)
#'
#' if (!requireNamespace("nycflights13", quietly = TRUE))
#'   stop("Please install the nycflights13 package to run the rest of this example")
#'
#' glimpse(nycflights13::flights)
glimpse <- function(x, width = NULL, ...) {
  UseMethod("glimpse")
}

#' @export
glimpse.tbl <- function(x, width = NULL, ...) {
  width <- tibble_glimpse_width(width)
  if (!is.finite(width)) {
    stopc("`width` must be finite")
  }

  cat_line("Observations: ", big_mark(nrow(x)))

  # this is an overestimate, but shouldn't be too expensive.
  # every type needs at least three characters: "x, "
  rows <- as.integer(width / 3)
  df <- as.data.frame(head(x, rows))

  cat_line("Variables: ", big_mark(ncol(df)))
  if (ncol(df) == 0) return(invisible(x))

  var_types <- map_chr(df, type_sum)
  ticked_names <- tick_non_syntactic(names(df))
  var_names <- paste0("$ ", justify(ticked_names, right = FALSE), " <", var_types, "> ")

  data_width <- width - nchar(var_names) - 2

  formatted <- map_chr(df, function(x) collapse(format_v(x)))
  truncated <- str_trunc(formatted, data_width)

  cat_line(var_names, truncated)
  invisible(x)
}

#' @export
glimpse.data.frame <- glimpse.tbl

#' @export
#' @importFrom utils str
glimpse.default <- function(x, width = NULL, max.level = 3, ...) {
  str(x, width = tibble_width(width), max.level = max.level, ...)
  invisible(x)
}

str_trunc <- function(x, max_width) {
  width <- nchar(x)

  for (i in seq_along(x)) {
    if (width[i] <= max_width[i]) next

    x[i] <- paste0(substr(x[i], 1, max_width[i] - 3), "...")
  }

  x
}

format_v <- function(x) UseMethod("format_v")

#' @export
format_v.default <- function(x) format(x, trim = TRUE, justify = "none")

#' @export
format_v.list <- function(x) {
  out <- map(x, format_v)
  atomic <- map_int(out, length) == 1L
  out <- map_chr(out, collapse)
  out[!atomic] <- paste0("<", out[!atomic], ">")
  paste0("[", collapse(out), "]")
}

#' @export
format_v.character <- function(x) encodeString(x, quote = '"')

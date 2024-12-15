#' Printing tibbles
#'
#' @description
#' One of the main features of the `tbl_df` class is the printing:
#'
#' * Tibbles only print as many rows and columns as fit on one screen,
#'   supplemented by a summary of the remaining rows and columns.
#' * Tibble reveals the type of each column, which keeps the user informed about
#'   whether a variable is, e.g., `<chr>` or `<fct>` (character versus factor).
#'   See `vignette("types")` for an overview of common
#'   type abbreviations.
#'
#' Printing can be tweaked for a one-off call by calling `print()` explicitly
#' and setting arguments like `n` and `width`. More persistent control is
#' available by setting the options described in [pillar::pillar_options].
#' See also `vignette("digits")` for a comparison to base options,
#' and `vignette("numbers")` that showcases [num()] and [char()]
#' for creating columns with custom formatting options.
#'
#' As of tibble 3.1.0, printing is handled entirely by the \pkg{pillar} package.
#' If you implement a package that extends tibble,
#' the printed output can be customized in various ways.
#' See `vignette("extending", package = "pillar")` for details,
#' and [pillar::pillar_options] for options that control the display in the console.
#'
# Copied from pillar::format.tbl() to avoid roxygen2 warning
#' @param x Object to format or print.
#' @param ... Passed on to [tbl_format_setup()].
#' @param n Number of rows to show. If `NULL`, the default, will print all rows
#'   if less than the `print_max` [option][pillar::pillar_options].
#'   Otherwise, will print as many rows as specified by the
#'   `print_min` [option][pillar::pillar_options].
#' @param width Width of text output to generate. This defaults to `NULL`, which
#'   means use the `width` [option][pillar::pillar_options].
#' @param max_extra_cols Number of extra columns to print abbreviated information for,
#'   if the width is too small for the entire tibble. If `NULL`,
#'   the `max_extra_cols` [option][pillar::pillar_options] is used.
#'   The previously defined `n_extra` argument is soft-deprecated.
#' @param max_footer_lines Maximum number of footer lines. If `NULL`,
#'   the `max_footer_lines` [option][pillar::pillar_options] is used.
#'
#' @examples
#' print(as_tibble(mtcars))
#' print(as_tibble(mtcars), n = 1)
#' print(as_tibble(mtcars), n = 3)
#'
#' print(as_tibble(trees), n = 100)
#'
#' print(mtcars, width = 10)
#'
#' mtcars2 <- as_tibble(cbind(mtcars, mtcars), .name_repair = "unique")
#' print(mtcars2, n = 25, max_extra_cols = 3)
#'
#' @examplesIf requireNamespace("nycflights13", quietly = TRUE)
#' print(nycflights13::flights, max_footer_lines = 1)
#' print(nycflights13::flights, width = Inf)
#'
#' @name formatting
#' @aliases print.tbl format.tbl
NULL

# Only for documentation, doesn't do anything
#' @rdname formatting
print.tbl_df <- function(x, width = NULL, ..., n = NULL, max_extra_cols = NULL,
                         max_footer_lines = NULL) {
  NextMethod()
}

# Only for documentation, doesn't do anything
#' @rdname formatting
format.tbl_df <- function(x, width = NULL, ..., n = NULL, max_extra_cols = NULL,
                          max_footer_lines = NULL) {
  NextMethod()
}

#' Legacy printing
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#' As of tibble 3.1.0, printing is handled entirely by the \pkg{pillar} package.
#' Do not use this function.
#' If you implement a package that extend tibble,
#' the printed output can be customized in various ways.
#' See `vignette("extending", package = "pillar")` for details.
#'
#' @param x Object to format or print.
#' @param n Number of rows to show. If `NULL`, the default, will print all rows
#'   if less than option `tibble.print_max`. Otherwise, will print
#'   `tibble.print_min` rows.
#' @param width Width of text output to generate. This defaults to `NULL`, which
#'   means use `getOption("tibble.width")` or (if also `NULL`)
#'   `getOption("width")`; the latter displays only the columns that fit on one
#'   screen. You can also set `options(tibble.width = Inf)` to override this
#'   default and always print all columns, this may be slow for very wide tibbles.
#' @param n_extra Number of extra columns to print abbreviated information for,
#'   if the width is too small for the entire tibble. If `NULL`, the default,
#'   will print information about at most `tibble.max_extra_cols` extra columns.
#'
#' @return An object with a `print()` method that will print the input
#'   similarly to a tibble.
#'   The internal data format is an implementation detail, do not rely on it.
#' @export
#' @keywords internal
trunc_mat <- function(x, n = NULL, width = NULL, n_extra = NULL) {
  deprecate_soft("3.1.0", "tibble::trunc_mat()",
    details = "Printing has moved to the pillar package."
  )

  if (!inherits(x, "tbl")) {
    class(x) <- c("tbl", class(x))
  }

  setup <- pillar::tbl_format_setup(x, width = width, n = n, max_extra_cols = n_extra)

  header <- pillar::tbl_format_header(x, setup)
  body <- pillar::tbl_format_body(x, setup)
  footer <- pillar::tbl_format_footer(x, setup)

  text <- c(header, body, footer)
  structure(list(text = text, summary = list(NULL)), class = "trunc_mat")
}

#' @importFrom pillar style_subtle
#' @export
format.trunc_mat <- function(x, width = NULL, ...) {
  unclass(x)[[1]]
}

#' @export
print.trunc_mat <- function(x, ...) {
  writeLines(format(x, ...))
  invisible(x)
}

#' Printing tibbles
#'
#' @description
#' \lifecycle{maturing}
#'
#' One of the main features of the `tbl_df` class is the printing:
#'
#' * Tibbles only print as many rows and columns as fit on one screen,
#'   supplemented by a summary of the remaining rows and columns.
#' * Tibble reveals the type of each column, which keeps the user informed about
#'   whether a variable is, e.g., `<chr>` or `<fct>` (character versus factor).
#'
#' Printing can be tweaked for a one-off call by calling `print()` explicitly
#' and setting arguments like `n` and `width`. More persistent control is
#' available by setting the options described below.
#'
#' @inheritSection pillar::`pillar-package` Package options
#' @section Package options:
#'
#' Options used by the tibble and pillar packages to format and print `tbl_df`
#' objects.
# FIXME: Replace trunc_mat() reference by new idioms
#' Used by the formatting workhorse [trunc_mat()] and, therefore,
#' indirectly, by `print.tbl()`.
#'
#' * `tibble.print_max`: Row number threshold: Maximum number of rows printed.
#'   Set to `Inf` to always print all rows.  Default: 20.
#' * `tibble.print_min`: Number of rows printed if row number threshold is
#'   exceeded. Default: 10.
#' * `tibble.width`: Output width. Default: `NULL` (use `width` option).
#' * `tibble.max_extra_cols`: Number of extra columns printed in reduced form.
#'   Default: 100.
#'
#' @param x Object to format or print.
#' @param ... Other arguments passed on to individual methods.
#' @param n Number of rows to show. If `NULL`, the default, will print all rows
#'   if less than option `tibble.print_max`. Otherwise, will print
#'   `tibble.print_min` rows.
#' @param width Width of text output to generate. This defaults to `NULL`, which
#'   means use `getOption("tibble.width")` or (if also `NULL`)
#'   `getOption("width")`; the latter displays only the columns that fit on one
#'   screen. You can also set `options(tibble.width = Inf)` to override this
#'   default and always print all columns, this may slow down printing
#'   substantially.
#' @param n_extra Number of extra columns to print abbreviated information for,
#'   if the width is too small for the entire tibble. If `NULL`, the default,
#'   will print information about at most `tibble.max_extra_cols` extra columns.
#' @examples
#' tbl <- tibble(
#'   characters = letters[1:3],
#'   numbers = 4:6,
#'   data = c(3e3, 2, -1e-3)
#' )
#'
#' print(tbl)
#' print(tbl, n = 1)
#' print(tbl, width = 20)
#' print(tbl, width = 20, n_extra = 0)
#'
#' tbl_wide <- as_tibble_row(setNames(1:26, letters))
#' print(tbl_wide)
#' print(tbl_wide, width = Inf)
#' @name formatting
NULL

#' @rdname formatting
#' @export
print.tbl <- function(x, ..., n = NULL, width = NULL, n_extra = NULL) {
  cat_line(format(x, ..., n = n, width = width, n_extra = n_extra))
  invisible(x)
}

#' @rdname formatting
#' @export
format.tbl <- function(x, ..., n = NULL, width = NULL, n_extra = NULL) {
  width <- tibble_width(width)

  header <- tbl_header(x, width = width)
  body <- tbl_body(x, width = width, n = n, header = header)
  footer <- tbl_footer(x, width = width, n_extra = n_extra, body = body)

  c(style_subtle(header), body, style_subtle(footer))
}

tbl_header <- function(x, ..., width = NULL) {
  check_dots_empty()
  width <- tibble_width(width)
  header <- format_header(tbl_sum(x))
  format_comment(header, width)
}

tbl_body <- function(x, width = NULL, n = NULL, header) {
  character()
}

tbl_footer <- function(x, width = NULL, n_extra = NULL, body) {
  character()
}

format_header <- function(tbl_sum) {
  if (all(names2(tbl_sum) == "")) {
    tbl_sum
  } else {
    paste0(
      justify(
        paste0(names2(tbl_sum), ":"),
        right = FALSE, space = "\u00a0"
      ),
      # We add a space after the NBSP inserted by justify()
      # so that wrapping occurs at the right location for very narrow outputs
      " ",
      tbl_sum
    )
  }
}

format_comment <- function(x, width) {
  if (length(x) == 0L) return(character())
  map_chr(x, wrap, prefix = "# ", width = min(width, getOption("width")))
}

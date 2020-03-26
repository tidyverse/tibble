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
#' Used by `print.tbl()` via the formatting workhorses
#' `tbl_header()`, `tbl_body()` and `tbl_footer()`.
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

#' Customizing output for subclasses
#'
#' The experimental `tbl_*()` functions offer a new interface
#' for overriding parts of the output of a tibble subclass
#' without overriding the [format()] or [print()] methods.
#'
#' Because the formatting of the footer may depend on computations
#' already done for formatting the header or the body,
#' each formatter receives the formatted value of the previous component
#' as input.
#' Therefore, if you override `tbl_body()`, ensure the return value
#' is consistent with the default implementation of `tbl_footer()`.
#' Formatters may attach attributes to their return values.
#' @param ... Must be empty.
#' @inheritParams print.tbl
#' @name custom-formatting
NULL

#' tbl_header
#'
#' `tbl_header()` is responsible for formatting the header.
#' The default implementation presents the value of [tbl_sum()]
#' in a tabular format, one row per value.
#' When the tibble is printed, subtle style is applied to the header.
#' @rdname custom-formatting
tbl_header <- function(x, ..., width = NULL) {
  check_dots_empty()

  width <- tibble_width(width)
  header <- format_header(tbl_sum(x))
  format_comment(header, width)
}

#' tbl_body
#'
#' @description
#' `tbl_body()` is responsible for formatting the body of the table.
#' The default implementation calls [nrow()] and [head()] on the input,
#' delegates the work to [pillar::colonnade()]
#' and [pillar::squeeze()], and attaches the following attributes
#' to the output:
#'
#' - `"squeezed"`: the output of `pillar::squeeze()`
#' - `"rows_missing"`: the number of rows that are not shown in the body,
#'   `NA` if unknown
#' - `"rows_min"`: the minimum number of rows that the input must have
#'
#' This is important for formatting table objects that are proxies
#' to remote tables or queries where the number of rows may be unknown
#' in advance.
#' @param header The value returned by a previous call to `tbl_header()`.
#' @rdname custom-formatting
tbl_body <- function(x, ..., width = NULL, n = NULL, header = tbl_header(x, width = width)) {
  check_dots_empty()

  width <- tibble_width(width)

  rows <- nrow(x)

  if (is_null(n) || n < 0) {
    if (is.na(rows) || rows > tibble_opt("print_max")) {
      n <- tibble_opt("print_min")
    } else {
      n <- rows
    }
  }

  if (is.na(rows)) {
    df <- as.data.frame(head(x, n + 1))
    if (nrow(df) <= n) {
      rows <- nrow(df)
    } else {
      df <- df[seq_len(n), , drop = FALSE]
    }
  } else {
    df <- as.data.frame(head(x, n))
  }

  shrunk <- shrink(df, rows, n, star = has_rownames(x))
  squeezed <- pillar::squeeze(shrunk$colonnade, width = width)
  body <- format_body(squeezed)

  structure(
    body,
    squeezed = squeezed,
    rows_missing = shrunk$rows_missing,
    rows_min = nrow(df)
  )
}

#' tbl_footer
#'
#' `tbl_footer()` is responsible for formatting the footer of the table.
#' The default implementation queries [nrow()] and summarizes information
#' on rows and columns missing from the output.
#' It accesses the `"squeezed"`, `"rows_missing"` and `"rows_min"` attributes
#' from the `body` argument.
#' @param header The value returned by a previous call to `tbl_body()`.
#' @rdname custom-formatting
tbl_footer <- function(x, ..., width = NULL, n_extra = NULL, body = tbl_body(x, width = width)) {
  check_dots_empty()

  width <- tibble_width(width)

  rows_total <- nrow(x)
  squeezed <- attr(body, "squeezed")
  rows_missing <- attr(body, "rows_missing")
  rows_min <- attr(body, "rows_min")
  n_extra <- n_extra %||% tibble_opt("max_extra_cols")

  footer <- format_footer(squeezed, rows_missing, rows_total, rows_min, n_extra)
  format_comment(pre_dots(footer), width)
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

shrink <- function(df, rows, n, star, colonnade_name = "colonnade") {
  if (is.na(rows)) {
    needs_dots <- (nrow(df) >= n)
  } else {
    needs_dots <- (rows > n)
  }

  if (needs_dots) {
    rows_missing <- rows - n
  } else {
    rows_missing <- 0L
  }

  df <- remove_rownames(df)
  has_row_id <- if (star) "*" else TRUE
  colonnade <- pillar::colonnade(df, has_row_id = has_row_id)

  list2(!!colonnade_name := colonnade, rows_missing = rows_missing)
}

format_footer <- function(squeezed, rows_missing, rows_total, rows_min, n_extra) {
  extra_rows <- format_footer_rows(
    squeezed, rows_missing, rows_total, rows_min
  )
  extra_cols <- format_footer_cols(
    pillar::extra_cols(squeezed, n = n_extra),
    rows_total, rows_min
  )

  extra <- c(extra_rows, extra_cols)
  if (length(extra) >= 1) {
    extra[[1]] <- paste0("with ", extra[[1]])
    extra[-1] <- map_chr(extra[-1], function(ex) paste0("and ", ex))
    collapse(extra)
  } else {
    character()
  }
}

format_footer_rows <- function(squeezed, rows_missing, rows_total, rows_min) {
  if (length(squeezed) != 0) {
    if (is.na(rows_missing)) {
      "more rows"
    } else if (rows_missing > 0) {
      paste0(big_mark(rows_missing), pluralise_n(" more row(s)", rows_missing))
    }
  } else if (is.na(rows_total) && rows_min > 0) {
    paste0("at least ", big_mark(rows_min), pluralise_n(" row(s) total", rows_min))
  }
}

format_footer_cols <- function(extra_cols, rows_total, rows_min) {
  if (length(extra_cols) == 0) return(NULL)

  vars <- format_extra_vars(extra_cols)
  paste0(
    big_mark(length(extra_cols)), " ",
    if (!identical(rows_total, 0L) && rows_min > 0) "more ",
    pluralise("variable(s)", extra_cols), vars
  )
}

format_extra_vars <- function(extra_cols) {
  # Also covers empty extra_cols vector!
  if (is.na(extra_cols[1])) return("")

  if (anyNA(extra_cols)) {
    extra_cols <- c(extra_cols[!is.na(extra_cols)], symbol$ellipsis)
  }

  paste0(": ", collapse(extra_cols))
}

pre_dots <- function(x) {
  if (length(x) > 0) {
    paste0(symbol$ellipsis, " ", x)
  } else {
    character()
  }
}

justify <- function(x, right = TRUE, space = " ") {
  if (length(x) == 0L) return(character())
  width <- nchar_width(x)
  max_width <- max(width)
  spaces_template <- paste(rep(space, max_width), collapse = "")
  spaces <- map_chr(max_width - width, substr, x = spaces_template, start = 1L)
  if (right) {
    paste0(spaces, x)
  } else {
    paste0(x, spaces)
  }
}

format_comment <- function(x, width) {
  if (length(x) == 0L) return(character())
  map_chr(x, wrap, prefix = "# ", width = min(width, getOption("width")))
}

big_mark <- function(x, ...) {
  # The thousand separator,
  # "," unless it's used for the decimal point, in which case "."
  mark <- if (identical(getOption("OutDec"), ",")) "." else ","
  ret <- formatC(x, big.mark = mark, format = "d", ...)
  ret[is.na(x)] <- "??"
  ret
}

collapse <- function(x) paste(x, collapse = ", ")

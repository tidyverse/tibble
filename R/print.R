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
#' See also `vignette("digits", package = "pillar")` for a comparison to base options,
#' and [num()] and [char()] for creating columns with custom formatting options.
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
#' @export
#' @keywords internal
trunc_mat <- function(x, n = NULL, width = NULL, n_extra = NULL) {
  deprecate_soft("3.1.0", "tibble::trunc_mat()",
    details = "Printing has moved to the pillar package.")

  rows <- nrow(x)

  if (is.null(n) || n < 0) {
    if (is.na(rows) || rows > tibble_opt("print_max")) {
      n <- tibble_opt("print_min")
    } else {
      n <- rows
    }
  }
  n_extra <- n_extra %||% tibble_opt("max_extra_cols")

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

  shrunk <- shrink_mat(df, rows, n, star = has_rownames(x))
  trunc_info <- list(
    width = width, rows_total = rows, rows_min = nrow(df),
    n_extra = n_extra, summary = tbl_sum(x)
  )

  structure(
    c(shrunk, trunc_info),
    class = c(paste0("trunc_mat_", class(x)), "trunc_mat")
  )
}

shrink_mat <- function(df, rows, n, star) {
  df <- remove_rownames(df)
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

  mcf <- pillar::colonnade(
    df,
    has_row_id = if (star) "*" else TRUE
  )

  list(mcf = mcf, rows_missing = rows_missing)
}

#' @importFrom pillar style_subtle
#' @export
format.trunc_mat <- function(x, width = NULL, ...) {
  if (is.null(width)) {
    width <- x$width
  }

  width <- tibble_width(width)

  named_header <- format_header(x)
  if (all(names2(named_header) == "")) {
    header <- named_header
  } else {
    header <- paste0(
      justify(
        paste0(names2(named_header), ":"),
        right = FALSE, space = NBSP
      ),
      # We add a space after the NBSP inserted by justify()
      # so that wrapping occurs at the right location for very narrow outputs
      " ",
      named_header
    )
  }

  comment <- format_comment(header, width = width)
  squeezed <- pillar::squeeze(x$mcf, width = width)
  mcf <- format_body(squeezed)

  # Splitting lines is important, otherwise subtle style may be lost
  # if column names contain spaces.
  footer <- pre_dots(format_footer(x, squeezed))
  footer_comment <- split_lines(format_comment(footer, width = width))

  c(style_subtle(comment), mcf, style_subtle(footer_comment))
}

# Needs to be defined in package code: r-lib/pkgload#85
print_with_mocked_format_body <- function(x, ...) {
  scoped_lifecycle_silence()

  mockr::with_mock(
    format_body = function(x, ...) {
      paste0("<body created by pillar>")
    },
    {
      print(x, ...)
    }
  )
}

#' @export
print.trunc_mat <- function(x, ...) {
  cli::cat_line(format(x, ...))
  invisible(x)
}

format_header <- function(x) {
  x$summary
}

format_body <- function(x) {
  format(x)
}

format_footer <- function(x, squeezed_colonnade) {
  extra_rows <- format_footer_rows(x)
  extra_cols <- format_footer_cols(x, pillar::extra_cols(squeezed_colonnade, n = x$n_extra))

  extra <- c(extra_rows, extra_cols)
  if (length(extra) >= 1) {
    extra[[1]] <- paste0("with ", extra[[1]])
    extra[-1] <- map_chr(extra[-1], function(ex) paste0("and ", ex))
    collapse(extra)
  } else {
    character()
  }
}

format_footer_rows <- function(x) {
  if (length(x$mcf) != 0) {
    if (is.na(x$rows_missing)) {
      "more rows"
    } else if (x$rows_missing > 0) {
      paste0(big_mark(x$rows_missing), pluralise_n(" more row(s)", x$rows_missing))
    }
  } else if (is.na(x$rows_total) && x$rows_min > 0) {
    paste0("at least ", big_mark(x$rows_min), pluralise_n(" row(s) total", x$rows_min))
  }
}

format_footer_cols <- function(x, extra_cols) {
  if (length(extra_cols) == 0) return(NULL)

  vars <- format_extra_vars(extra_cols)
  paste0(
    big_mark(length(extra_cols)), " ",
    if (!identical(x$rows_total, 0L) && x$rows_min > 0) "more ",
    pluralise("variable(s)", extra_cols), vars
  )
}

format_extra_vars <- function(extra_cols) {
  # Also covers empty extra_cols vector!
  if (is.na(extra_cols[1])) return("")

  if (anyNA(extra_cols)) {
    extra_cols <- c(extra_cols[!is.na(extra_cols)], cli::symbol$ellipsis)
  }

  paste0(": ", collapse(extra_cols))
}

format_comment <- function(x, width) {
  if (length(x) == 0L) return(character())
  map_chr(x, wrap, prefix = "# ", width = min(width, getOption("width")))
}

pre_dots <- function(x) {
  if (length(x) > 0) {
    paste0(cli::symbol$ellipsis, " ", x)
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

split_lines <- function(x) {
  # Avoid .ptype argument to vec_c()
  if (is_empty(x)) return(character())

  unlist(strsplit(x, "\n", fixed = TRUE))
}


#' knit_print method for trunc mat
#' @keywords internal
#' @export
knit_print.trunc_mat <- function(x, options) {
  header <- format_header(x)
  if (length(header) > 0L) {
    header[names2(header) != ""] <- paste0(names2(header), ": ", header)
    summary <- header
  } else {
    summary <- character()
  }

  squeezed <- pillar::squeeze(x$mcf, x$width)

  kable <- format_knitr_body(squeezed)
  extra <- format_footer(x, squeezed)

  if (length(extra) > 0) {
    extra <- wrap("(", collapse(extra), ")", width = x$width)
  } else {
    extra <- "\n"
  }

  res <- paste(c("", "", summary, "", kable, "", extra), collapse = "\n")
  knitr::asis_output(fansi::strip_sgr(res), cacheable = TRUE)
}

format_knitr_body <- function(x) {
  knitr::knit_print(x)
}

big_mark <- function(x, ...) {
  # The thousand separator,
  # "," unless it's used for the decimal point, in which case "."
  mark <- if (identical(getOption("OutDec"), ",")) "." else ","
  ret <- formatC(x, big.mark = mark, format = "d", ...)
  ret[is.na(x)] <- "??"
  ret
}

mult_sign <- function() {
  "x"
}

spaces_around <- function(x) {
  paste0(" ", x, " ")
}

format_n <- function(x) collapse(quote_n(x))

quote_n <- function(x) UseMethod("quote_n")
#' @export
quote_n.default <- function(x) as.character(x)
#' @export
quote_n.character <- function(x) tick(x)

collapse <- function(x) paste(x, collapse = ", ")

# wrap --------------------------------------------------------------------

NBSP <- "\U00A0"

wrap <- function(..., indent = 0, prefix = "", width) {
  x <- paste0(..., collapse = "")
  wrapped <- strwrap2(x, width - nchar_width(prefix), indent)
  wrapped <- paste0(prefix, wrapped)
  wrapped <- gsub(NBSP, " ", wrapped)

  paste0(wrapped, collapse = "\n")
}

strwrap2 <- function(x, width, indent) {
  fansi::strwrap_ctl(x, width = max(width, 0), indent = indent, exdent = indent + 2)
}

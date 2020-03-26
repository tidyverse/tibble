#' Legacy help page for compatibility with existing packages
#'
#' @description
#' \lifecycle{superseded}
#'
#' Please see [print.tbl()] for the print method for tibbles.
#'
#' @name print.tbl_df
#' @keywords internal
NULL

#' Prepare a tibble for formatting
#'
#' @description
#' \lifecycle{questioning}
#'
#' For a tibble, returns an object that, when formatted with [format()],
#' produces the same output as formatting the tibble.
#' In other words, `format(trunc_mat(x, ...))` is the same as `format(x, ...)`.
#'
#' @section Life cycle:
# FIXME: Elaborate
#' This function is in the questioning stage.
#'
#' @inheritParams print.tbl
#'
#' @export
trunc_mat <- function(x, n = NULL, width = NULL, n_extra = NULL) {
  rows <- nrow(x)

  if (is_null(n) || n < 0) {
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

  shrunk <- shrink(df, rows, n, star = has_rownames(x), "mcf")
  trunc_info <- list(
    width = width, rows_total = rows, rows_min = nrow(df),
    n_extra = n_extra, summary = tbl_sum(x)
  )

  structure(
    c(shrunk, trunc_info),
    class = c(paste0("trunc_mat_", class(x)), "trunc_mat")
  )
}

#' @importFrom pillar style_subtle
#' @export
format.trunc_mat <- function(x, width = NULL, ...) {
  width <- tibble_width(width %||% x$width)

  header <- format_header(x$summary)
  header_comment <- format_comment(header, width = width)

  squeezed <- pillar::squeeze(x$mcf, width = width)
  mcf <- format_body(squeezed)

  footer <- format_footer(squeezed, x$rows_missing, x$rows_total, x$rows_min, x$n_extra)
  footer_comment <- format_comment(pre_dots(footer), width = width)

  c(style_subtle(header_comment), mcf, style_subtle(footer_comment))
}

# Needs to be defined in package code: r-lib/pkgload#85
print_without_body <- function(x, ...) {
  mockr::with_mock(
    format_body = function(x, ...) {
      paste0("<body created by pillar>")
    },
    print(x, ...)
  )
}

#' @export
print.trunc_mat <- function(x, ...) {
  cat_line(format(x, ...))
  invisible(x)
}

format_body <- function(x) {
  format(x)
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
  extra <- format_footer(squeezed, x$rows_missing, x$rows_total, x$rows_min, x$n_extra)

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

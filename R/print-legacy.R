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
  comment <- format_comment(header, width = width)

  squeezed <- pillar::squeeze(x$mcf, width = width)
  mcf <- format_body(squeezed)

  footer <- format_comment(pre_dots(format_footer(x, squeezed)), width = width)

  c(style_subtle(comment), mcf, style_subtle(footer))
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

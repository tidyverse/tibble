#' Tools for describing matrices
#'
#' @param x Object to show.
#' @param n Number of rows to show. If `NULL`, the default, will print
#'   all rows if less than option `tibble.print_max`. Otherwise, will
#'   print `tibble.print_min` rows.
#' @param width Width of text output to generate. This defaults to NULL, which
#'   means use `getOption("tibble.width")` or (if also NULL)
#'   `getOption("width")`; the latter displays only the columns that
#'   fit on one screen. You can also set `options(tibble.width = Inf)` to
#'   override this default and always print all columns.
#' @param n_extra Number of extra columns to print abbreviated information for,
#'   if the width is too small for the entire tibble. If `NULL`, the
#'   default, will print information about at most `tibble.max_extra_cols`
#'   extra columns.
#' @seealso \link{tibble-package}
#' @keywords internal
#' @examples
#' trunc_mat(mtcars)
#'
#' print(as_tibble(mtcars))
#' print(as_tibble(mtcars), n = 1)
#' print(as_tibble(mtcars), n = 3)
#' print(as_tibble(mtcars), n = 100)
#'
#' if (!requireNamespace("nycflights13", quietly = TRUE))
#'   stop("Please install the nycflights13 package to run the rest of this example")
#'
#' print(nycflights13::flights, n_extra = 2)
#' print(nycflights13::flights, width = Inf)
#' @name formatting
NULL

#' @export
#' @rdname formatting
trunc_mat <- function(x, n = NULL, width = NULL, n_extra = NULL) {
  rows <- nrow(x)

  if (is_null(n)) {
    if (is.na(rows) || rows > tibble_opt("print_max")) {
      n <- tibble_opt("print_min")
    } else {
      n <- rows
    }
  }
  n_extra <- n_extra %||% tibble_opt("max_extra_cols")

  df <- as.data.frame(head(x, n))

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
    has_row_id = if (star) "*" else TRUE,
    needs_dots = needs_dots
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
        paste0(names2(named_header), ":"), right = FALSE, space = "\u00a0"
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
    paste0("... ", x)
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
  knitr::asis_output(crayon::strip_style(res), cacheable = TRUE)
}

format_knitr_body <- function(x) {
  knitr::knit_print(x)
}

format_factor <- function(x) {
  format_character(as.character(x))
}

format_character <- function(x) {
  res <- quote_escaped(x)
  res[is.na(x)] <- "<NA>"
  res
}

quote_escaped <- function(x) {
  res <- encodeString(x, quote = '"')
  plain <- which(res == paste0('"', x, '"'))
  res[plain] <- x[plain]
  res
}

# function for the thousand separator,
# returns "," unless it's used for the decimal point, in which case returns "."
big_mark <- function(x, ...) {
  mark <- if (identical(getOption("OutDec"), ",")) "." else ","
  ret <- formatC(x, big.mark = mark, ...)
  ret[is.na(x)] <- "??"
  ret
}

tibble_width <- function(width) {
  if (!is_null(width)) {
    return(width)
  }

  width <- tibble_opt("width")
  if (!is_null(width)) {
    return(width)
  }

  getOption("width")
}

tibble_glimpse_width <- function(width) {
  if (!is_null(width)) {
    return(width)
  }

  width <- tibble_opt("width")
  if (!is_null(width) && is.finite(width)) {
    return(width)
  }

  getOption("width")
}

pluralise_msg <- function(message, objects) {
  paste0(pluralise(message, objects), format_n(objects))
}

pluralise <- function(message, objects) {
  pluralise_n(message, length(objects))
}

pluralise_n <- function(message, n) {
  stopifnot(n >= 0)
  if (n == 1) {
    # strip [, unless there is space in between
    message <- gsub("\\[([^\\] ]+)\\]", "\\1", message, perl = TRUE)
    # remove ( and its content, unless there is space in between
    message <- gsub("\\([^\\) ]+\\)", "", message, perl = TRUE)
  } else {
    # strip (, unless there is space in between
    message <- gsub("\\(([^\\) ]+)\\)", "\\1", message, perl = TRUE)
    # remove [ and its content, unless there is space in between
    message <- gsub("\\[[^\\] ]+\\]\\s*", "", message, perl = TRUE)
  }

  message
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

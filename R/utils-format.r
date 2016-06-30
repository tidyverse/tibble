#' Tools for describing matrices
#'
#' @param x Object to show.
#' @param n Number of rows to show. If \code{NULL}, the default, will print
#'   all rows if less than option \code{tibble.print_max}. Otherwise, will
#'   print \code{tibble.print_min} rows.
#' @param width Width of text output to generate. This defaults to NULL, which
#'   means use \code{getOption("tibble.width")} or (if also NULL)
#'   \code{getOption("width")}; the latter displays only the columns that
#'   fit on one screen. You can also set \code{options(tibble.width = Inf)} to
#'   override this default and always print all columns.
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
#' @name formatting
NULL

#' @export
#' @rdname formatting
#' @importFrom stats setNames
trunc_mat <- function(x, n = NULL, width = NULL, n_extra = NULL) {
  rows <- nrow(x)

  if (is.null(n)) {
    if (is.na(rows) || rows > tibble_opt("print_max")) {
      n <- tibble_opt("print_min")
    } else {
      n <- rows
    }
  }
  n_extra <- n_extra %||% tibble_opt("max_extra_cols")

  df <- as.data.frame(head(x, n))
  width <- tibble_width(width)

  shrunk <- shrink_mat(df, width, rows, n, star = has_rownames(x))
  trunc_info <- list(width = width, rows_total = rows, rows_min = nrow(df),
                     n_extra = n_extra, summary = tbl_sum(x))

  structure(c(shrunk, trunc_info), class = "trunc_mat")
}

#' @importFrom stats setNames
shrink_mat <- function(df, width, rows, n, star) {
  var_types <- vapply(df, type_sum, character(1))

  if (ncol(df) == 0 || nrow(df) == 0) {
    return(new_shrunk_mat(NULL, var_types))
  }

  df <- remove_rownames(df)

  # Minimum width of each column is 5 "(int)", so we can make a quick first
  # pass
  max_cols <- floor(width / 5)
  extra_wide <- (seq_along(df) > max_cols)
  df[] <- df[!extra_wide]

  # List columns need special treatment because format can't be trusted
  classes <- paste0("<", vapply(df, type_sum, character(1)), ">")
  is_list <- vapply(df, is.list, logical(1))
  df[is_list] <- lapply(df[is_list], function(x) {
    summary <- obj_sum(x)
    paste0("<", summary, ">")
  })

  # Character columns need special treatment because of NA
  is_character <- vapply(df, is.character, logical(1))
  df[is_character] <- lapply(df[is_character], format_character)

  mat <- format(df, justify = "left")
  values <- c(format(rownames(mat))[[1]], unlist(mat[1, ]))

  names <- c("", colnames(mat))

  # Column needs to be as wide as widest of name, values, and class
  w <- pmax(
    pmax(
      nchar_width(encodeString(values)),
      nchar_width(encodeString(names))
    ),
    nchar_width(encodeString(c("", classes)))
  )
  cumw <- cumsum(w + 1)

  too_wide <- cumw[-1] > width
  # Always display at least one column
  if (all(too_wide)) {
    too_wide[1] <- FALSE
    df[[1]] <- substr(df[[1]], 1, width)
  }
  shrunk <- format(df[, !too_wide, drop = FALSE])
  shrunk <- rbind(" " = classes, shrunk)
  if (star)
    rownames(shrunk)[[1]] <- "*"
  colnames(shrunk) <- colnames(df)[!too_wide]

  if (is.na(rows))
    needs_dots <- (nrow(df) >= n)
  else
    needs_dots <- (rows > n)
  if (needs_dots) {
    dot_width <- pmin(w[-1][!too_wide], 3)
    dots <- vapply(dot_width, function(i) paste(rep(".", i), collapse = ""),
      FUN.VALUE = character(1))
    rows_missing <- rows - n
  } else {
    rows_missing <- 0L
  }

  extra_wide[seq_along(too_wide)] <- too_wide
  new_shrunk_mat(shrunk, var_types[extra_wide], rows_missing)
}

new_shrunk_mat <- function(table, extra, rows_missing = NULL) {
  list(table = table, extra = extra, rows_missing = rows_missing)
}

#' @export
print.trunc_mat <- function(x, ...) {
  print_summary(x)
  print_table(x)
  print_extra(x)
  invisible(x)
}

print_summary <- function(x) {
  summary <- format_summary(x)
  if (length(summary) > 0) {
    print_comment(summary, width = x$width)
  }
}

print_table <- function(x) {
  if (!is.null(x$table)) {
    print(x$table)
  }
}

print_extra <- function(x) {
  extra <- format_extra(x)
  if (length(extra) > 0) {
    print_comment("... ", collapse(extra), width = x$width)
  }
}

print_comment <- function(..., width) {
  cat_line(wrap(..., prefix = "# ", width = min(width, getOption("width"))))
}

format_summary <- function(x) {
  x$summary
}

format_extra <- function(x) {
  extra_rows <- format_extra_rows(x)
  extra_cols <- format_extra_cols(x)

  extra <- c(extra_rows, extra_cols)
  if (length(extra) >= 1) {
    extra[[1]] <- paste0("with ", extra[[1]])
    extra[-1] <- vapply(extra[-1], function(ex) paste0("and ", ex), character(1))
  }
  extra
}

format_extra_rows <- function(x) {
  if (!is.null(x$table)) {
    if (is.na(x$rows_missing)) {
      "more rows"
    } else if (x$rows_missing > 0) {
      paste0(big_mark(x$rows_missing), " more rows")
    }
  } else if (is.na(x$rows_total)) {
    paste0("at least ", x$rows_min, " rows total")
  }
}

format_extra_cols <- function(x) {
  if (length(x$extra) > 0) {
    var_types <- paste0(names(x$extra), NBSP, "<", x$extra, ">")
    if (x$n_extra > 0) {
      if (x$n_extra < length(var_types)) {
        var_types <- c(var_types[seq_len(x$n_extra)], "...")
      }
      vars <- paste0(": ", collapse(var_types))
    } else {
      vars <- ""
    }
    paste0(length(x$extra), " ",
           if (!identical(x$rows_total, 0L)) "more ",
           "variables", vars)
  }
}

#' knit_print method for trunc mat
#' @keywords internal
#' @export
knit_print.trunc_mat <- function(x, options) {
  summary <- format_summary(x)

  kable <- knitr::kable(x$table, row.names = FALSE)

  extra <- format_extra(x)

  if (length(extra) > 0) {
    extra <- wrap("(", collapse(extra), ")", width = x$width)
  } else {
    extra <- "\n"
  }

  res <- paste(c('', '', summary, '', kable, '', extra), collapse = '\n')
  knitr::asis_output(res, cacheable = TRUE)
}

NBSP <- "\U00A0"

wrap <- function(..., indent = 0, prefix = "", width) {
  x <- paste0(..., collapse = "")
  wrapped <- strwrap(x, indent = indent, exdent = indent + 2,
    width = max(width - nchar_width(prefix), 0))
  wrapped <- paste0(prefix, wrapped)
  wrapped <- gsub(NBSP, " ", wrapped)

  paste0(wrapped, collapse = "\n")
}



format_character <- function(x) {
  x[is.na(x)] <- "<NA>"
  x
}

# function for the thousand separator,
# returns "," unless it's used for the decimal point, in which case returns "."
big_mark <- function(x, ...) {
  mark <- if (identical(getOption("OutDec"), ",")) "." else ","
  formatC(x, big.mark = mark, ...)
}

tibble_width <- function(width) {
  width %||% tibble_opt("width") %||% getOption("width")
}

format_n <- function(x) collapse(quote_n(x))

quote_n <- function(x) UseMethod("quote_n")
#' @export
quote_n.default <- function(x) as.character(x)
#' @export
quote_n.character <- function(x) encodeString(x, quote = "'")

collapse <- function(x) paste(x, collapse = ", ")

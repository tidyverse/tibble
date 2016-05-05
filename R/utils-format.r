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
#' print(as_data_frame(mtcars))
#' print(as_data_frame(mtcars), n = 1)
#' print(as_data_frame(mtcars), n = 3)
#' print(as_data_frame(mtcars), n = 100)
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
  trunc_mat_impl(df, n, width, n_extra, rows)
}

trunc_mat_impl <- function(df, n, width, n_extra, rows) {
  var_types <- vapply(df, type_sum, character(1))
  var_names <- names(df)

  width <- tibble_width(width)
  if (ncol(df) == 0 || nrow(df) == 0) {
    shrunk <- new_shrunk_mat(NULL, extra = setNames(var_types, var_names))
  } else {
    shrunk <- shrink_mat(df, width, var_names, var_types, rows, n)
  }

  structure(c(shrunk, list(
    width = width, rows_total = rows, rows_min = nrow(df), n_extra = n_extra
  )), class = "trunc_mat")
}

#' @importFrom stats setNames
shrink_mat <- function(df, width, var_names, var_types, rows, n) {
  df <- remove_rownames(df)

  # Minimum width of each column is 5 "(int)", so we can make a quick first
  # pass
  max_cols <- floor(width / 5)
  extra_wide <- seq_along(var_names) > max_cols
  if (any(extra_wide)) {
    df <- df[!extra_wide]
  }

  # List columns need special treatment because format can't be trusted
  classes <- paste0("<", vapply(df, type_sum, character(1)), ">")
  is_list <- vapply(df, is.list, logical(1))
  df[is_list] <- lapply(df[is_list], function(x) {
    summary <- vapply(x, obj_sum, character(1))
    paste0("<", summary, ">")
  })

  mat <- format(df, justify = "left")
  values <- c(format(rownames(mat))[[1]], unlist(mat[1, ]))

  names <- c("", colnames(mat))

  # Column needs to be as wide as widest of name, values, and class
  w <- pmax(
    pmax(
      nchar(encodeString(values)),
      nchar(encodeString(names))
    ),
    nchar(encodeString(c("", classes)))
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
  colnames(shrunk) <- colnames(df)[!too_wide]

  if (is.na(rows))
    needs_dots <- (nrow(df) >= n)
  else
    needs_dots <- rows > n
  if (needs_dots) {
    dot_width <- pmin(w[-1][!too_wide], 3)
    dots <- vapply(dot_width, function(i) paste(rep(".", i), collapse = ""),
      FUN.VALUE = character(1))
    rows_missing <- rows - n
  } else {
    rows_missing <- 0L
  }

  if (any(extra_wide)) {
    extra_wide[seq_along(too_wide)] <- too_wide
    extra <- setNames(var_types[extra_wide], var_names[extra_wide])
  } else {
    extra <- setNames(var_types[too_wide], var_names[too_wide])
  }

  new_shrunk_mat(shrunk, extra, rows_missing)
}

new_shrunk_mat <- function(table, extra, rows_missing = NULL) {
  list(table = table, extra = extra, rows_missing = rows_missing)
}

#' @export
print.trunc_mat <- function(x, ...) {
  print_table(x)

  extra <- format_extra(x)
  lapply(extra, function(ex) cat(wrap("... ", ex, width = x$width), "\n", sep = ""))

  invisible(x)
}

format_extra <- function(x) {
  extra_rows <- format_extra_rows(x)
  extra_cols <- format_extra_cols(x)

  extra <- c(extra_rows, extra_cols)
  extra[[1]] <- paste0("with ", extra[[1]])
  extra[-1] <- vapply(extra[-1], function(ex) paste0("and ", ex), character(1))
  extra
}

print_table <- function(x) {
  if (!is.null(x$table))
    print(x$table)
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
  } else {
    paste0(x$rows_total, " rows total")
  }
}

format_extra_cols <- function(x) {
  if (length(x$extra) > 0) {
    var_types <- paste0(names(x$extra), " <", x$extra, ">")
    if (x$n_extra > 0) {
      if (x$n_extra < length(var_types)) {
        var_types <- c(var_types[seq_len(x$n_extra)], "...")
      }
      vars <- paste0(": ", paste(var_types, collapse = ", "))
    } else {
      vars <- ""
    }
    paste0(length(x$extra), " more variables", vars)
  }
}

#' knit_print method for trunc mat
#' @keywords internal
#' @export
knit_print.trunc_mat <- function(x, options) {
  kable <- knitr::kable(x$table, row.names = FALSE)

  if (length(x$extra) > 0) {
    var_types <- paste0(names(x$extra), " <", x$extra, ">", collapse = ", ")
    extra <- wrap("\n(_Variables not shown_: ", var_types, ")", width = x$width)
  } else {
    extra <- "\n"
  }

  res <- paste(c('', '', kable, '', extra), collapse = '\n')
  knitr::asis_output(res)
}

wrap <- function(..., indent = 0, width) {
  x <- paste0(..., collapse = "")
  wrapped <- strwrap(x, indent = indent, exdent = indent + 2,
    width = width)

  paste0(wrapped, collapse = "\n")
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

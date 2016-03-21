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
#' print(tbl_df(mtcars))
#' print(tbl_df(mtcars), n = 1)
#' print(tbl_df(mtcars), n = 3)
#' print(tbl_df(mtcars), n = 100)
#'
#' @name formatting
NULL

dim_desc <- function(x) {
  d <- dim(x)
  d2 <- big_mark(d)
  d2[is.na(d)] <- "??"

  paste0("[", paste0(d2, collapse = " x "), "]")
}

#' @export
#' @rdname formatting
#' @importFrom stats setNames
trunc_mat <- function(x, n = NULL, width = NULL, n_extra = 100) {
  rows <- nrow(x)

  if (is.null(n)) {
    if (is.na(rows) || rows > tibble_opt("print_max")) {
      n <- tibble_opt("print_min")
    } else {
      n <- rows
    }
  }

  df <- as.data.frame(head(x, n))
  var_types <- vapply(df, type_sum, character(1))
  var_names <- names(df)

  width <- tibble_width(width)
  if (ncol(df) == 0 || nrow(df) == 0) {
    shrunk <- list(table = NULL, extra = setNames(var_types, var_names))
  } else {
    shrunk <- shrink_mat(df, width, n_extra, var_names, var_types, rows, n)
  }

  return(structure(c(shrunk, list(width = width)), class = "trunc_mat"))
}

#' @importFrom stats setNames
shrink_mat <- function(df, width, n_extra, var_names, var_types, rows, n) {
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

  needs_dots <- is.na(rows) || rows > n
  if (needs_dots) {
    dot_width <- pmin(w[-1][!too_wide], 3)
    dots <- vapply(dot_width, function(i) paste(rep(".", i), collapse = ""),
      FUN.VALUE = character(1))
    shrunk <- rbind(shrunk, ".." = dots)
  }

  if (any(extra_wide)) {
    extra_wide[seq_along(too_wide)] <- too_wide
    extra <- setNames(var_types[extra_wide], var_names[extra_wide])
  } else {
    extra <- setNames(var_types[too_wide], var_names[too_wide])
  }

  if (length(extra) > n_extra) {
    more <- paste0("and ", length(extra) - n_extra, " more")
    extra <- c(extra[1:n_extra], setNames("...", more))
  }

  list(table = shrunk, extra = extra)
}

#' @export
print.trunc_mat <- function(x, ...) {
  if (!is.null(x$table)) {
    print(x$table)
  }

  if (length(x$extra) > 0) {
    var_types <- paste0(names(x$extra), " <", x$extra, ">", collapse = ", ")
    cat(wrap("Variables not shown: ", var_types, width = x$width),
        ".\n", sep = "")
  }
  invisible()
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

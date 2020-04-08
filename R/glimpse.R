#' Get a glimpse of your data
#'
#' @description
#' \lifecycle{maturing}
#'
#' `glimpse()` is like a transposed version of `print()`:
#' columns run down the page, and data runs across.
#' This makes it possible to see every column in a data frame.
#' It's a little like [str()] applied to a data frame
#' but it tries to show you as much data as possible.
#' (And it always shows the underlying data, even when applied
#' to a remote data source.)
#'
#' This generic will be moved to \pkg{pillar}, and reexported from there
#' as soon as it becomes available.
#'
#' @section S3 methods:
#' `glimpse` is an S3 generic with a customised method for `tbl`s and
#' `data.frames`, and a default method that calls [str()].
#'
#' @param x An object to glimpse at.
#' @param width Width of output: defaults to the setting of the option
#'   `tibble.width` (if finite) or the width of the console.
#' @param ... Unused, for extensibility.
#' @return x original x is (invisibly) returned, allowing `glimpse()` to be
#'   used within a data pipe line.
#' @export
#' @examples
#' glimpse(mtcars)
#'
#' if (requireNamespace("nycflights13", quietly = TRUE)) {
#'   glimpse(nycflights13::flights)
#' }
# Can be overridden in .onLoad()
glimpse <- function(x, width = NULL, ...) {
  UseMethod("glimpse")
}

#' @importFrom pillar new_pillar_title
#' @importFrom pillar new_pillar_type
# If needed, registered in .onLoad() via replace_if_pillar_has()
glimpse.tbl <- function(x, width = NULL, ...) {
  width <- tibble_glimpse_width(width)
  if (!is.finite(width)) {
    cnd_signal(error_glimpse_infinite_width())
  }

  cli::cat_line("Rows: ", big_mark(nrow(x)))

  # this is an overestimate, but shouldn't be too expensive.
  # every type needs at least three characters: "x, "
  rows <- as.integer(width / 3)
  df <- as.data.frame(head(x, rows))
  cli::cat_line("Columns: ", big_mark(ncol(df)))

  summary <- tbl_sum(x)
  brief_summary <- summary[-1]

  if (has_length(brief_summary)) {
    cat_line(names(brief_summary), ": ", brief_summary)
  }

  if (ncol(df) == 0) return(invisible(x))

  var_types <- map_chr(map(df, new_pillar_type), format)
  ticked_names <- format(new_pillar_title(tick_if_needed(names(df))))
  var_names <- paste0("$ ", justify(ticked_names, right = FALSE), " ", var_types, " ")

  data_width <- width - crayon::col_nchar(var_names) - 2
  formatted <- map_chr(df, function(x) collapse(format_v(x)))
  truncated <- str_trunc(formatted, data_width)

  cli::cat_line(var_names, truncated)
  invisible(x)
}

# If needed, registered in .onLoad() via replace_if_pillar_has()
glimpse.data.frame <- glimpse.tbl

#' @importFrom utils str
# If needed, registered in .onLoad() via replace_if_pillar_has()
glimpse.default <- function(x, width = NULL, max.level = 3, ...) {
  str(x, width = tibble_width(width), max.level = max.level, ...)
  invisible(x)
}

str_trunc <- function(x, max_width) {
  width <- nchar(x)

  nchar_ellipsis <- nchar_width(cli::symbol$ellipsis)

  for (i in seq_along(x)) {
    if (width[i] <= max_width[i]) next

    x[i] <- paste0(substr(x[i], 1, max_width[i] - nchar_ellipsis), cli::symbol$ellipsis)
  }

  x
}

format_v <- function(x) UseMethod("format_v")

#' @export
format_v.default <- function(x) {
  dims <- dim(x)

  if (!is.null(dims)){
    dims_out <- paste0(dims, collapse = " x ")
    out <- paste0("<", class(x)[[1]], "[", dims_out, "]>")
    out
  } else {
    format(x, trim = TRUE, justify = "none")
  }
}

#' @export
format_v.list <- function(x) {
  out <- map(x, format_v)
  atomic <- (map_int(out, length) == 1L)
  out <- map_chr(out, collapse)
  out[!atomic] <- paste0("<", out[!atomic], ">")
  paste0("[", collapse(out), "]")
}

#' @export
format_v.character <- function(x) encodeString(x, quote = '"')

#' @export
format_v.factor <- function(x) {
  if (any(grepl(",", x, fixed = TRUE))) {
    encodeString(as.character(x), quote = '"')
  } else {
    format(x, trim = TRUE, justify = "none")
  }
}

# Errors ------------------------------------------------------------------

error_glimpse_infinite_width <- function() {
  tibble_error("`width` must be finite.")
}

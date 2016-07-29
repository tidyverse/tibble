#' Construct a nibble() call from a data frame
#'
#' For a given data frame, this function constructs a call to
#' \code{\link{nibble}} that, if evaluated, creates the same data frame.
#' A warning is given if the number of rows in the input data frame is too large.
#'
#' @param x A tibble
#' @param max_rows Maximum number of rows to be gathered
#'
#' @export
something <- function(x, max_rows = 10) {
  can_do <- vapply(x, can_something, logical(1))
  if (!all(can_do)) {
    stopc("Can't do something on x because of columns ", format_n(names(x)[!can_do]))
  }

  if (nrow(x) > max_rows) {
    warningc("Using first ", max_rows, " rows, set argument max_rows to increase.")
    x <- x[seq_len(max_rows), ]
  }

  headers <- paste0("~", tickit(names(x)), collapse = ", ")
  rows <- lapply(
    seq_len(nrow(x)),
    function(i) {
      paste(x[i,], collapse = ", ")
    }
  )

  text <- paste(
    "nibble(",
    paste0("  ", c(headers, unlist(rows)), collapse = ",\n"),
    ")",
    sep = "\n"
  )
  parsed <- parse(text = text, keep.source = TRUE)
  single <- parsed[[1]]
  attributes(single) <- attributes(parsed)
  single
}

#' @export
can_something <- function(x) UseMethod("can_something")

#' @export
can_something.default <- function(x) FALSE

#' @export
can_something.numeric <- function(x) TRUE

#' @export
can_something.character <- function(x) TRUE

#' @export
can_something.factor <- function(x) TRUE

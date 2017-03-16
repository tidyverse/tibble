#' Write a tibble or data.frame to a file or the screen as a call to tribble
#'
#' `tribble()` creates [tibble]s using an easier to read row-by-row layout.
#' `dput_tribble()` writes to the screen or a file the appropriate call to
#' `tribble()` to recreate an existing `tibble` or `data.frame`.
#' Please see \link{tibble-package} for a general introduction.
#'
#' `dput_tribble` currently handles character, factor, integer, numeric,
#' logical and list column types.
#'
#' @param x a `tibble` or other `data.frame`
#' @param file either a character string naming a file or a connection.
#'   "" indicates output to the console
#'
#' @return the first argument invisibly.
#' @export
#'
#' @examples
#' dput_tribble(iris)
dput_tribble <- function(x, file = "") {

  stopifnot(is.data.frame(x))
  cols <- lapply(x, function(col) {
    if (inherits(col, c("factor", "character"))) {
      paste0("\"", col, "\"")
    } else if (inherits(col, c("logical", "numeric", "integer"))) {
      col
    } else {
      lapply(col, dput_to_var)
    }
  })
  rows <- c(paste(sprintf("~%s", names(x)), collapse = ", "),
            do.call(paste, c(cols, sep = ", ")))
  rows[-length(rows)] <- paste0(rows[-length(rows)], ",")
  out <- c("tibble::tribble(", rows, ")")
  if (is.character(file)) {
    if (nzchar(file)) {
      file <- file(file, "wt")
      on.exit(close(file))
    } else {
      file <- stdout()
    }
  }
  writeLines(out, file)
  invisible(x)
}

dput_to_var <- function(x) {
  out <- "" # Put in because of R CMD check not identifying assignment of out
  con <- textConnection("out", "w", local = TRUE)
  dput(x, con)
  close(con)
  paste(out, collapse = "")
}

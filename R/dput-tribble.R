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
    switch(class(col),
           factor =, character = paste0("\"", col, "\""),
           logical =, numeric =, integer = col,
           list = lapply(col, dput_to_var)
           )
  })
  meat <- c(paste(sprintf("~%s", names(x)), collapse = ", "),
            do.call(paste, c(cols, sep = ", ")))
  out <- paste0("tibble::tribble(\n", paste(meat, collapse = ",\n"), ")")
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
  con <- textConnection("out", "w", local = TRUE)
  dput(x, con)
  close(con)
  paste(out, collapse = "")
}

#' Build a list
#'
#' `lst()` is similar to [list()], but like `tibble()`, it
#' evaluates its arguments lazily and in order, and automatically adds names.
#'
#' @export
lst <- function(...) {
  lst_(lazyeval::lazy_dots(...))
}

#' @export
#' @rdname lst
lst_ <- function(xs) {
  n <- length(xs)
  if (n == 0) return(list())

  # If named not supplied, used deparsed expression
  col_names <- names2(xs)
  missing_names <- col_names == ""
  if (any(missing_names)) {
    deparse2 <- function(x) paste(deparse(x$expr, 500L), collapse = "")
    defaults <- vapply(xs[missing_names], deparse2, character(1),
      USE.NAMES = FALSE)
    col_names[missing_names] <- defaults
  }

  # Evaluate each column in turn
  output <- vector("list", n)
  names(output) <- character(n)

  for (i in seq_len(n)) {
    res <- lazyeval::lazy_eval(xs[[i]], output)
    if (!is.null(res)) {
      output[[i]] <-  res
    }
    names(output)[i] <- col_names[[i]]
  }

  output
}

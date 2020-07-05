#' Build a list
#'
#' `lst()` is similar to [list()], but like `tibble()`, it
#' evaluates its arguments lazily and in order, and automatically adds names.
#'
#' @export
#' @examples
#' lst(n = 5, x = runif(n))
#'
#' # You can splice-unquote a list of quotes and formulas
#' lst(!!! list(n = rlang::quo(2 + 3), y = quote(runif(n))))
#'
#' @export
#' @rdname tibble
lst <- function(...) {
  xs <- quos(..., .named = 500L)

  n <- length(xs)
  if (n == 0) {
    return(list())
  }

  # Evaluate each column in turn
  col_names <- names2(xs)
  output <- list_len(n)
  names(output) <- character(n)

  for (i in seq_len(n)) {
    res <- eval_tidy(xs[[i]], output)
    if (!is_null(res)) {
      output[[i]] <-  res
    }
    names(output)[i] <- col_names[[i]]
  }

  output
}

discard_unnamed <- function(x) {
  discard(x, names2(x) == "")
}

#' @export
#' @rdname tibble
lst_ <- function(xs) {
  xs <- compat_lazy_dots(xs, caller_env())
  lst(!!! xs)
}

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
  lst_quos(xs)
}

lst_quos <- function(xs, expand = FALSE) {
  n <- length(xs)
  if (n == 0) {
    return(list())
  }

  # Evaluate each column in turn
  col_names <- names2(xs)
  output <- list_len(n)
  names(output) <- character(n)

  for (i in seq_len(n)) {
    unique_output <- output[!duplicated(names(output)[seq_len(i)], fromLast = TRUE)]
    res <- eval_tidy(xs[[i]], unique_output)
    if (!is_null(res)) {
      output[[i]] <-  res
      if (expand) output <- expand_lst(output, i)
    }
    names(output)[i] <- col_names[[i]]
  }

  output
}

expand_lst <- function(output, i) {
  idx_to_fix <- integer()
  if (i > 1L) {
    if (length(output[[i]]) == 1L && length(output[[1L]]) != 1L) {
      idx_to_fix <- i
      idx_boilerplate <- 1L
    } else if (length(output[[i]]) != 1L && all(map(output[seq2(1L, i - 1L)], length) == 1L)) {
      idx_to_fix <- seq2(1L, i - 1L)
      idx_boilerplate <- i
    }
  }

  if (length(idx_to_fix) > 0L) {
    ones <- rep(1L, length(output[[idx_boilerplate]]))
    output[idx_to_fix] <- map(output[idx_to_fix], `[`, ones)
  }

  output
}

#' @export
#' @rdname tibble
lst_ <- function(xs) {
  xs <- compat_lazy_dots(xs, caller_env())
  lst(!!! xs)
}

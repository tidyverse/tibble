#' Build a list
#'
#' @description
#' \Sexpr[results=rd, stage=render]{tibble:::lifecycle("questioning")}
#'
#' `lst()` constructs a list, similar to [base::list()], but with some of the
#' same features as [tibble()]. `lst()` builds components sequentially. When
#' defining a component, you can refer to components created earlier in the
#' call. `lst()` also generates missing names automatically.
#'
#' @section Life cycle:
#' The `lst()` function is in the [questioning
#' stage](https://www.tidyverse.org/lifecycle/#questioning). It is essentially
#' [rlang::list2()], but with a couple features copied from [tibble()]. It's not
#' clear that a function for creating lists belongs in the tibble package.
#' Consider using [rlang::list2()] instead.
#'
#' @inheritParams tibble
#' @return A named list.
#' @export
#' @examples
#' # the value of n can be used immediately in the definition of x
#' lst(n = 5, x = runif(n))
#'
#' # missing names are constructed from user's input
#' lst(1:3, z = letters[4:6], runif(3))
#'
#' a <- 1:3
#' b <- letters[4:6]
#' lst(a, b)
#'
#' # pre-formed quoted expressions can be used with lst() and then
#' # unquoted (with !!) or unquoted and spliced (with !!!)
#' n1 <- 2
#' n2 <- 3
#' n_stuff <- quote(n1 + n2)
#' x_stuff <- quote(seq_len(n))
#' lst(!!!list(n = n_stuff, x = x_stuff))
#' lst(n = !!n_stuff, x = !!x_stuff)
#' lst(n = 4, x = !!x_stuff)
#' lst(!!!list(n = 2, x = x_stuff))
lst <- function(...) {
  xs <- quos(..., .named = TRUE)
  lst_quos(xs)
}

lst_quos <- function(xs, expand = FALSE) {
  n <- length(xs)
  if (n == 0) {
    return(list())
  }

  # Evaluate each column in turn
  col_names <- names2(xs)
  output <- new_list(n)
  names(output) <- character(n)
  result <- output

  for (i in seq_len(n)) {
    unique_output <- output[!duplicated(names(output)[seq_len(i)], fromLast = TRUE)]
    res <- eval_tidy(xs[[i]], unique_output)
    if (!is_null(res)) {
      result[[i]] <- res
      output[[i]] <- res
      if (expand) output <- expand_lst(output, i)
    }
    names(output)[i] <- col_names[[i]]
  }

  set_names(result, names(output))
}

expand_lst <- function(output, i) {
  idx_to_fix <- integer()
  if (i > 1L) {
    if (NROW(output[[i]]) == 1L && NROW(output[[1L]]) != 1L) {
      idx_to_fix <- i
      idx_boilerplate <- 1L
    } else if (NROW(output[[i]]) != 1L && NROW(output[[1L]]) == 1L) {
      idx_to_fix <- seq2(1L, i - 1L)
      idx_boilerplate <- i
    }
  }

  if (length(idx_to_fix) > 0L) {
    output[idx_to_fix] <- expand_vecs(output[idx_to_fix], length(output[[idx_boilerplate]]))
  }

  output
}

expand_vecs <- function(x, length) {
  ones <- rep(1L, length)
  map(x, `[`, ones)
}

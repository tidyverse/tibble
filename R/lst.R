#' Build a list
#'
#' @description
#' `lst()` constructs a list, similar to [base::list()], but with some of the
#' same features as [tibble()]. `lst()` builds components sequentially. When
#' defining a component, you can refer to components created earlier in the
#' call. `lst()` also generates missing names automatically.
#'
#' See [rlang::list2()] for a simpler and faster alternative without tibble's
#' evaluation and auto-name semantics.
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

lst_quos <- function(xs) {
  # TODO:
  # - soft-deprecate lst()

  # Evaluate each column in turn
  col_names <- names2(xs)
  lengths <- rep_along(xs, 0L)

  output <- rep_named(rep_along(xs, ""), list(NULL))

  for (i in seq_along(xs)) {
    unique_output <- output[!duplicated(names(output)[seq_len(i)], fromLast = TRUE)]
    res <- eval_tidy(xs[[i]], unique_output)
    if (!is.null(res)) {
      lengths[[i]] <- NROW(res)
      output[[i]] <- res
    }
    names(output)[[i]] <- col_names[[i]]
  }

  output
}

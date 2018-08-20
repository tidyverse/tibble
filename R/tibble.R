#' Build a data frame or list
#'
#' @description
#' `tibble()` is a trimmed down version of [data.frame()] that:
#'
#' * Never coerces inputs (i.e. strings stay as strings!).
#' * Never adds `row.names`.
#' * Never munges column names.
#' * Only recycles length 1 inputs.
#' * Evaluates its arguments lazily and in order.
#' * Adds `tbl_df` class to output.
#' * Automatically adds column names.
#'
#' `data_frame()` is an alias to `tibble()`.
#'
#' `tibble_()` and its alias `data_frame_()` use lazy evaluation and are
#' deprecated. New code should use `tibble()` or `data_frame()` with
#' [quasiquotation].
#'
#' @param ... A set of name-value pairs. Arguments are evaluated sequentially,
#'   so you can refer to previously created variables.  These arguments are
#'   processed with [rlang::quos()] and support unquote via `!!` and
#'   unquote-splice via [`!!!`].
#' @param .rows The number of rows, useful to create a 0-column tibble or
#'   just as an additional check.
#' @param .tidy_names Treatment of invalid or duplicate column names:
#'   - `NULL`: default, throw an error if there are any missing or duplicated names,
#'   - `FALSE`: deliberately request a tibble with invalid names,
#'   - `TRUE`: apply [tidy_names()] to the names,
#'   - a function: apply custom name repair (e.g., `.tidy_names = make.names`
#'     to get base R equivalence).
#' @seealso [as_tibble()] to turn an existing list into
#'   a data frame.
#' @export
#' @examples
#' a <- 1:5
#' tibble(a, b = a * 2)
#' tibble(a, b = a * 2, c = 1)
#' tibble(x = runif(10), y = x * 2)
#'
#' lst(n = 5, x = runif(n))
#'
#' # tibble never coerces its inputs
#' str(tibble(letters))
#' str(tibble(x = list(diag(1), diag(2))))
#'
#' # or munges column names
#' tibble(`a + b` = 1:5)
#'
#' # You can splice-unquote a list of quotes and formulas
#' tibble(!!!list(x = rlang::quo(1:10), y = quote(x * 2)))
#'
#' # data frames can only contain 1d atomic vectors and lists
#' # and can not contain POSIXlt
#' \dontrun{
#' tibble(x = tibble(1, 2, 3))
#' tibble(y = strptime("2000/01/01", "%x"))
#' }
#' @aliases tbl_df-class
tibble <- function(..., .rows = NULL, .tidy_names = NULL) {
  xs <- quos(..., .named = TRUE)
  as_tibble(lst_quos(xs, expand = TRUE), .rows = .rows, .tidy_names = .tidy_names)
}

#' @export
#' @usage NULL
#' @rdname tibble
tibble_ <- function(xs) {
  xs <- compat_lazy_dots(xs, caller_env())
  tibble(!!!xs)
}

#' @export
#' @rdname tibble
data_frame <- tibble

#' @export
#' @rdname tibble
#' @usage NULL
data_frame_ <- tibble_


#' Test if the object is a tibble
#'
#' This function returns `FALSE` for regular data frames and `TRUE` for tibbles.
#'
#' @param x An object
#' @return `TRUE` if the object inherits from the `tbl_df` class.
#' @export
is_tibble <- function(x) {
  "tbl_df" %in% class(x)
}

#' @rdname is_tibble
#' @usage NULL
#' @export
is.tibble <- is_tibble

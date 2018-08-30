#' Build a data frame or list
#'
#' @description
#' `tibble()` is a trimmed down version of [data.frame()] that:
#'
#' * Never coerces inputs (i.e. strings stay as strings!).
#' * Never adds `row.names`.
#' * Only recycles length 1 inputs.
#' * Automatically adds column names.
#' * Doesn't munge column names by default.
#' * Evaluates its arguments lazily and in order.
#' * Adds `tbl_df` class to output.
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
#' @param .name_repair Treatment of problematic column names:
#'   - `"none"`: Do nothing: no name repair, no name checking,
#'   - `"unique"`: Make sure names are unique and not empty,
#'   - `"assert_unique"`: (default value), do not repair the names, but check they are `unique`,
#'   - `"syntactic"`: Make the names `unique` and syntactic
#'   - a function: apply custom name repair (e.g., `.name_repair = make.names`
#'   for names in the style of base R).
#'
#'   See [name-repair] for more details on these terms and the strategies used
#'   to enforce them.
#'
#' @seealso [as_tibble()] to turn an existing list into a data frame,
#'   [name-repair] for more detail on name repair.
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
#' # but it forces you to take charge of names, if they need repair
#' \dontrun{
#' tibble(x = 1, x = 2)
#' }
#' tibble(x = 1, x = 2, .name_repair = "unique")
#' tibble(x = 1, x = 2, .name_repair = "none")
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
tibble <- function(...,
                   .rows = NULL,
                   .name_repair = c("assert_unique", "unique", "syntactic", "none")) {
  xs <- quos(..., .named = TRUE)
  as_tibble(lst_quos(xs, expand = TRUE), .rows = .rows, .name_repair = .name_repair)
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

#' Build a data frame
#'
#' @description
#' `tibble()` is a trimmed down version of [data.frame()] that:
#'
#' * Never coerces inputs (i.e. strings stay as strings!).
#' * Never adds `row.names`.
#' * Only recycles length 1 inputs.
#' * Automatically adds column names.
#' * Doesn't munge column names.
#' * Evaluates its arguments lazily and in order.
#' * Adds `tbl_df` class to output.
#'
#' @param ... A set of name-value pairs. Arguments are evaluated sequentially,
#'   so you can refer to previously created elements. These arguments are
#'   processed with [rlang::quos()] and support unquote via `!!` and
#'   unquote-splice via [`!!!`].
#' @param .rows The number of rows, useful to create a 0-column tibble or
#'   just as an additional check.
#' @param .name_repair Treatment of problematic column names:
#'   - `"minimal"`: No name repair or checks, beyond basic existence,
#'   - `"unique"`: Make sure names are unique and not empty,
#'   - `"check_unique"`: (default value), no name repair, but check they are `unique`,
#'   - `"syntactic"`: Make the names `unique` and syntactic
#'   - a function: apply custom name repair (e.g., `.name_repair = make.names`
#'   for names in the style of base R).
#'   - A purrr-style anonymous function, see [as_function()]
#'
#'   See [name-repair] for more details on these terms and the strategies used
#'   to enforce them.
#'
#' @seealso [as_tibble()] to turn an existing list into a data frame,
#'   [name-repair] for more detail on name repair.
#' @export
#' @examples
#' # Unnamed arguments are named with their expression:
#' a <- 1:5
#' tibble(a, a * 2)
#'
#' # Scalars (vectors of length one) are recycled:
#' tibble(a, b = a * 2, c = 1)
#'
#' # Columns are available in subsequent expressions:
#' tibble(x = runif(10), y = x * 2)
#'
#' # tibble() never coerces its inputs,
#' str(tibble(letters))
#' str(tibble(x = list(diag(1), diag(2))))
#'
#' # or munges column names (unless requested),
#' tibble(`a + b` = 1:5)
#'
#' # but it forces you to take charge of names, if they need repair:
#' try(tibble(x = 1, x = 2))
#' tibble(x = 1, x = 2, .name_repair = "unique")
#' tibble(x = 1, x = 2, .name_repair = "minimal")
#'
#' ## By default, non-syntactic names are allowed,
#' df <- tibble(`a 1` = 1, `a 2` = 2)
#' ## because you can still index by name:
#' df[["a 1"]]
#' df$`a 1`
#' with(df, `a 1`)
#'
#' ## Syntactic names are easier to work with, though, and you can request them:
#' df <- tibble(`a 1` = 1, `a 2` = 2, .name_repair = "syntactic")
#' df$a.1
#'
#' ## You can specify your own name repair function:
#' tibble(x = 1, x = 2, .name_repair = make.unique)
#'
#' tibble(x = 1, x = 2, .name_repair = ~make.names(., unique = TRUE))
#'
#' fix_names <- function(x) gsub("\\s+", "_", x)
#' tibble(`year 1` = 1, `year 2` = 2, .name_repair = fix_names)
#'
#' # Tibbles can contain columns that are tibbles or matrices
#' # if the number of rows is consistent:
#' tibble(
#'   a = 1:3,
#'   b = tibble(
#'     c = 4:6,
#'     d = 7:9
#'   ),
#'   e = tibble(
#'     f = tibble(
#'       g = letters[1:3]
#'     )
#'   )
#' )
#' tibble(
#'   a = 1:4,
#'   b = diag(4),
#'   c = cov(iris[1:4])
#' )
#'
#' # data can not contain POSIXlt columns, or tibbles or matrices
#' # with inconsistent number of rows:
#' try(tibble(y = strptime("2000/01/01", "%x")))
#' try(tibble(a = 1:3, b = tibble(c = 4:7)))
#'
#' # You can splice-unquote a list of quosures and expressions:
#' tibble(!!!list(x = rlang::quo(1:10), y = quote(x * 2)))
#'
#' @aliases tbl_df-class
tibble <- function(...,
                   .rows = NULL,
                   .name_repair = c("check_unique", "unique", "syntactic", "minimal")) {
  xs <- quos(..., .named = TRUE)
  as_tibble(lst_quos(xs, expand = TRUE), .rows = .rows, .name_repair = .name_repair)
}

#' Test if the object is a tibble
#'
#' This function returns `FALSE` for regular data frames and `TRUE` for tibbles.
#'
#' @param x An object
#' @return `TRUE` if the object inherits from the `tbl_df` class.
#' @export
is_tibble <- function(x) {
  inherits(x, "tbl_df")
}

#' @rdname is_tibble
#' @usage NULL
#' @export
is.tibble <- is_tibble

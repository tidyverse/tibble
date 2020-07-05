#' Build a data frame
#'
#' @description
#'
#' `tibble()` constructs a data frame. It is used like [base::data.frame()], but
#' with a couple notable differences:
#'
#'   * The returned data frame has the class [`tbl_df`][tbl_df-class], in
#'     addition to `data.frame`. This allows so-called "tibbles" to exhibit some
#'     special behaviour, such as [enhanced printing][formatting]. Tibbles are
#'     fully described in [`tbl_df`][tbl_df-class].
#'   * `tibble()` is much lazier than [base::data.frame()] in terms of
#'     transforming the user's input. Character vectors are not coerced to
#'     factor. List-columns are expressly anticipated and do not require special
#'     tricks. Column names are not modified.
#'   * `tibble()` builds columns sequentially. When defining a column, you can
#'     refer to columns created earlier in the call. Only columns of length one
#'     are recycled.
#'
#' @param ... A set of name-value pairs. Arguments are evaluated sequentially,
#'   so you can refer to previously created elements. These arguments are
#'   processed with [rlang::quos()] and support unquote via [`!!`] and
#'   unquote-splice via [`!!!`]. Use `:=` to create columns that start with a dot.
#' @param .rows The number of rows, useful to create a 0-column tibble or
#'   just as an additional check.
#' @param .name_repair Treatment of problematic column names:
#'   * `"minimal"`: No name repair or checks, beyond basic existence,
#'   * `"unique"`: Make sure names are unique and not empty,
#'   * `"check_unique"`: (default value), no name repair, but check they are
#'     `unique`,
#'   * `"universal"`: Make the names `unique` and syntactic
#'   * a function: apply custom name repair (e.g., `.name_repair = make.names`
#'     for names in the style of base R).
#'   * A purrr-style anonymous function, see [rlang::as_function()]
#'
#'   See [name-repair] for more details on these terms and the strategies used
#'   to enforce them.
#'
#' @return A tibble, which is a colloquial term for an object of class
#'   [`tbl_df`][tbl_df-class]. A [`tbl_df`][tbl_df-class] object is also a data
#'   frame, i.e. it has class `data.frame`.
#' @seealso Use [as_tibble()] to turn an existing object into a tibble. Use
#'   `enframe()` to convert a named vector into tibble. Name repair is detailed
#'   in [name-repair]. [rlang::list2()] provides more details on tidy dots
#'   semantics, i.e. exactly how [quasiquotation] works for the `...` argument.
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
#' df <- tibble(`a 1` = 1, `a 2` = 2, .name_repair = "universal")
#' df$a.1
#'
#' ## You can specify your own name repair function:
#' tibble(x = 1, x = 2, .name_repair = make.unique)
#'
#' fix_names <- function(x) gsub("\\s+", "_", x)
#' tibble(`year 1` = 1, `year 2` = 2, .name_repair = fix_names)
#'
#' ## purrr-style anonymous functions and constants
#' ## are also supported
#' tibble(x = 1, x = 2, .name_repair = ~ make.names(., unique = TRUE))
#'
#' tibble(x = 1, x = 2, .name_repair = ~ c("a", "b"))
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
#' # Use := to create columns with names that start with a dot:
#' tibble(.rows = 3)
#' tibble(.rows := 3)
#'
#' # You can unquote an expression:
#' x <- 3
#' tibble(x = 1, y = x)
#' tibble(x = 1, y = !!x)
#'
#' # You can splice-unquote a list of quosures and expressions:
#' tibble(!!!list(x = rlang::quo(1:10), y = quote(x * 2)))
#'
tibble <- function(...,
                   .rows = NULL,
                   .name_repair = c("check_unique", "unique", "universal", "minimal")) {
  xs <- quos(..., .named = TRUE)
  xlq <- lst_quos(xs, transform = expand_lst)
  lst_to_tibble(xlq$output, .rows, .name_repair, lengths = xlq$lengths)
}

#' Test if the object is a tibble
#'
#' This function returns `TRUE` for tibbles or subclasses thereof,
#' and `FALSE` for all other objects, including regular data frames.
#'
#' @param x An object
#' @return `TRUE` if the object inherits from the `tbl_df` class.
#' @export
is_tibble <- function(x) {
  inherits(x, "tbl_df")
}

#' Deprecated test for tibble-ness
#'
#' @description
#' \Sexpr[results=rd, stage=render]{tibble:::lifecycle("soft-deprecated")}
#'
#' Please use [is_tibble()] instead.
#'
#' @inheritParams is_tibble
#' @export
#' @keywords internal
is.tibble <- function(x) {
  signal_soft_deprecated("`is.tibble()` is deprecated, use `is_tibble()`.")

  is_tibble(x)
}

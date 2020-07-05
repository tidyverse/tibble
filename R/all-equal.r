#' Flexible equality comparison for data frames.
#'
#' When comparing two `tbl_df` using [all.equal()], column and
#' row order is ignored by default, and types are not coerced.  The `dplyr`
#' package is necessary to use this function.
#'
#' @param target,current Two data frames to compare.
#' @param ignore_col_order Should order of columns be ignored?
#' @param ignore_row_order Should order of rows be ignored?
#' @param convert Should similar classes be converted? Currently this will
#'   convert factor to character and integer to double.
#' @param ... Ignored. Needed for compatibility with `all.equal()`.
#' @return `TRUE` if equal, otherwise a character vector describing
#'   the reasons why they're not equal. Use [isTRUE()] if using the
#'   result in an `if` expression.
#' @examples
#' scramble <- function(x) x[sample(nrow(x)), sample(ncol(x))]
#' mtcars_df <- as_tibble(mtcars)
#'
#' # By default, ordering of rows and columns ignored
#' all.equal(mtcars_df, scramble(mtcars_df))
#'
#' # But those can be overriden if desired
#' all.equal(mtcars_df, scramble(mtcars_df), ignore_col_order = FALSE)
#' all.equal(mtcars_df, scramble(mtcars_df), ignore_row_order = FALSE)
#'
#' # By default all.equal is sensitive to variable differences
#' df1 <- tibble(x = "a")
#' df2 <- tibble(x = factor("a"))
#' all.equal(df1, df2)
#' # But you can request to convert similar types
#' all.equal(df1, df2, convert = TRUE)
all_equal <- function(target, current, ignore_col_order = TRUE,
                      ignore_row_order = TRUE, convert = FALSE, ...) {
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    stop("Please install dplyr to use all_equal()", call. = FALSE)
  }

  dplyr_all_equal <- get(
    "all.equal.tbl_df", asNamespace("dplyr"), mode = "function",
    inherits = FALSE)
  stopifnot(getNamespaceName(environment(dplyr_all_equal)) == "dplyr")

  dplyr_all_equal(
    target = target, current = current, ignore_col_order = ignore_col_order,
    ignore_row_order = ignore_row_order, convert = convert, ...)
}

#' @export
#' @rdname all_equal
#' @method all.equal tbl_df
all.equal.tbl_df <- function(target, current, ...) {
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    warning("Please install dplyr to use all.equal() on tibbles", call. = FALSE)
    return(NextMethod())
  }

  all_equal(target, current, ...)
}

#' @importFrom methods setOldClass
#' @exportClass tbl_df
setOldClass(c("tbl_df", "tbl", "data.frame"))

#' `tbl_df` class
#'
#' @description
#' The `tbl_df` class is a subclass of [`data.frame`][base::data.frame()],
#' created in order to have different default behaviour. The colloquial term
#' "tibble" refers to a data frame that has the `tbl_df` class. Tibble is the
#' central data structure for the set of packages known as the
#' [tidyverse](https://www.tidyverse.org/packages/), including
#' [dplyr](http://dplyr.tidyverse.org/),
#' [ggplot2](http://ggplot2.tidyverse.org/),
#' [tidyr](http://tidyr.tidyverse.org/), and
#' [readr](http://readr.tidyverse.org/).
#'
#' The general ethos is that tibbles are lazy and surly: they do less and
#' complain more than base [`data.frame`s][base::data.frame()]. This forces
#' problems to be tackled earlier and more explicitly, typically leading to code
#' that is more expressive and robust.
#'
#' @section Properties of `tbl_df`:
#'
#' Objects of class `tbl_df` have:
#' * A `class` attribute of `c("tbl_df", "tbl", "data.frame")`.
#' * A base type of `"list"`, where each element of the list has the same
#'   [NROW()].
#' * A `names` attribute that is a character vector the same length as the
#'   underlying list.
#' * A `row.names` attribute, included for compatibility with the base
#'   [`data.frame` class][base::data.frame()]. However, `row.names` are ignored
#'   by most tibble methods.
#'
#' @section Behavior of `tbl_df`:
#'
#' How default behaviour of tibbles differs from that of
#' [`data.frame`s][base::data.frame()], during creation, access, and
#' modification:
#'
#' * Column data is not coerced. A character vector is not turned into a factor.
#' * Column names are not munged, although missing names are auto-populated.
#'   Empty and duplicated column names are strongly discouraged, but the user
#'   must indicate how to resolve. Read more in [name-repair].
#' * Row names are not added and are strongly discouraged, in favor of storing
#'   that info as a column. Read about in [rownames].
#' * Recycling only happens for a length 1 input.
#' * `df[, j]` returns a tibble; it does not automatically extract the column
#'   inside. `df[, j, drop = FALSE]` is the default.
#' * List-columns are expressly anticipated and do not require special tricks.
#' * There is no partial matching when `$` is used to index by name. `df$name`
#'   for a nonexistent name generates a warning.
#' * Printing and inspection are a very high priority. The goal is to convey as
#'   much information as possible, in a concise way, even for large and complex
#'   tibbles. Read more in [formatting].
#'
#' @name tbl_df-class
#' @aliases tbl_df tbl_df-class
#' @seealso [tibble()], [as_tibble()], [tribble()], [print.tbl_df()],
#'   [glimpse()]
NULL

# Standard data frame methods --------------------------------------------------

#' @export
as.data.frame.tbl_df <- function(x, row.names = NULL, optional = FALSE, ...) {
  class(x) <- "data.frame"
  x
}

#' @export
`names<-.tbl_df` <- function(x, value) {
  check_names_non_null(value)

  if (!has_length(value, length(x))) {
    abort(error_names_must_have_length(length(value), length(x)))
  }

  check_names_non_na(value)

  attr(x, "names") <- as.character(value)
  x
}

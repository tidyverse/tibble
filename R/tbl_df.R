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
#' [dplyr](https://dplyr.tidyverse.org/),
#' [ggplot2](https://ggplot2.tidyverse.org/),
#' [tidyr](https://tidyr.tidyverse.org/), and
#' [readr](https://readr.tidyverse.org/).
#'
#' The general ethos is that tibbles are lazy and surly: they do less and
#' complain more than base [data.frame]s. This forces
#' problems to be tackled earlier and more explicitly, typically leading to code
#' that is more expressive and robust.
#'
#' @section Properties of `tbl_df`:
#'
#' Objects of class `tbl_df` have:
#' * A `class` attribute of `c("tbl_df", "tbl", "data.frame")`.
#' * A base type of `"list"`, where each element of the list has the same
#'   [vctrs::vec_size()].
#' * A `names` attribute that is a character vector the same length as the
#'   underlying list.
#' * A `row.names` attribute, included for compatibility with [data.frame].
#'   This attribute is only consulted to query the number of rows,
#'   any row names that might be stored there are ignored
#'   by most tibble methods.
#'
#' @section Behavior of `tbl_df`:
#'
#' How default behaviour of tibbles differs from that of
#' [data.frame]s, during creation and access:
#'
#' * Column data is not coerced. A character vector is not turned into a factor.
#'   List-columns are expressly anticipated and do not require special tricks.
#'   Internal names are never stripped from column data.
#'   Read more in [tibble()].
#' * Recycling only happens for a length 1 input.
#'   Read more in [vctrs::vec_recycle()].
#' * Column names are not munged, although missing names are auto-populated.
#'   Empty and duplicated column names are strongly discouraged, but the user
#'   must indicate how to resolve. Read more in [vctrs::vec_as_names()].
#' * Row names are not added and are strongly discouraged, in favor of storing
#'   that info as a column. Read about in [rownames].
#' * `df[, j]` returns a tibble; it does not automatically extract the column
#'   inside. `df[, j, drop = FALSE]` is the default. Read more in [subsetting].
#' * There is no partial matching when `$` is used to index by name. `df$name`
#'   for a nonexistent name generates a warning. Read more in [subsetting].
#'
#' See `vignette("invariants")` for a detailed description of the behavior.
#'
#' Furthermore, printing and inspection are a very high priority.
#' The goal is to convey as much information as possible, in a concise way,
#' even for large and complex tibbles. Read more in [formatting].
#'
#' @name tbl_df-class
#' @aliases tbl_df tbl_df-class
#' @seealso [tibble()], [as_tibble()], [tribble()], [print.tbl()],
#'   [glimpse()]
NULL

# Standard data frame methods --------------------------------------------------

#' @export
as.data.frame.tbl_df <- function(x, row.names = NULL, optional = FALSE, ...) {
  class(x) <- tibble_class
  unname <- which(!map_lgl(x, is_bare_list))
  x[unname] <- map(.subset(x, unname), vectbl_set_names, NULL)
  class(x) <- "data.frame"
  x
}

#' @export
`names<-.tbl_df` <- function(x, value) {
  # workaround for RStudio v1.1, which relies on the ability to set
  # data.frame names to NULL
  if (is.null(value) && is_rstudio()) {
    attr(x, "names") <- NULL
    return(x)
  }

  if (is.null(value)) {
    deprecate_soft("3.0.0", "tibble::`names<-`(value = 'can\\'t be NULL')")

    # FIXME: value <- rep("", length(x))
  }

  if (!has_length(value, length(x))) {
    deprecate_soft(
      "3.0.0",
      "tibble::`names<-`(value = 'must have the same length as `x`')"
    )

    # FIXME: Reset NA to "" in names

    if (length(value) < length(x)) {
      value <- c(value, rep(NA_character_, length(x) - length(value)))
    } else {
      length(value) <- length(x)
    }
  }

  if (anyNA(value)) {
    deprecate_soft("3.0.0", "tibble::`names<-`(value = 'can\\'t be empty')")

    # FIXME: Reset NA to "" in names
  }

  if (!is_character(value)) {
    deprecate_soft(
      "3.0.0",
      "tibble::`names<-`(value = 'must be a character vector')"
    )
    value <- as.character(value)
  }

  attr(x, "names") <- as.character(value)
  x
}

# Errors ------------------------------------------------------------------

msg_names_must_be_non_null <- function() {
  "`names` must not be `NULL`."
}

msg_names_must_have_length <- function(length, n) {
  paste0("`names` must have length ", n, ", not ", length, ".")
}

abort_names_must_be_non_null <- function(call = caller_env()) {
  tibble_abort(call = call, msg_names_must_be_non_null())
}

abort_names_must_have_length <- function(length, n, call = caller_env()) {
  tibble_abort(
    call = call,
    msg_names_must_have_length(length, n),
    expected = n,
    actual = length
  )
}

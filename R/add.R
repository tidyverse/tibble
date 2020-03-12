#' Add rows to a data frame
#'
#' @description
#' \lifecycle{questioning}
#'
#' This is a convenient way to add one or more rows of data to an existing data
#' frame. See [tribble()] for an easy way to create an complete
#' data frame row-by-row.
#'
#' `add_case()` is an alias of `add_row()`.
#'
#' @section Life cycle:
#' It is unclear if `add_row()` and its alias `add_cases()` should ensure
#' that all columns have length one by wrapping in a list if necessary.
#' See <https://github.com/tidyverse/tibble/pull/503> and
#' <https://github.com/tidyverse/tibble/issues/205> for details.
#'
#' @param .data Data frame to append to.
#' @param ... <[`dynamic-dots`][rlang::dyn-dots]>
#'   Name-value pairs, passed on to [tibble()]. Values can be defined
#'   only for columns that already exist in `.data` and unset columns will get an
#'   `NA` value. These arguments are passed on to [tibble()], and therefore also
#'   support unquote via `!!` and unquote-splice via `!!!`.
#' @param .before,.after One-based row index where to add the new rows,
#'   default: after last row.
#' @family addition
#' @examples
#' # add_row ---------------------------------
#' df <- tibble(x = 1:3, y = 3:1)
#'
#' add_row(df, x = 4, y = 0)
#'
#' # You can specify where to add the new rows
#' add_row(df, x = 4, y = 0, .before = 2)
#'
#' # You can supply vectors, to add multiple rows (this isn't
#' # recommended because it's a bit hard to read)
#' add_row(df, x = 4:5, y = 0:-1)
#'
#' # Absent variables get missing values
#' add_row(df, x = 4)
#'
#' # You can't create new variables
#' \dontrun{
#' add_row(df, z = 10)
#' }
#' @export
add_row <- function(.data, ..., .before = NULL, .after = NULL) {
  if (inherits(.data, "grouped_df")) {
    abort(error_add_rows_to_grouped_df())
  }

  if (!is.data.frame(.data)) {
    deprecate_warn("2.1.1", "add_row(.data = 'must be a data frame')")
  }

  df <- tibble(...)
  attr(df, "row.names") <- .set_row_names(max(1L, nrow(df)))

  extra_vars <- setdiff(names(df), names(.data))
  if (has_length(extra_vars)) {
    abort(error_inconsistent_new_rows(extra_vars))
  }

  pos <- pos_from_before_after(.before, .after, nrow(.data))
  out <- rbind_at(.data, df, pos)

  vectbl_restore(out, .data)
}

#' @export
#' @rdname add_row
#' @usage NULL
add_case <- add_row

na_value <- function(boilerplate) {
  if (is.list(boilerplate)) {
    list(NULL)
  } else {
    NA
  }
}

rbind_at <- function(old, new, pos) {
  out <- vec_rbind(old, new)

  # Append at end: Nothing more to do.
  if (pos >= nrow(old)) {
    return(out)
  }

  # Splice: Construct index vector
  pos <- max(pos, 0L)
  idx <- c(
    seq2(1L, pos),
    seq2(nrow(old) + 1L, nrow(old) + nrow(new)),
    seq2(pos + 1L, nrow(old))
  )
  vec_slice(out, idx)
}

#' Add columns to a data frame
#'
#' @description
#' \lifecycle{questioning}
#'
#' This is a convenient way to add one or more columns to an existing data
#' frame.
#'
#'@section Life cycle:
#' It is unclear we should have an `add_column()` function.
#' `dplyr::mutate()` just added the arguments `.before` and `.after`.
#' See <https://github.com/tidyverse/dplyr/pull/4774> and
#' <https://github.com/tidyverse/dplyr/issues/2047> for details.
#'
#'
#'
#'
#' @param .data Data frame to append to.
#' @param ... <[`dynamic-dots`][rlang::dyn-dots]>
#'   Name-value pairs, passed on to [tibble()]. All values must have
#'   one element for each row in the data frame, or be of length 1.
#'   These arguments are passed on to [tibble()], and therefore also support
#'   unquote via `!!` and unquote-splice via `!!!`. However, unlike in
#'   \pkg{dplyr} verbs, columns in `.data` are not available for the
#'   expressions. Use [dplyr::mutate()] if you need to add a column based on
#'   existing data.
#' @param .before,.after One-based column index or column name where to add the
#'   new columns, default: after last column.
#' @family addition
#' @examples
#' # add_column ---------------------------------
#' df <- tibble(x = 1:3, y = 3:1)
#'
#' df %>% add_column(z = -1:1, w = 0)
#' df %>% add_column(z = -1:1, .before = "y")
#'
#' # You can't overwrite existing columns
#' try(df %>% add_column(x = 4:6))
#'

#' # You can't create new observations
#' try(df %>% add_column(z = 1:5))
#'
#' @export
add_column <- function(.data, ..., .before = NULL, .after = NULL) {
  if (!is.data.frame(.data)) {
    deprecate_warn("2.1.1", "add_column(.data = 'must be a data frame')")
  }

  df <- tibble(...)

  if (ncol(df) == 0L) {
    return(.data)
  }

  if (nrow(df) != nrow(.data)) {
    if (nrow(df) == 1) {
      df <- df[rep(1L, nrow(.data)), ]
    } else {
      abort(error_inconsistent_new_cols(nrow(.data), df))
    }
  }

  extra_vars <- intersect(names(df), names(.data))
  if (length(extra_vars) > 0) {
    abort(error_duplicate_new_cols(extra_vars))
  }

  pos <- pos_from_before_after_names(.before, .after, colnames(.data))

  end_pos <- ncol(.data) + seq_len(ncol(df))

  indexes_before <- rlang::seq2(1L, pos)
  indexes_after <- rlang::seq2(pos + 1L, ncol(.data))
  indexes <- c(indexes_before, end_pos, indexes_after)

  new_data <- .data

  new_data[end_pos] <- df
  vectbl_restore(new_data[indexes], .data)
}


# helpers -----------------------------------------------------------------

pos_from_before_after_names <- function(before, after, names) {
  before <- check_names_before_after(before, names)
  after <- check_names_before_after(after, names)

  pos_from_before_after(before, after, length(names))
}

pos_from_before_after <- function(before, after, len) {
  if (is_null(before)) {
    if (is_null(after)) {
      len
    } else {
      limit_pos_range(after, len)
    }
  } else {
    if (is_null(after)) {
      limit_pos_range(before - 1L, len)
    } else {
      abort(error_both_before_after())
    }
  }
}

limit_pos_range <- function(pos, len) {
  max(0L, min(len, pos))
}

# Errors ------------------------------------------------------------------

error_add_rows_to_grouped_df <- function() {
  tibble_error("Can't add rows to grouped data frames.")
}

error_inconsistent_new_rows <- function(names) {
  tibble_error(
    bullets(
      "New rows in `add_row()` must use columns that already exist:",
      cnd_message(error_unknown_column_names(names))
    ),
    names = names
  )
}

error_duplicate_new_cols <- function(names) {
  tibble_error(
    bullets(
      "Can't add duplicate columns with `add_column()`:",
      cnd_message(error_existing_column_names(names))
    ),
    names = names
  )
}

error_both_before_after <- function() {
  tibble_error("Can't specify both `.before` and `.after`.")
}

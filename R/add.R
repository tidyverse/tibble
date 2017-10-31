#' Add rows to a data frame
#'
#' This is a convenient way to add one or more rows of data to an existing data
#' frame. See [tribble()] for an easy way to create an complete
#' data frame row-by-row.
#'
#' `add_case()` is an alias of `add_row()`.
#'
#' @param .data Data frame to append to.
#' @param ... Name-value pairs, passed on to [tibble()]. Only columns that exist
#'   in `.data` can be used, unset columns will get an `NA` value.
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
    stop("Can't add rows to grouped data frames", call. = FALSE)
  }

  df <- tibble(...)
  attr(df, "row.names") <- .set_row_names(max(1L, nrow(df)))

  extra_vars <- setdiff(names(df), names(.data))
  if (length(extra_vars) > 0) {
    stopc(pluralise_msg("Can't add row with new variable(s) ", extra_vars))
  }

  missing_vars <- setdiff(names(.data), names(df))
  df[missing_vars] <- map(.data[missing_vars], na_value)
  df <- df[names(.data)]

  pos <- pos_from_before_after(.before, .after, nrow(.data))
  out <- rbind_at(.data, df, pos)

  set_class(remove_rownames(out), class(.data))
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
  if (nrow(old) == 0) {
    old <- old[1, ]
    out <- rbind(old, new)[-1, ]
  } else {
    out <- rbind(old, new)
    if (pos < nrow(old)) {
      pos <- max(pos, 0L)
      idx <- c(
        seq2(1L, pos),
        seq2(nrow(old) + 1L, nrow(old) + nrow(new)),
        seq2(pos + 1L, nrow(old))
      )
      out <- out[idx, ]
    }
  }
  out
}

#' Add columns to a data frame
#'
#' This is a convenient way to add one or more columns to an existing data
#' frame.
#'
#' @param .data Data frame to append to.
#' @param ... Name-value pairs, passed on to [tibble()]. All values must have
#'   one element for each row in the data frame, or be of length 1.
#' @param .before,.after One-based column index or column name where to add the
#'   new columns, default: after last column.
#' @family addition
#' @examples
#' # add_column ---------------------------------
#' df <- tibble(x = 1:3, y = 3:1)
#'
#' add_column(df, z = -1:1, w = 0)
#'
#' # You can't overwrite existing columns
#' \dontrun{
#' add_column(df, x = 4:6)
#' }

#' # You can't create new observations
#' \dontrun{
#' add_column(df, z = 1:5)
#' }
#' @export
add_column <- function(.data, ..., .before = NULL, .after = NULL) {
  df <- tibble(...)

  if (ncol(df) == 0L) {
    return(.data)
  }

  if (nrow(df) != nrow(.data)) {
    if (nrow(df) == 1) {
      df <- df[rep(1L, nrow(.data)), ]
    } else {
      stopc(
        "`.data` must have ", nrow(.data),
        pluralise_n(" row(s)", nrow(.data)),
        ", not ", nrow(df)
      )
    }
  }

  extra_vars <- intersect(names(df), names(.data))
  if (length(extra_vars) > 0) {
    stopc(
      pluralise_msg("Column(s) ", extra_vars),
      pluralise(" already exist[s]", extra_vars)
    )
  }

  pos <- pos_from_before_after_names(.before, .after, colnames(.data))

  end_pos <- ncol(.data) + seq_len(ncol(df))

  indexes_before <- rlang::seq2(1L, pos)
  indexes_after <- rlang::seq2(pos + 1L, ncol(.data))
  indexes <- c(indexes_before, end_pos, indexes_after)

  .data[end_pos] <- df
  .data[indexes]
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
      stopc("Can't specify both `.before` and `.after`")
    }
  }
}

limit_pos_range <- function(pos, len) {
  max(c(0L, min(c(len, pos))))
}

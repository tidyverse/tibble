#' Add rows to a data frame
#'
#' This is a convenient way to add one or more rows of data to an existing data
#' frame. See \code{\link{tribble}} for an easy way to create an complete
#' data frame row-by-row.
#'
#' @param .data Data frame to append to.
#' @param ... Name-value pairs. If you don't supply the name of a variable,
#'   it'll be given the value \code{NA}.
#' @param .before,.after One-based row index where to add the new rows,
#'   default: after last row
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
  df <- tibble(...)
  attr(df, "row.names") <- .set_row_names(max(1L, nrow(df)))

  extra_vars <- setdiff(names(df), names(.data))
  if (length(extra_vars) > 0) {
    stopc(
      "This row would add new variables: ", format_n(extra_vars)
    )
  }

  missing_vars <- setdiff(names(.data), names(df))
  df[missing_vars] <- lapply(.data[missing_vars], na_value)
  df <- df[names(.data)]

  pos <- pos_from_before_after(.before, .after, nrow(.data))

  if (pos <= 0L) {
    out <- rbind(df, .data)
  } else if (pos >= nrow(.data)) {
    out <- rbind(.data, df)
  } else {
    indexes <- seq_len(pos)
    out <- rbind(.data[indexes, ], df, .data[-indexes, ])
  }

  set_class(remove_rownames(out), class(.data))
}

na_value <- function(boilerplate) {
  if (is.list(boilerplate))
    list(NULL)
  else
    NA
}

#' Add columns to a data frame
#'
#' This is a convenient way to add one or more columns to an existing data
#' frame.
#'
#' @param .data Data frame to append to.
#' @param ... Name-value pairs, all values must have one element for each row
#'   in the data frame, or be of length 1
#' @param .before,.after One-based column index or column name where to add the
#'   new columns, default: after last column
#' @family addition
#' @examples
#' # add_row ---------------------------------
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
    stopc("Expected ", nrow(.data), " rows, got ", nrow(df))
  }

  extra_vars <- intersect(names(df), names(.data))
  if (length(extra_vars) > 0) {
    stopc(
      "Columns already in data frame: ", format_n(extra_vars)
    )
  }

  pos <- pos_from_before_after_names(.before, .after, colnames(.data))

  if (pos <= 0L) {
    out <- cbind(df, .data)
  } else if (pos >= ncol(.data)) {
    out <- cbind(.data, df)
  } else {
    indexes <- seq_len(pos)
    out <- cbind(.data[indexes], df, .data[-indexes])
  }

  set_class(remove_rownames(out), class(.data))
}


# helpers -----------------------------------------------------------------

pos_from_before_after_names <- function(before, after, names) {
  before <- check_names_before_after(before, names)
  after <- check_names_before_after(after, names)

  pos_from_before_after(before, after, length(names))
}

pos_from_before_after <- function(before, after, len) {
  if (is.null(before)) {
    if (is.null(after)) {
      len
    } else {
      after
    }
  } else {
    if (is.null(after)) {
      before - 1L
    } else {
      stopc("Can't specify both .before and .after")
    }
  }
}

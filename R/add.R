#' Add rows to a data frame
#'
#' @description
#' This is a convenient way to add one or more rows of data to an existing data
#' frame. See [tribble()] for an easy way to create an complete
#' data frame row-by-row. Use [tibble_row()] to ensure that the new data
#' has only one row.
#'
#' `add_case()` is an alias of `add_row()`.
#'
#' @param .data Data frame to append to.
#' @param ... <[`dynamic-dots`][rlang::dyn-dots]>
#'   Name-value pairs, passed on to [tibble()]. Values can be defined
#'   only for columns that already exist in `.data` and unset columns will get an
#'   `NA` value.
#' @param .before,.after One-based row index where to add the new rows,
#'   default: after last row.
#' @family addition
#' @examples
#' # add_row ---------------------------------
#' df <- tibble(x = 1:3, y = 3:1)
#'
#' df %>% add_row(x = 4, y = 0)
#'
#' # You can specify where to add the new rows
#' df %>% add_row(x = 4, y = 0, .before = 2)
#'
#' # You can supply vectors, to add multiple rows (this isn't
#' # recommended because it's a bit hard to read)
#' df %>% add_row(x = 4:5, y = 0:-1)
#'
#' # Use tibble_row() to add one row only
#' df %>% add_row(tibble_row(x = 4, y = 0))
#' try(df %>% add_row(tibble_row(x = 4:5, y = 0:-1)))
#'
#' # Absent variables get missing values
#' df %>% add_row(x = 4)
#'
#' # You can't create new variables
#' try(df %>% add_row(z = 10))
#' @export
add_row <- function(.data, ..., .before = NULL, .after = NULL) {
  if (inherits(.data, "grouped_df")) {
    abort_add_rows_to_grouped_df()
  }

  if (!is.data.frame(.data)) {
    deprecate_stop("2.1.1", "add_row(.data = 'must be a data frame')")
  }

  if (dots_n(...) == 0L) {
    # A single row of missing values is added if no input is supplied
    df <- new_tibble(list(), nrow = 1L)
  } else {
    df <- tibble(...)
  }

  extra_vars <- setdiff(names(df), names(.data))
  if (has_length(extra_vars)) {
    abort_incompatible_new_rows(extra_vars)
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
#' This is a convenient way to add one or more columns to an existing data
#' frame.
#'
#' @param .data Data frame to append to.
#' @param ... <[`dynamic-dots`][rlang::dyn-dots]>
#'   Name-value pairs, passed on to [tibble()]. All values must have
#'   the same size of `.data` or size 1.
#' @param .before,.after One-based column index or column name where to add the
#'   new columns, default: after last column.
#' @inheritParams tibble
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
add_column <- function(.data, ..., .before = NULL, .after = NULL,
                       .name_repair = c("check_unique", "unique", "universal", "minimal", "unique_quiet", "universal_quiet")) {
  if (!is.data.frame(.data)) {
    deprecate_stop("2.1.1", "add_column(.data = 'must be a data frame')")
  }

  if (has_length(.data) && (!is_named(.data) || anyDuplicated(names2(.data))) && missing(.name_repair)) {
    deprecate_stop("3.0.0", "add_column(.data = 'must have unique names')",
      details = 'Use `.name_repair = "minimal"`.'
    )
  }

  df <- tibble(..., .name_repair = .name_repair)

  if (ncol(df) == 0L) {
    return(.data)
  }

  if (nrow(df) != nrow(.data)) {
    if (nrow(df) == 1) {
      df <- df[rep(1L, nrow(.data)), ]
    } else {
      abort_incompatible_new_cols(nrow(.data), df)
    }
  }

  pos <- pos_from_before_after_names(.before, .after, colnames(.data))

  end_pos <- ncol(.data) + seq_len(ncol(df))

  indexes_before <- rlang::seq2(1L, pos)
  indexes_after <- rlang::seq2(pos + 1L, ncol(.data))
  indexes <- c(indexes_before, end_pos, indexes_after)

  new_data <- .data
  new_data[end_pos] <- df

  out <- new_data[indexes]

  out <- set_repaired_names(out, repair_hint = TRUE, .name_repair)
  vectbl_restore(out, .data)
}


# helpers -----------------------------------------------------------------

pos_from_before_after_names <- function(before, after, names, call = caller_env()) {
  before <- check_names_before_after(before, names)
  after <- check_names_before_after(after, names)

  pos_from_before_after(before, after, length(names), call)
}

pos_from_before_after <- function(before, after, len, call = caller_env()) {
  if (is.null(before)) {
    if (is.null(after)) {
      len
    } else {
      limit_pos_range(after, len)
    }
  } else {
    if (is.null(after)) {
      limit_pos_range(before - 1L, len)
    } else {
      abort_both_before_after(call)
    }
  }
}

limit_pos_range <- function(pos, len) {
  max(0L, min(len, pos))
}

# check_names_before_after ------------------------------------------------

check_names_before_after <- function(j, x) {
  if (!is_bare_character(j)) {
    return(j)
  }

  check_needs_no_dim(j)
  check_names_before_after_character(j, x)
}

check_needs_no_dim <- function(j) {
  if (needs_dim(j)) {
    abort_dim_column_index(j)
  }
}

check_names_before_after_character <- function(j, names) {
  pos <- safe_match(j, names)
  if (anyNA(pos)) {
    unknown_names <- j[is.na(pos)]
    abort_unknown_column_names(unknown_names)
  }
  pos
}

# Errors ------------------------------------------------------------------

msg_unknown_column_names <- function(names) {
  pluralise_commas("Can't find column(s) ", tick(names), " in `.data`.")
}

abort_add_rows_to_grouped_df <- function(call = caller_env()) {
  tibble_abort(call = call, "Can't add rows to grouped data frames.")
}

abort_incompatible_new_rows <- function(names, call = caller_env()) {
  tibble_abort(
    call = call,
    problems(
      "New rows can't add columns:",
      msg_unknown_column_names(names)
    ),
    names = names
  )
}

abort_both_before_after <- function(call = caller_env()) {
  tibble_abort(call = call, "Can't specify both `.before` and `.after`.")
}

abort_unknown_column_names <- function(j, parent = NULL, call = caller_env()) {
  tibble_abort(call = call, pluralise_commas("Can't find column(s) ", tick(j), " in `.data`."), j = j, parent = parent)
}

abort_incompatible_new_cols <- function(n, df, call = caller_env()) {
  tibble_abort(
    call = call,
    bullets(
      "New columns must be compatible with `.data`:",
      x = paste0(
        pluralise_n("New column(s) ha[s](ve)", ncol(df)), " ",
        nrow(df), " rows"
      ),
      i = pluralise_count("`.data` has ", n, " row(s)")
    ),
    expected = n,
    actual = nrow(df)
  )
}

abort_dim_column_index <- function(j, call = caller_env()) {
  # friendly_type_of() doesn't distinguish between matrices and arrays
  tibble_abort(call = call, paste0("Must use a vector in `[`, not an object of class ", class(j)[[1]], "."))
}

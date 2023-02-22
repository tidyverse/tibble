#' Row-wise tibble creation
#'
#' @description
#' Create [tibble]s using an easier to read row-by-row layout.
#' This is useful for small tables of data where readability is
#' important.  Please see \link{tibble-package} for a general introduction.
#'
#' @param ... <[`dynamic-dots`][rlang::dyn-dots]>
#'   Arguments specifying the structure of a `tibble`.
#'   Variable names should be formulas, and may only appear before the data.
#'   These arguments are processed with [rlang::list2()]
#'   and support unquote via [`!!`] and unquote-splice via [`!!!`].
#' @return A [tibble].
#' @seealso
#'   See [quasiquotation] for more details on tidy dots semantics,
#'   i.e. exactly how  the `...` argument is processed.
#' @export
#' @examples
#' tribble(
#'   ~colA, ~colB,
#'   "a",   1,
#'   "b",   2,
#'   "c",   3
#' )
#'
#' # tribble will create a list column if the value in any cell is
#' # not a scalar
#' tribble(
#'   ~x,  ~y,
#'   "a", 1:3,
#'   "b", 4:6
#' )
#' @examplesIf rlang::is_installed("dplyr") && packageVersion("dplyr") >= "1.0.5"
#'
#' # Use dplyr::mutate(dplyr::across(...)) to assign an explicit type
#' tribble(
#'   ~a, ~b, ~c,
#'   1, "2000-01-01", "1.5"
#' ) %>%
#'   dplyr::mutate(
#'     dplyr::across(a, as.integer),
#'     dplyr::across(b, as.Date)
#'   )
tribble <- function(...) {
  data <- extract_frame_data_from_dots(...)
  turn_frame_data_into_tibble(data$frame_names, data$frame_rest)
}

#' Row-wise matrix creation
#'
#' @description
#' Create matrices laying out the data in rows, similar to
#' `matrix(..., byrow = TRUE)`, with a nicer-to-read syntax.
#' This is useful for small matrices, e.g. covariance matrices, where readability
#' is important. The syntax is inspired by [tribble()].
#'
#' @param ... <[`dynamic-dots`][rlang::dyn-dots]>
#'   Arguments specifying the structure of a `frame_matrix`.
#'   Column names should be formulas, and may only appear before the data.
#'   These arguments are processed with [rlang::list2()]
#'   and support unquote via [`!!`] and unquote-splice via [`!!!`].
#' @return A [matrix].
#' @seealso
#'   See [quasiquotation] for more details on tidy dots semantics,
#'   i.e. exactly how  the `...` argument is processed.
#' @export
#' @examples
#' frame_matrix(
#'   ~col1, ~col2,
#'   1,     3,
#'   5,     2
#' )
frame_matrix <- function(...) {
  data <- extract_frame_data_from_dots(...)
  turn_frame_data_into_frame_matrix(data$frame_names, data$frame_rest)
}

extract_frame_data_from_dots <- function(...) {
  dots <- list2(...)

  # Extract the names.
  frame_names <- extract_frame_names_from_dots(dots)

  # Extract the data
  if (length(frame_names) == 0 && length(dots) != 0) {
    abort_tribble_needs_columns()
  }
  frame_rest <- dots[-seq_along(frame_names)]
  if (!is.null(names(frame_rest))) {
    abort_tribble_named_after_tilde()
  }
  if (length(frame_rest) == 0L) {
    # Can't decide on type in absence of data -- use logical which is
    # coercible to all types
    frame_rest <- unspecified()
  }

  validate_rectangular_shape(frame_names, frame_rest)

  list(frame_names = frame_names, frame_rest = frame_rest)
}

extract_frame_names_from_dots <- function(dots) {
  frame_names <- character()

  for (i in seq_along(dots)) {
    el <- dots[[i]]
    if (!is.call(el)) {
      break
    }

    if (!identical(el[[1]], as.name("~"))) {
      break
    }

    if (length(el) != 2) {
      abort_tribble_lhs_column_syntax(el[[2]])
    }

    candidate <- el[[2]]
    if (!(is.symbol(candidate) || is.character(candidate))) {
      abort_tribble_rhs_column_syntax(candidate)
    }

    frame_names <- c(frame_names, as.character(candidate))
  }

  frame_names
}

validate_rectangular_shape <- function(frame_names, frame_rest) {
  if (length(frame_names) == 0 && length(frame_rest) == 0) return()

  # Figure out the associated number of rows and number of columns,
  # and validate that the supplied formula produces a rectangular
  # structure.
  if (length(frame_rest) %% length(frame_names) != 0) {
    abort_tribble_non_rectangular(length(frame_names), length(frame_rest))
  }
}

turn_frame_data_into_tibble <- function(names, rest, call = caller_env()) {
  if (is_empty(names)) return(new_tibble(list(), nrow = 0))

  nrow <- length(rest) / length(names)
  dim(rest) <- c(length(names), nrow)
  dimnames(rest) <- list(names, NULL)

  frame_mat <- t(rest)
  frame_col <- turn_matrix_into_column_list(frame_mat, call)

  new_tibble(frame_col, nrow = nrow)
}

turn_matrix_into_column_list <- function(frame_mat, call) {
  frame_col <- vector("list", length = ncol(frame_mat))
  names(frame_col) <- colnames(frame_mat)

  # if a frame_mat's col is a list column, keep it unchanged (does not unlist)
  for (i in seq_len(ncol(frame_mat))) {
    col <- frame_mat[, i]

    if (inherits(col, "list") && !some(col, needs_list_col)) {
      subclass_tribble_c_errors(
        names(frame_col)[[i]],
        col <- vec_c(!!!unname(col)),
        call
      )
    }

    frame_col[[i]] <- unname(col)
  }
  return(frame_col)
}

turn_frame_data_into_frame_matrix <- function(names, rest) {
  list_cols <- which(map_lgl(rest, needs_list_col))
  if (has_length(list_cols)) {
    abort_frame_matrix_list(list_cols)
  }

  frame_ncol <- length(names)
  frame_mat <- matrix(unlist(rest), ncol = frame_ncol, byrow = TRUE)

  colnames(frame_mat) <- names
  frame_mat
}

subclass_tribble_c_errors <- function(name, code, call) {
  withCallingHandlers(
    code,
    vctrs_error = function(cnd) {
      abort_tribble_c(name, cnd, call)
    }
  )
}

# Errors ------------------------------------------------------------------

abort_tribble_needs_columns <- function(call = my_caller_env()) {
  tibble_abort(call = call, "Must specify at least one column using the `~name` syntax.")
}

abort_tribble_named_after_tilde <- function(call = my_caller_env()) {
  tibble_abort(call = call, "When using the `~name` syntax, subsequent values must not have names.")
}

abort_tribble_lhs_column_syntax <- function(lhs, call = my_caller_env()) {
  tibble_abort(call = call, problems(
    "All column specifications must use the `~name` syntax.",
    paste0("Found ", expr_label(lhs), " on the left-hand side of `~`.")
  ))
}

abort_tribble_rhs_column_syntax <- function(rhs, call = my_caller_env()) {
  tibble_abort(call = call, problems(
    'All column specifications must use the `~name` or `~"name"` syntax.',
    paste0("Found ", expr_label(rhs), " on the right-hand side of `~`.")
  ))
}

abort_tribble_non_rectangular <- function(cols, cells, call = my_caller_env()) {
  tibble_abort(call = call, bullets(
    "Data must be rectangular:",
    paste0("Found ", cols, " columns."),
    paste0("Found ", cells, " cells."),
    info = paste0(cells, " is not an integer multiple of ", cols, ".")
  ))
}

abort_frame_matrix_list <- function(pos, call = my_caller_env()) {
  tibble_abort(call = call, problems(
    "All values must be atomic:",
    pluralise_commas("Found list-valued element(s) at position(s) ", pos, ".")
  ))
}

abort_tribble_c <- function(name, cnd, call) {
  tibble_abort(
    paste0("Can't create column ", tick(name)),
    parent = cnd,
    call = call
  )
}

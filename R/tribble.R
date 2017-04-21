#' Row-wise tibble creation
#'
#' Create [tibble]s using an easier to read row-by-row layout.
#' This is useful for small tables of data where readability is
#' important.  Please see \link{tibble-package} for a general introduction.
#'
#' `frame_data()` is an older name for `tribble()`. It will eventually
#' be phased out.
#'
#' @param ... Arguments specifying the structure of a `tibble`.
#'   Variable names should be formulas, and may only appear before the data.
#'
#'   If a function needs to be applied to the data for a column (e.g. `factor`),
#'   this should apear after the `~`, with the column name before,
#'   e.g. `colA~factor(.)`. `.` should be used as a placeholder for the data.
#'   Other arguments can be provided as needed, e.g.
#'   `colA~factor(., levels = C("A", "B")`.
#'
#'   As with \link{tibble}, functions can refer back to earlier columns in the
#'   data. Conversions can include any valid expression, and are evaluated using
#'   \code{\link[rlang]{eval_tidy}} and so support splicing with
#'   \code{\link[rlang]{!!}}.
#' @return A [tibble].
#' @export
#' @examples
#' tribble(
#'   ~colA, ~colB,
#'   "a",   1,
#'   "b",   2,
#'   "c",   3
#' )
#'
#' # Conversion expressions can be supplied, including additional
#' # paremeters if needed.
#' tribble(
#'   ~colA, colB~factor(., levels = c("B", "A")),
#'   "X",   "A",
#'   "Y",   "B"
#' )
#'
#' # More complex conversion expressions are also possible
#'  tribble(
#'    colA~as.numeric(Sys.Date() - as.Date(.), unit = "days"),
#'    "2015-01-02",
#'    "2016-03-04"
#' )
#'
#' # Conversion expressions must always include the placeholder `.`
#' \dontrun{
#' tribble(colA~factor(), 1)
#' }
#'
#' # tribble will create a list column if the value in any cell is
#' # not a scalar
#' tribble(
#'   ~x,  ~y,
#'   "a", 1:3,
#'   "b", 4:6
#' )
tribble <- function(...) {
  data <- extract_frame_data_from_dots(...)
  turn_frame_data_into_tibble(
    data$frame_names,
    data$frame_rest,
    data$frame_quosures)
}

#' @export
#' @rdname tribble
#' @usage NULL
frame_data <- tribble

#' Row-wise matrix creation
#'
#' Create matrices laying out the data in rows, similar to
#' `matrix(..., byrow = TRUE)`, with a nicer-to-read syntax.
#' This is useful for small matrices, e.g. covariance matrices, where readability
#' is important. The syntax is inspired by [tribble()].
#'
#' @param ... Arguments specifying the structure of a `frame_matrix`.
#'   Column names should be formulas, and may only appear before the data.
#' @return A [matrix].
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
  dots <- list(...)

  # Extract the names.
  frame_quosures <- extract_frame_names_quosures_from_dots(dots)
  frame_names <- names(frame_quosures)

  # Extract the data
  if (length(frame_names) == 0 && length(dots) != 0) {
    stopc("expected at least one column name; e.g. '~name'")
  }
  frame_rest <- dots[-seq_along(frame_names)]
  if (length(frame_rest) == 0L) {
    # Can't decide on type in absence of data -- use logical which is
    # coercible to all types
    frame_rest <- logical()
  }

  validate_rectangular_shape(frame_names, frame_rest)

  list(frame_names = frame_names, frame_quosures = frame_quosures, frame_rest = frame_rest)
}

extract_frame_names_quosures_from_dots <- function(dots) {
  frame_quosures <- list()

  for (i in seq_along(dots)) {
    el <- dots[[i]]
    if (!is.call(el))
      break

    if (!identical(el[[1]], as.name("~")))
      break

    if (length(el) == 3L) {
      # e.g. colA~factor(., levels = c("B", "A")) {
      col_data <- extract_quosure(el)
    } else {
      if (!(is.symbol(el[[2]]) || is.character(el[[2]]))) {
        stopc("expected a symbol or string denoting a column name")
      }
      col_data <- list(
        col_name = as.character(el[[2]]),
        col_quosure = quo(.)
        )
    }

    frame_quosures <- c(
      frame_quosures,
      setNames(list(col_data$col_quosure), col_data$col_name))
  }
  frame_quosures
}

call_contains_dot <- function(cur_call) {
  for (i in 2:length(cur_call)) {
    if (identical(cur_call[[i]], quote(.))) {
      return(TRUE)
    }
    if (is.call(cur_call[[i]]) && length(cur_call[[i]]) > 1L) {
      if (call_contains_dot(cur_call[[i]])) {
        return(TRUE)
      }
    }
  }
  return(FALSE)
}

extract_quosure <- function(el) {
  col_quosure <- expr_interp(el[-2])
  if (!is.call(col_quosure[[2]]) && !identical(col_quosure[[2]], quote(.))) {
    stopc("conversion expressions should be specified as e.g. colA~factor(.)")
  }
  if (!is.character(el[[2]]) && !is_symbol(el[[2]])) {
    stopc(
      sprintf("column name for '%s' should be a symbol or character",
              deparse(el))
    )
  }
  if ((length(col_quosure[[2]]) == 1L &&
       !identical(col_quosure[[2]], quote(.))) ||
      (length(col_quosure[[2]]) > 1L &&
       !call_contains_dot(col_quosure[[2]]))) {
    stopc(
      sprintf(
        "conversion expression '%s' does not contain a `.` placeholder for data",
        deparse(el))
    )
  }
  list(col_name = as.character(el[[2]]), col_quosure = col_quosure)
}

validate_rectangular_shape <- function(frame_names, frame_rest) {
  if (length(frame_names) == 0 && length(frame_rest) == 0) return();

  # Figure out the associated number of rows and number of columns,
  # and validate that the supplied formula produces a rectangular
  # structure.
  if (length(frame_rest) %% length(frame_names) != 0) {
    stopc(
      sprintf(
        "invalid specification: had %s elements and %s columns",
        length(frame_rest),
        length(frame_names)
      )
    )
  }
}

turn_frame_data_into_tibble <- function(names, rest, quosures) {
  frame_mat <- matrix(rest, ncol = length(names), byrow = TRUE)
  frame_col <- turn_matrix_into_column_list(frame_mat)
  names(frame_col) <- names
  frame_col_processed <- apply_quosures_to_frame_data(frame_col, quosures)

  # Create a tbl_df and return it
  as_tibble(frame_col_processed)
}

turn_matrix_into_column_list <- function(frame_mat) {
  frame_col <- vector("list", length = ncol(frame_mat))
  # if a frame_mat's col is a list column, keep it unchanged (does not unlist)
  for (i in seq_len(ncol(frame_mat))) {
    col <- frame_mat[, i]
    if (some(col, needs_list_col)) {
      frame_col[[i]] <- col
    } else {
      frame_col[[i]] <- unlist(col)
    }
  }
  return(frame_col)
}

turn_frame_data_into_frame_matrix <- function(names, rest) {
  if (some(rest, needs_list_col)) {
    stopc("frame_matrix() cannot have list columns")
  }

  frame_ncol <- length(names)
  frame_mat <- matrix(unlist(rest), ncol = frame_ncol, byrow = TRUE)

  colnames(frame_mat) <- names
  frame_mat
}

apply_quosures_to_frame_data <- function(data, quosures) {
  output <- list_len(length(data))
  for (i in seq_along(data)) {
    cur_quosure <- quosures[[i]]
    output[[i]] <- data[[i]]
    if (is.call(cur_quosure[[2]])) {
      names(output)[i] <- "."
      # Only need to evaluate if a call rather than a symbol
      res <- eval_tidy(cur_quosure, output)
      if (length(res) != length(data[[i]])) {
        stopc(
          sprintf(
            "conversion '%s%s' returns %d items; expecting %d.",
            deparse(as.symbol(names(data)[i]), backtick = TRUE),
            deparse(cur_quosure),
            length(res),
            length(data[[i]])
            )
          )
      }
      output[[i]] <- res
    }
    names(output)[i] <- names(data)[i]
  }
  output
}

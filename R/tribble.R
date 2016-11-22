#' Row-wise tibble creation
#'
#' Create \code{\link{tibble}}s laying out the data in rows, rather than
#' in columns. This is useful for small tables of data where readability is
#' important.  Please see \link{tibble-package} for a general introduction.
#'
#' \code{frame_data()} is an older name for \code{tribble()}. It will eventually
#' be phased out.
#'
#' @param ... Arguments specifying the structure of a \code{tibble}.
#'   Variable names should be formulas, and may only appear before the data.
#' @return A \code{\link{tibble}}.
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
tribble <- function(...) {
  data <- extract_frame_data_from_dots(...)

  if (length(data$frame_rest) == 0) {
    out <- rep(list(logical()), length(data$frame_names))
    names(out) <- data$frame_names
    return(as_tibble(out))
  }

  frame_mat <- matrix(data$frame_rest, ncol = length(data$frame_names), byrow = TRUE)

  frame_col <- lapply(seq_len(ncol(frame_mat)), function(i) {
    col <- frame_mat[, i]
    if (any(vapply(col, needs_list_col, logical(1L)))) {
      col
    } else {
      unlist(col)
    }
  })

  # Create a tbl_df and return it
  names(frame_col) <- data$frame_names
  as_tibble(frame_col)
}

frame_matrix <- function(...) {
  data <- extract_frame_data_from_dots(...)

  if (any(vapply(data$frame_rest, needs_list_col, logical(1)))) {
    stopc("frame_matrix cannot have list columns")
  }

  frame_ncol <- length(data$frame_names)

  if (length(data$frame_rest) == 0) {
    frame_mat <- matrix(logical(0), ncol = frame_ncol)
  } else {
    frame_mat <- matrix(unlist(data$frame_rest), ncol = frame_ncol, byrow = TRUE)
  }

  if (length(data$frame_names) != 0) {
    colnames(frame_mat) <- data$frame_names
  }

  frame_mat
}

extract_frame_data_from_dots <- function(...) {
  dots <- list(...)

  # Extract the names.
  frame_names <- extract_frame_names_from_dots(dots)

  # Extract the data
  if (length(frame_names) == 0 & length(dots) != 0) {
    stopc("expected at least one column name; e.g. '~name'")
  }
  frame_rest <- dots[-seq_along(frame_names)]

  validate_rectangular_shape(frame_names, frame_rest)

  list(frame_names = frame_names, frame_rest = frame_rest)
}

extract_frame_names_from_dots <- function(dots) {
  frame_names <- character()

  if (length(dots) == 0) return(frame_names);

  for (i in 1:length(dots)) {
    el <- dots[[i]]
    if (!is.call(el))
      break

    if (!identical(el[[1]], as.name("~")))
      break

    if (length(el) != 2) {
      stopc("expected a column name with a single argument; e.g. '~name'")
    }

    candidate <- el[[2]]
    if (!(is.symbol(candidate) || is.character(candidate))) {
      stopc("expected a symbol or string denoting a column name")
    }

    frame_names <- c(frame_names, as.character(el[[2]]))
  }

  frame_names
}

validate_rectangular_shape <- function(frame_names, frame_rest) {
  if (length(frame_names) == 0 & length(frame_rest) == 0) return();

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

#' @export
#' @rdname tribble
frame_data <- tribble

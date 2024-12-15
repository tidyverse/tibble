#' Main function for subset assignment
#'
#' Powers $<-, [[<- and [<- for tibbles.
#'
#' @param x A tibble.
#' @param i An integer vector, or `NULL` to replace all rows.
#' @param j A named integer vector, or `NULL` to replace all columns.
#'   The names are required to define the names for new columns.
#'   In addition, if new columns are created, their names must be stored
#'   in the `"new"` attribute, for performance.
#' @param value A list of length one or of the same length as `j`.
#'   `NULL` elements indicate column removal.
#' @param i_arg,value_arg Argument names.
#' @noRd
tbl_subassign <- function(x, i, j, value, i_arg, j_arg, value_arg, call = caller_env()) {
  if (is.null(i)) {
    xo <- unclass(x)

    if (is.null(value)) {
      value <- list(value)
    } else {
      value <- result_vectbl_wrap_rhs(value)
      if (is.null(value)) {
        abort_need_rhs_vector_or_null(value_arg, call)
      }
    }

    if (is.null(j)) {
      j <- seq_along(xo)
      names(j) <- names2(j)
    } else if (!is.null(j_arg)) {
      j <- vectbl_as_new_col_index(j, xo, j_arg, names2(value), value_arg, call = call)
    }

    value <- vectbl_recycle_rhs_rows(value, fast_nrow(xo), i_arg = NULL, value_arg, call)
    value <- vectbl_recycle_rhs_cols(value, length(j), call)

    xo <- tbl_subassign_col(xo, j, value)
  } else if (is.null(i_arg)) {
    # x[NULL, ...] <- value
    return(x)
  } else {
    i <- vectbl_as_new_row_index(i, x, i_arg, call = call)

    # Fill up rows first if necessary
    x <- tbl_expand_to_nrow(x, i, call)
    value <- result_vectbl_wrap_rhs(value)
    if (is.null(value)) {
      abort_need_rhs_vector(value_arg, call)
    }

    # Only after tbl_expand_to_nrow() which needs data frame
    xo <- unclass(x)

    if (is.null(j)) {
      xo <- tbl_subassign_row(xo, i, value, i_arg, value_arg, call)
    } else {
      # Optimization: match only once
      # (Invariant: x[[j]] is equivalent to x[[vec_as_location(j)]],
      # allowed by corollary that only existing columns can be updated)
      if (!is.null(j_arg)) {
        j <- vectbl_as_new_col_index(j, xo, j_arg, names2(value), value_arg, call = call)
      }

      # Fill up columns if necessary
      new <- attr(j, "new")
      if (!is.null(new)) {
        init <- map(value[new], vec_slice, rep(NA_integer_, fast_nrow(xo)))
        xo <- tbl_subassign_col(xo, j[new], init)
      }

      xj <- .subset(xo, j)
      xj <- tbl_subassign_row(xj, i, value, i_arg, value_arg, call)
      xo <- tbl_subassign_col(xo, j, xj)
    }
  }

  vectbl_restore(xo, x)
}

vectbl_recycle_rhs_rows <- function(value, nrow, i_arg, value_arg, call) {
  if (length(value) > 0L) {
    withCallingHandlers(
      for (j in seq_along(value)) {
        if (!is.null(value[[j]])) {
          value[[j]] <- vec_recycle(value[[j]], nrow)
        }
      },
      vctrs_error_recycle_incompatible_size = function(cnd) {
        abort_assign_incompatible_size(nrow, value, j, i_arg, value_arg, cnd, call = call)
      },
      vctrs_error_scalar_type = function(cnd) {
        abort_assign_vector(value, j, value_arg, cnd, call = call)
      }
    )
  }

  value
}

vectbl_recycle_rhs_cols <- function(value, ncol, call) {
  if (length(value) != 1L || ncol != 1L) {
    # Errors have been caught beforehand in vectbl_as_new_col_index()
    value <- vec_recycle(value, ncol, call = call)
  }

  value
}

tbl_subassign_col <- function(x, j, value) {
  nrow <- fast_nrow(x)

  # Grow, assign new names
  new <- attr(j, "new")
  if (!is.null(new)) {
    length(x) <- max(j[new])
    names(x)[j[new]] <- names2(j)[new]
  }

  # Update
  to_remove <- integer()
  for (jj in seq_along(value)) {
    ji <- j[[jj]]
    value_jj <- value[[jj]]
    if (!is.null(value_jj)) {
      x[[ji]] <- value_jj
    } else {
      to_remove <- c(to_remove, ji)
    }
  }

  # Remove
  if (length(to_remove) > 0) {
    x <- x[-to_remove]
  }

  # Can be destroyed by setting length
  attr(x, "row.names") <- .set_row_names(nrow)
  x
}

tbl_expand_to_nrow <- function(x, i, call = caller_env()) {
  nrow <- fast_nrow(x)

  new_nrow <- max(i, nrow)

  if (is.na(new_nrow)) {
    abort_assign_rows_non_na_only(call)
  }

  if (new_nrow != nrow) {
    # FIXME: vec_expand()?
    i_expand <- c(seq_len(nrow), rep(NA_integer_, new_nrow - nrow))
    x <- vec_slice(x, i_expand)
  }

  x
}

tbl_subassign_row <- function(x, i, value, i_arg, value_arg, call) {
  recycled_value <- vectbl_recycle_rhs_cols(value, length(x), call)

  withCallingHandlers(
    for (j in seq_along(x)) {
      x[[j]] <- vectbl_assign(x[[j]], i, recycled_value[[j]])
    },
    vctrs_error = function(cnd) {
      # Side effect: check if `value` can be recycled
      vectbl_recycle_rhs_rows(value, length(i), i_arg, value_arg, call)

      abort_assign_incompatible_type(x, recycled_value, j, value_arg, cnd, call = call)
    }
  )

  x
}

vectbl_assign <- function(x, i, value) {
  if (is.logical(value)) {
    if (.Call(`tibble_need_coerce`, value)) {
      value <- vec_slice(x, NA_integer_)
    }
  } else {
    if (.Call(`tibble_need_coerce`, x)) {
      d <- dim(x)
      dn <- dimnames(x)
      x <- vec_slice(value, rep(NA_integer_, length(x)))
      dim(x) <- d
      dimnames(x) <- dn
    }
  }

  vec_assign(x, i, value)
}

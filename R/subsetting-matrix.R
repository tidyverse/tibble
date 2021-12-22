tbl_subset_matrix <- function(x, j, j_arg) {
  cells <- matrix_to_cells(j, x, j_arg)
  col_idx <- cells_to_col_idx(cells)

  if (is_empty(col_idx)) {
    return(unspecified())
  }

  values <- map2(x[col_idx], cells[col_idx], vec_slice)

  # Also checks conformity of vectors:
  unname(vec_c(!!!values, .name_spec = ~.x))
}

tbl_subassign_matrix <- function(x, j, value, j_arg, value_arg) {
  # FIXME: use size argument in vctrs >= 0.3.0

  if (!vec_is(value)) {
    cnd_signal(error_subset_matrix_scalar_type(j_arg, value_arg))
  }

  if (vec_size(value) != 1) {
    cnd_signal(error_subset_matrix_must_be_scalar(j_arg, value_arg))
  }

  cells <- matrix_to_cells(j, x, j_arg)
  col_idx <- cells_to_col_idx(cells)

  withCallingHandlers(
    for (j in col_idx) {
      x[[j]] <- vectbl_assign(x[[j]], cells[[j]], value)
    },

    vctrs_error_incompatible_type = function(cnd) {
      cnd_signal(error_assign_incompatible_type(x, rep(list(value), j), j, value_arg, cnd_message(cnd)))
    }
  )

  x
}

matrix_to_cells <- function(j, x, j_arg) {
  if (!is_bare_logical(j)) {
    cnd_signal(error_subset_matrix_must_be_logical(j_arg))
  }
  if (!identical(dim(j), dim(x))) {
    cnd_signal(error_subset_matrix_must_have_same_dimensions(j_arg))
  }

  # Need unlist(list(...)) because apply() isn't type stable if the return
  # has the same length everywhere
  # FIXME: Faster with a C implementation?
  cells <- unlist(apply(j, 2, function(x) list(which(x))), recursive = FALSE)
  cells
}

cells_to_col_idx <- function(cells) {
  sizes <- map_int(cells, vec_size)
  col_idx <- which(sizes > 0)

  col_idx
}

# Errors ------------------------------------------------------------------

error_subset_matrix_must_be_logical <- function(j_arg) {
  tibble_error(paste0(
    "Subscript ", tick(as_label(j_arg)),
    " is a matrix, it must be of type logical."
  ))
}

error_subset_matrix_must_have_same_dimensions <- function(j_arg) {
  tibble_error(paste0(
    "Subscript ", tick(as_label(j_arg)),
    " is a matrix, it must have the same dimensions as the input."
  ))
}

error_subset_matrix_scalar_type <- function(j_arg, value_arg) {
  tibble_error(paste0(
    "Subscript ", tick(as_label(j_arg)),
    " is a matrix, the data ", tick(as_label(value_arg)),
    " must be a vector of size 1."
  ))
}

error_subset_matrix_must_be_scalar <- function(j_arg, value_arg) {
  tibble_error(paste0(
    "Subscript ", tick(as_label(j_arg)),
    " is a matrix, the data ", tick(as_label(value_arg)),
    " must have size 1."
  ))
}

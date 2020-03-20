tbl_subset_matrix <- function(x, j, j_arg) {
  cells <- matrix_to_cells(j, x, j_arg)
  col_idx <- cells_to_col_idx(cells)

  if (is_empty(col_idx)) {
    return(unspecified())
  }

  values <- map2(x[col_idx], cells[col_idx], vec_slice)

  # Also checks conformity of vectors:
  unname(vec_c(!!!values, .name_spec = ~ .x))
}

tbl_subassign_matrix <- function(x, j, value, j_arg, value_arg) {
  # FIXME: use size argument in vctrs >= 0.3.0

  if (!vec_is(value)) {
    rlang::abort(paste0("The subscript ", tick(as_label(j_arg)), " is a matrix, the data ", tick(as_label(value_arg)), " must be a vector of size 1."))
  }

  if (vec_size(value) != 1) {
    rlang::abort(paste0("The subscript ", tick(as_label(j_arg)), " is a matrix, the data ", tick(as_label(value_arg)), " must have size 1."))
  }

  cells <- matrix_to_cells(j, x, j_arg)
  col_idx <- cells_to_col_idx(cells)

  tryCatch(
    for (j in col_idx) {
      xj <- x[[j]]
      vec_slice(xj, cells[[j]]) <- value
      x[[j]] <- xj
    },

    vctrs_error_incompatible_type = function(cnd) {
      cnd_signal(error_incompatible_new_data_type(x, rep(list(value), j), j, value_arg, cnd_message(cnd)))
    }
  )

  x
}

matrix_to_cells <- function(j, x, j_arg) {
  if (!is_bare_logical(j)) {
    rlang::abort(paste0("The subscript ", tick(as_label(j_arg)), " is a matrix, it must be of type logical."))
  }
  if (!identical(dim(j), dim(x))) {
    rlang::abort(paste0("The subscript ", tick(as_label(j_arg)), " is a matrix, it must have the same dimensions as the input."))
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

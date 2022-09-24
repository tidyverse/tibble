# Errors ------------------------------------------------------------------

abort_need_rhs_vector <- function(value_arg) {
  tibble_abort(paste0(tick(as_label(value_arg)), " must be a vector, a bare list, a data frame or a matrix."))
}

abort_need_rhs_vector_or_null <- function(value_arg) {
  tibble_abort(paste0(tick(as_label(value_arg)), " must be a vector, a bare list, a data frame, a matrix, or NULL."))
}

abort_assign_columns_non_na_only <- function() {
  tibble_abort("Can't use NA as column index in a tibble for assignment.")
}

abort_subset_columns_non_missing_only <- function() {
  tibble_abort("Subscript can't be missing for tibbles in `[[`.")
}

abort_assign_columns_non_missing_only <- function() {
  tibble_abort("Subscript can't be missing for tibbles in `[[<-`.")
}

abort_duplicate_column_subscript_for_assignment <- function(j) {
  j <- unique(j[duplicated(j)])
  tibble_abort(pluralise_commas("Column index(es) ", j, " [is](are) used more than once for assignment."), j = j)
}

abort_assign_rows_non_na_only <- function() {
  tibble_abort("Can't use NA as row index in a tibble for assignment.")
}

abort_duplicate_row_subscript_for_assignment <- function(i) {
  i <- unique(i[duplicated(i)])
  tibble_abort(pluralise_commas("Row index(es) ", i, " [is](are) used more than once for assignment."), i = i)
}

abort_assign_incompatible_size <- function(nrow, value, j, i_arg, value_arg, parent = NULL, call = my_caller_env()) {
  if (is.null(i_arg)) {
    target <- "existing data"
    existing <- pluralise_count("Existing data has ", nrow, " row(s)")
  } else {
    target <- paste0("row subscript ", tick(as_label(i_arg)))
    existing <- pluralise_count("", nrow, " row(s) must be assigned")
  }

  new <- paste0(pluralise_count("has ", vec_size(value[[j]]), " row(s)"))
  if (length(value) != 1) {
    new <- paste0("Element ", j, " of assigned data ", new)
  } else {
    new <- paste0("Assigned data ", new)
  }

  tibble_abort(
    bullets(
      paste0("Assigned data ", tick(as_label(value_arg)), " must be compatible with ", target, ":"),
      x = existing,
      x = new,
      i = if (nrow != 1) "Only vectors of size 1 are recycled",
      i = if (nrow == 1 && vec_size(value[[j]]) != 1) "Row updates require a list value. Do you need `list()` or `as.list()`?"
    ),
    expected = nrow,
    actual = vec_size(value[[j]]),
    j = j,
    parent = parent,
    call = call
  )
}

abort_assign_incompatible_type <- function(x, value, j, value_arg, parent = NULL, call = my_caller_env()) {
  name <- names(x)[[j]]

  tibble_abort(
    bullets(
      paste0("Assigned data ", tick(as_label(value_arg)), " must be compatible with existing data:"),
      i = paste0("Error occurred for column ", tick(name))
    ),
    expected = x[[j]],
    actual = value[[j]],
    name = name,
    j = j,
    parent = parent,
    call = call
  )
}

abort_assign_vector <- function(value, j, value_arg, parent = NULL, call = my_caller_env()) {
  tibble_abort(
    paste0("Assigned data ", tick(as_label(value_arg)), " must be a vector."),
    actual = value[[j]],
    j = j,
    parent = parent,
    call = call
  )
}

# Subclassing errors ------------------------------------------------------

subclass_col_index_errors <- function(expr, j_arg, assign) {
  withCallingHandlers(
    expr,
    vctrs_error_subscript = function(cnd) {
      cnd$subscript_arg <- j_arg
      cnd$subscript_elt <- "column"
      if (isTRUE(assign) && !isTRUE(cnd$subscript_action %in% c("negate"))) {
        cnd$subscript_action <- "assign"
      }
      cnd_signal(cnd)
    }
  )
}

subclass_row_index_errors <- function(expr, i_arg, assign) {
  withCallingHandlers(
    expr,
    vctrs_error_subscript = function(cnd) {
      cnd$subscript_arg <- i_arg
      cnd$subscript_elt <- "row"
      if (isTRUE(assign) && !isTRUE(cnd$subscript_action %in% c("negate"))) {
        cnd$subscript_action <- "assign"
      }
      cnd_signal(cnd)
    }
  )
}

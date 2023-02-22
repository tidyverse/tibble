vectbl_as_col_subscript <- function(j, j_arg, assign = FALSE, call = caller_env()) {
  subclass_col_index_errors(
    vec_as_subscript(j, call = call),
    j_arg = j_arg,
    assign = assign
  )
}

is_tight_sequence_at_end <- function(i_new, n) {
  all(sort(i_new) == seq2(n + 1, n + length(i_new)))
}

vectbl_wrap_rhs_col <- function(value, value_arg, call = caller_env()) {
  if (is.null(value)) {
    return(list(value))
  }

  value <- result_vectbl_wrap_rhs(value)
  if (is.null(value)) {
    abort_need_rhs_vector_or_null(value_arg, call)
  }

  value
}

vectbl_wrap_rhs_row <- function(value, value_arg, call = caller_env()) {
  value <- result_vectbl_wrap_rhs(value)
  if (is.null(value)) {
    abort_need_rhs_vector(value_arg, call)
  }

  value
}

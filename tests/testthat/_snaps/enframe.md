# output test

    Code
      enframe(1:3, value = NULL)
    Error <tibble_error_enframe_value_null>
      `value` can't be NULL.
    Code
      enframe(Titanic)
    Error <tibble_error_enframe_has_dim>
      `x` must not have more than one dimension. `length(dim(x))` must be zero or one, not 4.


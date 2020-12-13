# output test

    Code
      expect_error_verbose(enframe(1:3, value = NULL))
    Output
      <error/tibble_error_enframe_value_null>
      `value` can't be NULL.
      Backtrace:
        1. expect_error_verbose(enframe(1:3, value = NULL))
       14. tibble::enframe(1:3, value = NULL)
    Code
      expect_error_verbose(enframe(Titanic))
    Output
      <error/tibble_error_enframe_has_dim>
      `x` must not have more than one dimension. `length(dim(x))` must be zero or one, not 4.
      Backtrace:
        1. expect_error_verbose(enframe(Titanic))
       14. tibble::enframe(Titanic)


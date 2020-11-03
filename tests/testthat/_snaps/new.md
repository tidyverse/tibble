# output test

    Code
      new_tibble(1:3, nrow = 1)
    Error <tibble_error_new_tibble_must_be_list>
      `x` must be a list.
    Code
      new_tibble(as.list(1:3))
    Warning <lifecycle_warning_deprecated>
      The `nrow` argument of `new_tibble()` can't be missing as of tibble 2.0.0.
      `x` must be a scalar integer.
    Error <tibble_error_names_must_be_non_null>
      `names` must not be `NULL`.


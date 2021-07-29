# output test

    Code
      new_tibble(1:3, nrow = 1)
    Error <tibble_error_new_tibble_must_be_list>
      `x` must be a list.
    Code
      new_tibble(as.list(1:3))
    Error <tibble_error_names_must_be_non_null>
      `names` must not be `NULL`.


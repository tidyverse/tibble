# output test

    Code
      tibble(a = 1, a = 1)
    Error <tibble_error_column_names_must_be_unique>
      Column name `a` must not be duplicated.
      Use .name_repair to specify repair.
    Code
      tibble(a = new_environment())
    Error <tibble_error_column_scalar_type>
      All columns in a tibble must be vectors.
      x Column `a` is an environment.
    Code
      tibble(a = 1, b = 2:3, c = 4:6, d = 7:10)
    Error <tibble_error_incompatible_size>
      Tibble columns must have compatible sizes.
      * Size 2: Existing data.
      * Size 3: Column `c`.
      i Only values of size one are recycled.


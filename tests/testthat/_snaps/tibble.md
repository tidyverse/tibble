# output test

    Code
      tibble(a = 1, a = 1)
    Condition
      Error in `error_column_names_must_be_unique()`:
      ! could not find function "error_column_names_must_be_unique"
    Code
      tibble(a = new_environment())
    Condition
      Error in `tibble()`:
      ! All columns in a tibble must be vectors.
      x Column `a` is an environment.
    Code
      tibble(a = 1, b = 2:3, c = 4:6, d = 7:10)
    Condition
      Error in `tibble()`:
      ! Tibble columns must have compatible sizes.
      * Size 2: Existing data.
      * Size 3: Column `c`.
      i Only values of size one are recycled.


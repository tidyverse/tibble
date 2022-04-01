# output test

    Code
      tibble(a = 1, a = 1)
    Condition
      Error:
      ! Column name `a` must not be duplicated.
      Use .name_repair to specify repair.
      Caused by error in `repaired_names()`:
      ! Names must be unique.
      x These names are duplicated:
        * "a" at locations 1 and 2.
    Code
      tibble(a = new_environment())
    Condition
      Error:
      ! All columns in a tibble must be vectors.
      x Column `a` is an environment.
    Code
      tibble(a = 1, b = 2:3, c = 4:6, d = 7:10)
    Condition
      Error:
      ! Tibble columns must have compatible sizes.
      * Size 2: Existing data.
      * Size 3: Column `c`.
      i Only values of size one are recycled.


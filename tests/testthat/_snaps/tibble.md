# output test

    Code
      tibble(a = 1, a = 1)
    Condition
      Error in `tibble()`:
      ! Column name `a` must not be duplicated.
      Use `.name_repair` to specify repair.
      Caused by error in `repaired_names()`:
      ! Names must be unique.
      x These names are duplicated:
        * "a" at locations 1 and 2.
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
    Code
      tibble(a = 1:3, .rows = c(1L, 5L))
    Condition
      Error in `tibble()`:
      ! `.rows` must be `NULL` or a single nonnegative whole number.
      x `.rows` is c(1L, 5L).
    Code
      tibble(a = 1:3, .rows = 1.5)
    Condition
      Error in `tibble()`:
      ! `.rows` must be `NULL` or a single nonnegative whole number.
      x `.rows` is 1.5.
    Code
      tibble(.rows = -1)
    Condition
      Error in `tibble()`:
      ! `.rows` must be `NULL` or a single nonnegative whole number.
      x `.rows` is -1.


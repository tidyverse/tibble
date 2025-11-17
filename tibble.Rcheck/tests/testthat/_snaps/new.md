# output test

    Code
      new_tibble(1:3, nrow = 1)
    Condition
      Error in `new_tibble()`:
      ! `x` must be a list.
    Code
      new_tibble(as.list(1:3))
    Condition
      Error in `new_tibble()`:
      ! `names` must not be `NULL`.


# output test

    Code
      as_tibble(list(1))
    Condition
      Error:
      ! Column 1 must be named.
      Use .name_repair to specify repair.
      Caused by error in `stop_vctrs()`:
      ! Names can't be empty.
      x Empty name found at location 1.
    Code
      as_tibble(list(1, 2))
    Condition
      Error:
      ! Columns 1 and 2 must be named.
      Use .name_repair to specify repair.
      Caused by error in `stop_vctrs()`:
      ! Names can't be empty.
      x Empty names found at locations 1 and 2.
    Code
      as_tibble(list(a = 1, 2))
    Condition
      Error:
      ! Column 2 must be named.
      Use .name_repair to specify repair.
      Caused by error in `stop_vctrs()`:
      ! Names can't be empty.
      x Empty name found at location 2.
    Code
      as_tibble(as.list(1:26))
    Condition
      Error:
      ! Columns 1, 2, 3, 4, 5, and 21 more must be named.
      Use .name_repair to specify repair.
      Caused by error in `stop_vctrs()`:
      ! Names can't be empty.
      x Empty names found at locations 1, 2, 3, 4, 5, etc.
    Code
      as_tibble(set_names(list(1), "..1"))
    Condition
      Error:
      ! Column 1 must not have names of the form ... or ..j.
      Use .name_repair to specify repair.
      Caused by error in `stop_vctrs()`:
      ! Names can't be of the form `...` or `..j`.
      x These names are invalid:
        * "..1" at location 1.
    Code
      as_tibble(set_names(list(1:26), paste0("..", 1:26)))
    Condition
      Error in `set_names()`:
      ! The size of `nm` (26) must be compatible with the size of `x` (1).
    Code
      as_tibble(list(a = 1, a = 1))
    Condition
      Error:
      ! Column name `a` must not be duplicated.
      Use .name_repair to specify repair.
      Caused by error in `stop_vctrs()`:
      ! Names must be unique.
      x These names are duplicated:
        * "a" at locations 1 and 2.
    Code
      as_tibble(list(a = 1, a = 1, b = 1, b = 1))
    Condition
      Error:
      ! Column names `a` and `b` must not be duplicated.
      Use .name_repair to specify repair.
      Caused by error in `stop_vctrs()`:
      ! Names must be unique.
      x These names are duplicated:
        * "a" at locations 1 and 2.
        * "b" at locations 3 and 4.
    Code
      as_tibble(list(a = new_environment()))
    Condition
      Error:
      ! All columns in a tibble must be vectors.
      x Column `a` is an environment.
    Code
      as_tibble_row(list(1))
    Condition
      Error:
      ! Column 1 must be named.
      Use .name_repair to specify repair.
      Caused by error in `stop_vctrs()`:
      ! Names can't be empty.
      x Empty name found at location 1.
    Code
      as_tibble_row(list(1, 2))
    Condition
      Error:
      ! Columns 1 and 2 must be named.
      Use .name_repair to specify repair.
      Caused by error in `stop_vctrs()`:
      ! Names can't be empty.
      x Empty names found at locations 1 and 2.
    Code
      as_tibble_row(list(a = 1, 2))
    Condition
      Error:
      ! Column 2 must be named.
      Use .name_repair to specify repair.
      Caused by error in `stop_vctrs()`:
      ! Names can't be empty.
      x Empty name found at location 2.
    Code
      as_tibble_row(as.list(1:26))
    Condition
      Error:
      ! Columns 1, 2, 3, 4, 5, and 21 more must be named.
      Use .name_repair to specify repair.
      Caused by error in `stop_vctrs()`:
      ! Names can't be empty.
      x Empty names found at locations 1, 2, 3, 4, 5, etc.
    Code
      as_tibble_row(set_names(list(1), "..1"))
    Condition
      Error:
      ! Column 1 must not have names of the form ... or ..j.
      Use .name_repair to specify repair.
      Caused by error in `stop_vctrs()`:
      ! Names can't be of the form `...` or `..j`.
      x These names are invalid:
        * "..1" at location 1.
    Code
      as_tibble_row(set_names(list(1:26), paste0("..", 1:26)))
    Condition
      Error in `set_names()`:
      ! The size of `nm` (26) must be compatible with the size of `x` (1).
    Code
      as_tibble_row(list(a = 1, a = 1))
    Condition
      Error:
      ! Column name `a` must not be duplicated.
      Use .name_repair to specify repair.
      Caused by error in `stop_vctrs()`:
      ! Names must be unique.
      x These names are duplicated:
        * "a" at locations 1 and 2.
    Code
      as_tibble_row(list(a = 1, a = 1, b = 1, b = 1))
    Condition
      Error:
      ! Column names `a` and `b` must not be duplicated.
      Use .name_repair to specify repair.
      Caused by error in `stop_vctrs()`:
      ! Names must be unique.
      x These names are duplicated:
        * "a" at locations 1 and 2.
        * "b" at locations 3 and 4.
    Code
      as_tibble_row(list(a = new_environment()))
    Condition
      Error in `stop_vctrs()`:
      ! Input must be a vector, not an environment.
    Code
      as_tibble_row(list(a = 1:3))
    Condition
      Error:
      ! All elements must be size one, use `list()` to wrap.
      x Element `a` is of size 3.
    Code
      as_tibble_row(list(a = 1:3, b = 1:3))
    Condition
      Error:
      ! All elements must be size one, use `list()` to wrap.
      x Element `a` is of size 3.
      x Element `b` is of size 3.


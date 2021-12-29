# output test

    Code
      as_tibble(list(1))
    Error <tibble_error_column_names_cannot_be_empty>
      Column 1 must be named.
      Use .name_repair to specify repair.
    Code
      as_tibble(list(1, 2))
    Error <tibble_error_column_names_cannot_be_empty>
      Columns 1 and 2 must be named.
      Use .name_repair to specify repair.
    Code
      as_tibble(list(a = 1, 2))
    Error <tibble_error_column_names_cannot_be_empty>
      Column 2 must be named.
      Use .name_repair to specify repair.
    Code
      as_tibble(as.list(1:26))
    Error <tibble_error_column_names_cannot_be_empty>
      Columns 1, 2, 3, 4, 5, and 21 more must be named.
      Use .name_repair to specify repair.
    Code
      as_tibble(set_names(list(1), "..1"))
    Error <tibble_error_column_names_cannot_be_dot_dot>
      Column 1 must not have names of the form ... or ..j.
      Use .name_repair to specify repair.
    Code
      as_tibble(set_names(list(1:26), paste0("..", 1:26)))
    Error <rlang_error>
      `nm` must be `NULL` or a character vector the same length as `x`
    Code
      as_tibble(list(a = 1, a = 1))
    Error <tibble_error_column_names_must_be_unique>
      Column name `a` must not be duplicated.
      Use .name_repair to specify repair.
    Code
      as_tibble(list(a = 1, a = 1, b = 1, b = 1))
    Error <tibble_error_column_names_must_be_unique>
      Column names `a` and `b` must not be duplicated.
      Use .name_repair to specify repair.
    Code
      as_tibble(list(a = new_environment()))
    Error <tibble_error_column_scalar_type>
      All columns in a tibble must be vectors.
      x Column `a` is an environment.
    Code
      as_tibble_row(list(1))
    Error <tibble_error_column_names_cannot_be_empty>
      Column 1 must be named.
      Use .name_repair to specify repair.
    Code
      as_tibble_row(list(1, 2))
    Error <tibble_error_column_names_cannot_be_empty>
      Columns 1 and 2 must be named.
      Use .name_repair to specify repair.
    Code
      as_tibble_row(list(a = 1, 2))
    Error <tibble_error_column_names_cannot_be_empty>
      Column 2 must be named.
      Use .name_repair to specify repair.
    Code
      as_tibble_row(as.list(1:26))
    Error <tibble_error_column_names_cannot_be_empty>
      Columns 1, 2, 3, 4, 5, and 21 more must be named.
      Use .name_repair to specify repair.
    Code
      as_tibble_row(set_names(list(1), "..1"))
    Error <tibble_error_column_names_cannot_be_dot_dot>
      Column 1 must not have names of the form ... or ..j.
      Use .name_repair to specify repair.
    Code
      as_tibble_row(set_names(list(1:26), paste0("..", 1:26)))
    Error <rlang_error>
      `nm` must be `NULL` or a character vector the same length as `x`
    Code
      as_tibble_row(list(a = 1, a = 1))
    Error <tibble_error_column_names_must_be_unique>
      Column name `a` must not be duplicated.
      Use .name_repair to specify repair.
    Code
      as_tibble_row(list(a = 1, a = 1, b = 1, b = 1))
    Error <tibble_error_column_names_must_be_unique>
      Column names `a` and `b` must not be duplicated.
      Use .name_repair to specify repair.
    Code
      as_tibble_row(list(a = new_environment()))
    Error <vctrs_error_scalar_type>
      Input must be a vector, not an environment.
    Code
      as_tibble_row(list(a = 1:3))
    Error <tibble_error_as_tibble_row_size_one>
      All elements must be size one, use `list()` to wrap.
      x Element `a` is of size 3.
    Code
      as_tibble_row(list(a = 1:3, b = 1:3))
    Error <tibble_error_as_tibble_row_size_one>
      All elements must be size one, use `list()` to wrap.
      x Element `a` is of size 3.
      x Element `b` is of size 3.


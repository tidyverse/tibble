# output test

    Code
      add_row(tibble(), a = 1)
    Condition
      Error in `error_unknown_column_names()`:
      ! could not find function "error_unknown_column_names"
    Code
      add_row(tibble(), a = 1, b = 2)
    Condition
      Error in `error_unknown_column_names()`:
      ! could not find function "error_unknown_column_names"
    Code
      add_row(tibble(), !!!set_names(letters))
    Condition
      Error in `error_unknown_column_names()`:
      ! could not find function "error_unknown_column_names"
    Code
      add_row(dplyr::group_by(tibble(a = 1), a))
    Condition
      Error in `add_row()`:
      ! Can't add rows to grouped data frames.
    Code
      add_row(tibble(a = 1), a = 2, .before = 1, .after = 1)
    Condition
      Error in `add_row()`:
      ! Can't specify both `.before` and `.after`.
    Code
      add_column(tibble(a = 1), a = 1)
    Condition
      Error in `error_column_names_must_be_unique()`:
      ! could not find function "error_column_names_must_be_unique"
    Code
      add_column(tibble(a = 1, b = 2), a = 1, b = 2)
    Condition
      Error in `error_column_names_must_be_unique()`:
      ! could not find function "error_column_names_must_be_unique"
    Code
      add_column(tibble(!!!set_names(letters)), !!!set_names(letters))
    Condition
      Error in `error_column_names_must_be_unique()`:
      ! could not find function "error_column_names_must_be_unique"
    Code
      add_column(tibble(a = 2:3), b = 4:6)
    Condition
      Error in `add_column()`:
      ! New columns must be compatible with `.data`.
      x New column has 3 rows.
      i `.data` has 2 rows.
    Code
      add_column(tibble(a = 1), b = 1, .before = 1, .after = 1)
    Condition
      Error in `add_column()`:
      ! Can't specify both `.before` and `.after`.


# output test

    Code
      rownames_to_column(mtcars, "cyl")
    Condition
      Error in `error_column_names_must_be_unique()`:
      ! could not find function "error_column_names_must_be_unique"
    Code
      rowid_to_column(trees, "Volume")
    Condition
      Error in `error_column_names_must_be_unique()`:
      ! could not find function "error_column_names_must_be_unique"
    Code
      column_to_rownames(mtcars, "cyl")
    Condition
      Error in `column_to_rownames()`:
      ! `.data` must be a data frame without row names.
    Code
      column_to_rownames(trees, "foo")
    Condition
      Error in `column_to_rownames()`:
      ! Can't find column `foo` in `.data`.


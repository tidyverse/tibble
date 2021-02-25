# output test

    Code
      rownames_to_column(mtcars, "cyl")
    Error <tibble_error_column_names_must_be_unique>
      Column name `cyl` must not be duplicated.
    Code
      rowid_to_column(iris, "Species")
    Error <tibble_error_column_names_must_be_unique>
      Column name `Species` must not be duplicated.
    Code
      column_to_rownames(mtcars, "cyl")
    Error <tibble_error_already_has_rownames>
      `.data` must be a data frame without row names.
    Code
      column_to_rownames(iris, "foo")
    Error <tibble_error_unknown_column_names>
      Can't find column `foo` in `.data`.


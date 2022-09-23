# output test

    Code
      rownames_to_column(mtcars, "cyl")
    Condition
      Error:
      ! Column name `cyl` must not be duplicated.
      Caused by error in `repaired_names()`:
      ! Names must be unique.
      x These names are duplicated:
        * "cyl" at locations 2 and 12.
    Code
      rowid_to_column(trees, "Volume")
    Condition
      Error:
      ! Column name `Volume` must not be duplicated.
      Caused by error in `repaired_names()`:
      ! Names must be unique.
      x These names are duplicated:
        * "Volume" at locations 3 and 4.
    Code
      column_to_rownames(mtcars, "cyl")
    Condition
      Error:
      ! `.data` must be a data frame without row names.
    Code
      column_to_rownames(trees, "foo")
    Condition
      Error:
      ! Can't find column `foo` in `.data`.


# output test

    Code
      # # [.tbl_df is careful about names (#1245)
      foo <- tibble(x = 1:10, y = 1:10)
      foo[c("x", "y", "z")]
    Condition
      Error in `vectbl_as_col_location()`:
      ! Can't subset columns that don't exist.
      x Column `z` doesn't exist.
    Code
      foo[c("w", "x", "y", "z")]
    Condition
      Error in `vectbl_as_col_location()`:
      ! Can't subset columns that don't exist.
      x Columns `w` and `z` don't exist.
    Code
      foo[as.matrix("x")]
    Condition
      Error:
      ! Subscript `as.matrix("x")` is a matrix, it must be of type logical.
    Code
      foo[array("x", dim = c(1, 1, 1))]
    Condition
      Error in `vectbl_as_col_location()`:
      ! Must subset columns with a valid subscript vector.
      x Subscript `array("x", dim = c(1, 1, 1))` must be a simple vector, not an array.
    Code
      # # [.tbl_df is careful about column indexes (#83)
      foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
      foo[0.5]
    Condition
      Error in `vectbl_as_col_location()`:
      ! Must subset columns with a valid subscript vector.
      x Can't convert from `j` <double> to <integer> due to loss of precision.
    Code
      foo[1:5]
    Condition
      Error in `vectbl_as_col_location()`:
      ! Can't subset columns past the end.
      i Locations 4 and 5 don't exist.
      i There are only 3 columns.
    Code
      foo[-1:1]
    Condition
      Error in `vectbl_as_col_location()`:
      ! Must subset columns with a valid subscript vector.
      x Negative and positive locations can't be mixed.
      i Subscript `-1:1` has a positive value at location 3.
    Code
      foo[c(-1, 1)]
    Condition
      Error in `vectbl_as_col_location()`:
      ! Must subset columns with a valid subscript vector.
      x Negative and positive locations can't be mixed.
      i Subscript `c(-1, 1)` has a positive value at location 2.
    Code
      foo[c(-1, NA)]
    Condition
      Error in `vectbl_as_col_location()`:
      ! Must subset columns with a valid subscript vector.
      x Negative locations can't have missing values.
      i Subscript `c(-1, NA)` has a missing value at location 2.
    Code
      foo[-4]
    Condition
      Error in `vectbl_as_col_location()`:
      ! Can't negate columns past the end.
      i Location 4 doesn't exist.
      i There are only 3 columns.
    Code
      foo[c(1:3, NA)]
    Condition
      Error:
      ! Can't use NA as column index with `[` at position 4.
    Code
      foo[as.matrix(1)]
    Condition
      Error:
      ! Subscript `as.matrix(1)` is a matrix, it must be of type logical.
    Code
      foo[array(1, dim = c(1, 1, 1))]
    Condition
      Error in `vectbl_as_col_location()`:
      ! Must subset columns with a valid subscript vector.
      x Subscript `array(1, dim = c(1, 1, 1))` must be a simple vector, not an array.
    Code
      foo[mean]
    Condition
      Error in `vectbl_as_col_location()`:
      ! Must subset columns with a valid subscript vector.
      x Subscript `mean` has the wrong type `function`.
      i It must be logical, numeric, or character.
    Code
      foo[foo]
    Condition
      Error in `vectbl_as_col_location()`:
      ! Must subset columns with a valid subscript vector.
      x Subscript `foo` has the wrong type `tbl_df<
        x: integer
        y: integer
        z: integer
      >`.
      i It must be logical, numeric, or character.
    Code
      # # [.tbl_df is careful about row indexes
      foo <- tibble(x = 1:3, y = 1:3, z = 1:3)
      foo[0.5, ]
    Condition
      Error in `vectbl_as_row_location()`:
      ! Must subset rows with a valid subscript vector.
      x Can't convert from `i` <double> to <integer> due to loss of precision.
    Code
      invisible(foo[1:5, ])
    Condition
      Warning:
      The `i` argument of `[.tbl_df` must lie in [0, rows] if positive, as of tibble 3.0.0.
      Use `NA_integer_` as row index to obtain a row full of `NA` values.
    Code
      foo[-1:1, ]
    Condition
      Error in `vectbl_as_row_location()`:
      ! Must subset rows with a valid subscript vector.
      x Negative and positive locations can't be mixed.
      i Subscript `-1:1` has a positive value at location 3.
    Code
      foo[c(-1, 1), ]
    Condition
      Error in `vectbl_as_row_location()`:
      ! Must subset rows with a valid subscript vector.
      x Negative and positive locations can't be mixed.
      i Subscript `c(-1, 1)` has a positive value at location 2.
    Code
      foo[c(-1, NA), ]
    Condition
      Error in `vectbl_as_row_location()`:
      ! Must subset rows with a valid subscript vector.
      x Negative locations can't have missing values.
      i Subscript `c(-1, NA)` has a missing value at location 2.
    Code
      invisible(foo[-4, ])
    Condition
      Warning:
      The `i` argument of `[.tbl_df` must lie in [-rows, 0] if negative, as of tibble 3.0.0.
      Use `NA_integer_` as row index to obtain a row full of `NA` values.
    Code
      foo[array(1, dim = c(1, 1, 1)), ]
    Condition
      Error in `vectbl_as_row_location()`:
      ! Must subset rows with a valid subscript vector.
      x Subscript `array(1, dim = c(1, 1, 1))` must be a simple vector, not an array.
    Code
      foo[mean, ]
    Condition
      Error in `vectbl_as_row_location()`:
      ! Must subset rows with a valid subscript vector.
      x Subscript `mean` has the wrong type `function`.
      i It must be logical, numeric, or character.
    Code
      foo[foo, ]
    Condition
      Error in `vectbl_as_row_location()`:
      ! Must subset rows with a valid subscript vector.
      x Subscript `foo` has the wrong type `tbl_df<
        x: integer
        y: integer
        z: integer
      >`.
      i It must be logical, numeric, or character.
    Code
      # # [.tbl_df is careful about column flags (#83)
      foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
      foo[c(TRUE, TRUE)]
    Condition
      Error in `vectbl_as_col_location()`:
      ! Must subset columns with a valid subscript vector.
      i Logical subscripts must match the size of the indexed input.
      x Input has size 3 but subscript `c(TRUE, TRUE)` has size 2.
    Code
      foo[c(TRUE, TRUE, FALSE, FALSE)]
    Condition
      Error in `vectbl_as_col_location()`:
      ! Must subset columns with a valid subscript vector.
      i Logical subscripts must match the size of the indexed input.
      x Input has size 3 but subscript `c(TRUE, TRUE, FALSE, FALSE)` has size 4.
    Code
      foo[c(TRUE, TRUE, NA)]
    Condition
      Error:
      ! Can't use NA as column index with `[` at position 3.
    Code
      foo[as.matrix(TRUE)]
    Condition
      Error:
      ! Subscript `as.matrix(TRUE)` is a matrix, it must have the same dimensions as the input.
    Code
      foo[array(TRUE, dim = c(1, 1, 1))]
    Condition
      Error in `vectbl_as_col_location()`:
      ! Must subset columns with a valid subscript vector.
      x Subscript `array(TRUE, dim = c(1, 1, 1))` must be a simple vector, not an array.
    Code
      # # [.tbl_df is careful about row flags
      foo <- tibble(x = 1:3, y = 1:3, z = 1:3)
      foo[c(TRUE, TRUE), ]
    Condition
      Error in `vectbl_as_row_location()`:
      ! Must subset rows with a valid subscript vector.
      i Logical subscripts must match the size of the indexed input.
      x Input has size 3 but subscript `c(TRUE, TRUE)` has size 2.
    Code
      foo[c(TRUE, TRUE, FALSE, FALSE), ]
    Condition
      Error in `vectbl_as_row_location()`:
      ! Must subset rows with a valid subscript vector.
      i Logical subscripts must match the size of the indexed input.
      x Input has size 3 but subscript `c(TRUE, TRUE, FALSE, FALSE)` has size 4.
    Code
      foo[array(TRUE, dim = c(1, 1, 1)), ]
    Condition
      Error in `vectbl_as_row_location()`:
      ! Must subset rows with a valid subscript vector.
      x Subscript `array(TRUE, dim = c(1, 1, 1))` must be a simple vector, not an array.
    Code
      # # [.tbl_df rejects unknown column indexes (#83)
      foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
      foo[list(1:3)]
    Condition
      Error in `vectbl_as_col_location()`:
      ! Must subset columns with a valid subscript vector.
      x Subscript `list(1:3)` has the wrong type `list`.
      i It must be logical, numeric, or character.
    Code
      foo[as.list(1:3)]
    Condition
      Error in `vectbl_as_col_location()`:
      ! Must subset columns with a valid subscript vector.
      x Subscript `as.list(1:3)` has the wrong type `list`.
      i It must be logical, numeric, or character.
    Code
      foo[factor(1:3)]
    Condition
      Error in `vectbl_as_col_location()`:
      ! Can't subset columns that don't exist.
      x Columns `1`, `2`, and `3` don't exist.
    Code
      foo[Sys.Date()]
    Condition
      Error in `vectbl_as_col_location()`:
      ! Must subset columns with a valid subscript vector.
      x Subscript `Sys.Date()` has the wrong type `date`.
      i It must be logical, numeric, or character.
    Code
      # # [.tbl_df rejects unknown row indexes
      foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
      foo[list(1:3), ]
    Condition
      Error in `vectbl_as_row_location()`:
      ! Must subset rows with a valid subscript vector.
      x Subscript `list(1:3)` has the wrong type `list`.
      i It must be logical, numeric, or character.
    Code
      foo[as.list(1:3), ]
    Condition
      Error in `vectbl_as_row_location()`:
      ! Must subset rows with a valid subscript vector.
      x Subscript `as.list(1:3)` has the wrong type `list`.
      i It must be logical, numeric, or character.
    Code
      foo[factor(1:3), ]
    Condition
      Error in `vec_as_location()`:
      ! Can't use character names to index an unnamed vector.
    Code
      foo[Sys.Date(), ]
    Condition
      Error in `vectbl_as_row_location()`:
      ! Must subset rows with a valid subscript vector.
      x Subscript `Sys.Date()` has the wrong type `date`.
      i It must be logical, numeric, or character.
    Code
      # # [.tbl_df and matrix subsetting
      foo <- tibble(a = 1:3, b = letters[1:3])
      foo[is.na(foo)]
    Output
      <unspecified> [0]
    Code
      foo[!is.na(foo)]
    Condition
      Error:
      ! Can't combine `a` <integer> and `b` <character>.
    Code
      foo[as.matrix("x")]
    Condition
      Error:
      ! Subscript `as.matrix("x")` is a matrix, it must be of type logical.
    Code
      foo[array("x", dim = c(1, 1, 1))]
    Condition
      Error in `vectbl_as_col_location()`:
      ! Must subset columns with a valid subscript vector.
      x Subscript `array("x", dim = c(1, 1, 1))` must be a simple vector, not an array.
    Code
      # # [.tbl_df and OOB indexing
      foo <- tibble(a = 1:3, b = letters[1:3])
      invisible(foo[3:5, ])
    Condition
      Warning:
      The `i` argument of `[.tbl_df` must lie in [0, rows] if positive, as of tibble 3.0.0.
      Use `NA_integer_` as row index to obtain a row full of `NA` values.
    Code
      invisible(foo[-(3:5), ])
    Condition
      Warning:
      The `i` argument of `[.tbl_df` must lie in [-rows, 0] if negative, as of tibble 3.0.0.
      Use `NA_integer_` as row index to obtain a row full of `NA` values.
    Code
      invisible(foo["x", ])
    Condition
      Warning:
      The `i` argument of `[.tbl_df` must use valid row names as of tibble 3.0.0.
      Use `NA_integer_` as row index to obtain a row full of `NA` values.
    Code
      # # [.tbl_df and logical recycling
      foo <- tibble(a = 1:4, b = a)
      foo[c(TRUE, FALSE), ]
    Condition
      Error in `vectbl_as_row_location()`:
      ! Must subset rows with a valid subscript vector.
      i Logical subscripts must match the size of the indexed input.
      x Input has size 4 but subscript `c(TRUE, FALSE)` has size 2.
    Code
      # # [[.tbl_df rejects invalid column indexes
      foo <- tibble(x = 1:10, y = 1:10)
      foo[[]]
    Condition
      Error:
      ! Subscript can't be missing for tibbles in `[[`.
    Code
      foo[[, 1]]
    Condition
      Error:
      ! Subscript can't be missing for tibbles in `[[`.
    Code
      foo[[1, ]]
    Condition
      Error:
      ! Subscript can't be missing for tibbles in `[[`.
    Code
      foo[[, ]]
    Condition
      Error:
      ! Subscript can't be missing for tibbles in `[[`.
    Code
      foo[[1:3]]
    Condition
      Error in `vectbl_as_col_location2()`:
      ! Must extract column with a single valid subscript.
      x Subscript `1:3` has size 3 but must be size 1.
    Code
      foo[[letters[1:3]]]
    Condition
      Error in `vectbl_as_col_location2()`:
      ! Must extract column with a single valid subscript.
      x Subscript `letters[1:3]` has size 3 but must be size 1.
    Code
      foo[[TRUE]]
    Condition
      Error in `vectbl_as_col_location2()`:
      ! Must extract column with a single valid subscript.
      x Subscript `TRUE` has the wrong type `logical`.
      i It must be numeric or character.
    Code
      foo[[-1]]
    Condition
      Error in `vectbl_as_col_location2()`:
      ! Must extract column with a single valid subscript.
      x Subscript `-1` has value -1 but must be a positive location.
    Code
      foo[[1.5]]
    Condition
      Error in `vectbl_as_col_location2()`:
      ! Must extract column with a single valid subscript.
      x Subscript `1.5` has the wrong type `double`.
      i It must be numeric or character.
    Code
      foo[[3]]
    Condition
      Error in `vec_as_location2_result()`:
      ! Can't subset columns past the end.
      i Location 3 doesn't exist.
      i There are only 2 columns.
    Code
      foo[[Inf]]
    Condition
      Error in `vectbl_as_col_location2()`:
      ! Must extract column with a single valid subscript.
      x Subscript `Inf` has the wrong type `double`.
      i It must be numeric or character.
    Code
      foo[[mean]]
    Condition
      Error in `vectbl_as_col_location2()`:
      ! Must extract column with a single valid subscript.
      x Subscript `mean` has the wrong type `function`.
      i It must be numeric or character.
    Code
      foo[[foo]]
    Condition
      Error:
      ! Must extract column with a single valid subscript.
      x Subscript `foo` has the wrong type `tbl_df<
        x: integer
        y: integer
      >`.
      i It must be numeric or character.
    Code
      # # [[.tbl_df throws error with NA index
      foo <- tibble(x = 1:10, y = 1:10)
      foo[[NA]]
    Condition
      Error in `vectbl_as_col_location2()`:
      ! Must extract column with a single valid subscript.
      x Subscript `NA` can't be `NA`.
    Code
      # # $.tbl_df and partial matching/invalid columns
      foo <- tibble(data = 1:10)
      foo$d
    Condition
      Warning:
      Unknown or uninitialised column: `d`.
    Output
      NULL
    Code
      foo$e
    Condition
      Warning:
      Unknown or uninitialised column: `e`.
    Output
      NULL
    Code
      # # [<-.tbl_df rejects unknown column indexes (#83)
      foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
      foo[list(1:3)] <- 1
    Condition
      Error in `vectbl_as_col_location()`:
      ! Must assign to columns with a valid subscript vector.
      x Subscript `list(1:3)` has the wrong type `list`.
      i It must be logical, numeric, or character.
    Code
      foo[as.list(1:3)] <- 1
    Condition
      Error in `vectbl_as_col_location()`:
      ! Must assign to columns with a valid subscript vector.
      x Subscript `as.list(1:3)` has the wrong type `list`.
      i It must be logical, numeric, or character.
    Code
      foo[factor(1:3)] <- 1
    Condition
      Error in `vectbl_as_col_location()`:
      ! Can't assign to columns that don't exist.
      x Columns `1`, `2`, and `3` don't exist.
    Code
      foo[Sys.Date()] <- 1
    Condition
      Error in `vectbl_as_col_location()`:
      ! Must assign to columns with a valid subscript vector.
      x Subscript `Sys.Date()` has the wrong type `date`.
      i It must be logical, numeric, or character.
    Code
      # # [.tbl_df emits lifecycle warnings with one-column matrix indexes (#760)
      foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
      invisible(foo[matrix(1:2, ncol = 1), ])
    Condition
      Warning:
      The `i` argument of `[` can't be a matrix as of tibble 3.0.0.
      Convert to a vector.
    Code
      invisible(foo[matrix(rep(TRUE, 10), ncol = 1), ])
    Condition
      Warning:
      The `i` argument of `[` can't be a matrix as of tibble 3.0.0.
      Convert to a vector.
    Code
      # # [<-.tbl_df rejects unknown row indexes
      foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
      foo[list(1:3), ] <- 1
    Condition
      Error in `vectbl_as_row_location()`:
      ! Must assign to rows with a valid subscript vector.
      x Subscript `list(1:3)` has the wrong type `list`.
      i It must be logical, numeric, or character.
    Code
      foo[as.list(1:3), ] <- 1
    Condition
      Error in `vectbl_as_row_location()`:
      ! Must assign to rows with a valid subscript vector.
      x Subscript `as.list(1:3)` has the wrong type `list`.
      i It must be logical, numeric, or character.
    Code
      foo[factor(1:3), ] <- 1
    Condition
      Error in `vec_as_location()`:
      ! Can't use character names to index an unnamed vector.
    Code
      foo[Sys.Date(), ] <- 1
    Condition
      Error in `vectbl_as_row_location()`:
      ! Must assign to rows with a valid subscript vector.
      x Subscript `Sys.Date()` has the wrong type `date`.
      i It must be logical, numeric, or character.
    Code
      # # [<-.tbl_df throws an error with duplicate indexes (#658)
      df <- tibble(x = 1:2, y = x)
      df[c(1, 1)] <- 3
    Condition
      Error:
      ! Column index 1 is used more than once for assignment.
    Code
      df[, c(1, 1)] <- 3
    Condition
      Error:
      ! Column index 1 is used more than once for assignment.
    Code
      df[c(1, 1), ] <- 3
    Condition
      Error:
      ! Row index 1 is used more than once for assignment.
    Code
      # # [<-.tbl_df throws an error with NA indexes
      df <- tibble(x = 1:2, y = x)
      df[NA] <- 3
    Condition
      Error:
      ! Can't use NA as column index with `[` at positions 1 and 2.
    Code
      df[NA, ] <- 3
    Condition
      Error:
      ! Can't use NA as row index in a tibble for assignment.
    Code
      # # [<-.tbl_df and logical indexes
      df <- tibble(x = 1:2, y = x)
      df[FALSE] <- 1
      df
    Output
      # A tibble: 2 x 2
            x     y
        <int> <int>
      1     1     1
      2     2     2
    Code
      df[, TRUE] <- 2
      df
    Output
      # A tibble: 2 x 2
            x     y
        <dbl> <dbl>
      1     2     2
      2     2     2
    Code
      # # [<-.tbl_df throws an error with bad RHS
      df <- tibble(x = 1:2, y = x)
      df[] <- mean
    Condition
      Error:
      ! `mean` must be a vector, a bare list, a data frame, a matrix, or NULL.
    Code
      df[] <- lm(y ~ x, df)
    Condition
      Error:
      ! `lm(y ~ x, df)` must be a vector, a bare list, a data frame, a matrix, or NULL.
    Code
      # # [<-.tbl_df throws an error with OOB assignment
      df <- tibble(x = 1:2, y = x)
      df[4:5] <- 3
    Condition
      Error in `numtbl_as_col_location_assign()`:
      ! Can't assign to columns beyond the end with non-consecutive locations.
      i Input has size 2.
      x Subscript `4:5` contains non-consecutive location 4.
    Code
      df[4:5, ] <- 3
    Condition
      Error in `numtbl_as_row_location_assign()`:
      ! Can't assign to rows beyond the end with non-consecutive locations.
      i Input has size 2.
      x Subscript `4:5` contains non-consecutive location 4.
    Code
      df[-4, ] <- 3
    Condition
      Error in `numtbl_as_row_location_assign()`:
      ! Can't negate rows past the end.
      i Location 4 doesn't exist.
      i There are only 2 rows.
    Code
      df[-(4:5), ] <- 3
    Condition
      Error in `numtbl_as_row_location_assign()`:
      ! Can't negate rows past the end.
      i Locations 4 and 5 don't exist.
      i There are only 2 rows.
    Code
      # # [<-.tbl_df and recycling
      df <- tibble(x = 1:3, y = x, z = y)
      df[1:2] <- list(0, 0, 0)
    Condition
      Error in `vectbl_as_new_col_index()`:
      ! Can't recycle `list(0, 0, 0)` (size 3) to size 2.
    Code
      df[] <- list(0, 0)
    Condition
      Error in `vectbl_recycle_rhs_cols()`:
      ! Can't recycle input of size 2 to size 3.
    Code
      df[1, ] <- 1:3
    Condition
      Error:
      ! Assigned data `1:3` must be compatible with row subscript `1`.
      x 1 row must be assigned.
      x Assigned data has 3 rows.
      i Row updates require a list value. Do you need `list()` or `as.list()`?
    Code
      df[1:2, ] <- 1:3
    Condition
      Error:
      ! Assigned data `1:3` must be compatible with row subscript `1:2`.
      x 2 rows must be assigned.
      x Assigned data has 3 rows.
      i Only vectors of size 1 are recycled.
    Code
      df[, ] <- 1:2
    Condition
      Error:
      ! Assigned data `1:2` must be compatible with existing data.
      x Existing data has 3 rows.
      x Assigned data has 2 rows.
      i Only vectors of size 1 are recycled.
    Code
      df[1, ] <- list(a = 1:3, b = 1)
    Condition
      Error in `vectbl_recycle_rhs_cols()`:
      ! Can't recycle input of size 2 to size 3.
    Code
      df[1, ] <- list(a = 1, b = 1:3)
    Condition
      Error in `vectbl_recycle_rhs_cols()`:
      ! Can't recycle input of size 2 to size 3.
    Code
      df[1:2, ] <- list(a = 1:3, b = 1)
    Condition
      Error in `vectbl_recycle_rhs_cols()`:
      ! Can't recycle input of size 2 to size 3.
    Code
      df[1:2, ] <- list(a = 1, b = 1:3)
    Condition
      Error in `vectbl_recycle_rhs_cols()`:
      ! Can't recycle input of size 2 to size 3.
    Code
      df[1, 1:2] <- list(a = 1:3, b = 1)
    Condition
      Error:
      ! Assigned data `list(a = 1:3, b = 1)` must be compatible with row subscript `1`.
      x 1 row must be assigned.
      x Element 1 of assigned data has 3 rows.
      i Row updates require a list value. Do you need `list()` or `as.list()`?
    Code
      df[1, 1:2] <- list(a = 1, b = 1:3)
    Condition
      Error:
      ! Assigned data `list(a = 1, b = 1:3)` must be compatible with row subscript `1`.
      x 1 row must be assigned.
      x Element 2 of assigned data has 3 rows.
      i Row updates require a list value. Do you need `list()` or `as.list()`?
    Code
      df[1:2, 1:2] <- list(a = 1:3, b = 1)
    Condition
      Error:
      ! Assigned data `list(a = 1:3, b = 1)` must be compatible with row subscript `1:2`.
      x 2 rows must be assigned.
      x Element 1 of assigned data has 3 rows.
      i Only vectors of size 1 are recycled.
    Code
      df[1:2, 1:2] <- list(a = 1, b = 1:3)
    Condition
      Error:
      ! Assigned data `list(a = 1, b = 1:3)` must be compatible with row subscript `1:2`.
      x 2 rows must be assigned.
      x Element 2 of assigned data has 3 rows.
      i Only vectors of size 1 are recycled.
    Code
      df[1, ] <- list(a = 1:3, b = 1, c = 1:3)
    Condition
      Error:
      ! Assigned data `list(a = 1:3, b = 1, c = 1:3)` must be compatible with row subscript `1`.
      x 1 row must be assigned.
      x Element 1 of assigned data has 3 rows.
      i Row updates require a list value. Do you need `list()` or `as.list()`?
    Code
      df[1, ] <- list(a = 1, b = 1:3, c = 1:3)
    Condition
      Error:
      ! Assigned data `list(a = 1, b = 1:3, c = 1:3)` must be compatible with row subscript `1`.
      x 1 row must be assigned.
      x Element 2 of assigned data has 3 rows.
      i Row updates require a list value. Do you need `list()` or `as.list()`?
    Code
      df[1:2, ] <- list(a = 1:3, b = 1, c = 1:3)
    Condition
      Error:
      ! Assigned data `list(a = 1:3, b = 1, c = 1:3)` must be compatible with row subscript `1:2`.
      x 2 rows must be assigned.
      x Element 1 of assigned data has 3 rows.
      i Only vectors of size 1 are recycled.
    Code
      df[1:2, ] <- list(a = 1, b = 1:3, c = 1:3)
    Condition
      Error:
      ! Assigned data `list(a = 1, b = 1:3, c = 1:3)` must be compatible with row subscript `1:2`.
      x 2 rows must be assigned.
      x Element 2 of assigned data has 3 rows.
      i Only vectors of size 1 are recycled.
    Code
      # # [<-.tbl_df and coercion
      df <- tibble(x = 1:3, y = letters[1:3], z = as.list(1:3))
      df[1:3, 1:2] <- df[2:3]
    Condition
      Error:
      ! Assigned data `df[2:3]` must be compatible with existing data.
      i Error occurred for column `x`.
      x Can't convert <character> to <integer>.
    Code
      df[1:3, 1:2] <- df[1]
    Condition
      Error:
      ! Assigned data `df[1]` must be compatible with existing data.
      i Error occurred for column `y`.
      x Can't convert <integer> to <character>.
    Code
      df[1:3, 1:2] <- df[[1]]
    Condition
      Error:
      ! Assigned data `df[[1]]` must be compatible with existing data.
      i Error occurred for column `y`.
      x Can't convert <integer> to <character>.
    Code
      df[1:3, 1:3] <- df[3:1]
    Condition
      Error:
      ! Assigned data `df[3:1]` must be compatible with existing data.
      i Error occurred for column `x`.
      x Can't convert <list> to <integer>.
    Code
      df[1:3, 1:3] <- NULL
    Condition
      Error:
      ! `NULL` must be a vector, a bare list, a data frame or a matrix.
    Code
      # # [<-.tbl_df and overwriting NA
      df <- tibble(x = rep(NA, 3), z = matrix(NA, ncol = 2, dimnames = list(NULL, c(
        "a", "b"))))
      df[1, "x"] <- 5
      df[1, "z"] <- 5
      df
    Output
      # A tibble: 3 x 2
            x z[,"a"] [,"b"]
        <dbl>   <dbl>  <dbl>
      1     5       5      5
      2    NA      NA     NA
      3    NA      NA     NA
    Code
      # # [<-.tbl_df and overwriting with NA
      df <- tibble(a = TRUE, b = 1L, c = sqrt(2), d = 0+3i + 1, e = "e", f = raw(1),
      g = tibble(x = 1, y = 1), h = matrix(1:3, nrow = 1))
      df[FALSE, "a"] <- NA
      df[FALSE, "b"] <- NA
      df[FALSE, "c"] <- NA
      df[FALSE, "d"] <- NA
      df[FALSE, "e"] <- NA
      df[FALSE, "f"] <- NA
      df[FALSE, "g"] <- NA
      df[FALSE, "h"] <- NA
      df
    Output
      # A tibble: 1 x 8
        a         b     c d     e     f       g$x    $y h[,1]  [,2]  [,3]
        <lgl> <int> <dbl> <cpl> <chr> <raw> <dbl> <dbl> <int> <int> <int>
      1 TRUE      1  1.41 1+3i  e     00        1     1     1     2     3
    Code
      df[integer(), "a"] <- NA
      df[integer(), "b"] <- NA
      df[integer(), "c"] <- NA
      df[integer(), "d"] <- NA
      df[integer(), "e"] <- NA
      df[integer(), "f"] <- NA
      df[integer(), "g"] <- NA
      df[integer(), "h"] <- NA
      df
    Output
      # A tibble: 1 x 8
        a         b     c d     e     f       g$x    $y h[,1]  [,2]  [,3]
        <lgl> <int> <dbl> <cpl> <chr> <raw> <dbl> <dbl> <int> <int> <int>
      1 TRUE      1  1.41 1+3i  e     00        1     1     1     2     3
    Code
      df[1, "a"] <- NA
      df[1, "b"] <- NA
      df[1, "c"] <- NA
      df[1, "d"] <- NA
      df[1, "e"] <- NA
      df[1, "f"] <- NA
      df[1, "g"] <- NA
      df[1, "h"] <- NA
      df
    Output
      # A tibble: 1 x 8
        a         b     c d     e     f       g$x    $y h[,1]  [,2]  [,3]
        <lgl> <int> <dbl> <cpl> <chr> <raw> <dbl> <dbl> <int> <int> <int>
      1 NA       NA    NA NA    <NA>  00       NA    NA    NA    NA    NA
    Code
      # # [<-.tbl_df and matrix subsetting
      foo <- tibble(a = 1:3, b = letters[1:3])
      foo[!is.na(foo)] <- "bogus"
    Condition
      Error:
      ! Assigned data `"bogus"` must be compatible with existing data.
      i Error occurred for column `a`.
      x Can't convert <character> to <integer>.
    Code
      foo[as.matrix("x")] <- NA
    Condition
      Error:
      ! Subscript `as.matrix("x")` is a matrix, it must be of type logical.
    Code
      foo[array("x", dim = c(1, 1, 1))] <- NA
      foo[is.na(foo)] <- 1:3
    Condition
      Error:
      ! Subscript `is.na(foo)` is a matrix, the data `1:3` must have size 1.
    Code
      foo[is.na(foo)] <- lm(a ~ b, foo)
    Condition
      Error:
      ! Subscript `is.na(foo)` is a matrix, the data `lm(a ~ b, foo)` must be a vector of size 1.
    Code
      # # [[<-.tbl_df rejects invalid column indexes
      foo <- tibble(x = 1:10, y = 1:10)
      foo[[]] <- 1
    Condition
      Error:
      ! Subscript can't be missing for tibbles in `[[<-`.
    Code
      foo[[, 1]] <- 1
    Condition
      Error:
      ! Subscript can't be missing for tibbles in `[[<-`.
    Code
      foo[[1, ]] <- 1
    Condition
      Error:
      ! Subscript can't be missing for tibbles in `[[<-`.
    Code
      foo[[, ]] <- 1
    Condition
      Error:
      ! Subscript can't be missing for tibbles in `[[<-`.
    Code
      foo[[1:3]] <- 1
    Condition
      Error in `vectbl_as_col_location2()`:
      ! Must assign to column with a single valid subscript.
      x Subscript `1:3` has size 3 but must be size 1.
    Code
      foo[[letters[1:3]]] <- 1
    Condition
      Error in `vectbl_as_col_location2()`:
      ! Must assign to column with a single valid subscript.
      x Subscript `letters[1:3]` has size 3 but must be size 1.
    Code
      foo[[TRUE]] <- 1
    Condition
      Error in `vectbl_as_col_location2()`:
      ! Must assign to column with a single valid subscript.
      x Subscript `TRUE` has the wrong type `logical`.
      i It must be numeric or character.
    Code
      foo[[NA_integer_]] <- 1
    Condition
      Error in `vectbl_as_col_location2()`:
      ! Must assign to column with a single valid subscript.
      x Subscript `NA_integer_` can't be `NA`.
    Code
      foo[[mean]] <- 1
    Condition
      Error in `vectbl_as_col_location2()`:
      ! Must assign to column with a single valid subscript.
      x Subscript `mean` has the wrong type `function`.
      i It must be numeric or character.
    Code
      foo[[foo]] <- 1
    Condition
      Error:
      ! Must assign to column with a single valid subscript.
      x Subscript `foo` has the wrong type `tbl_df<
        x: integer
        y: integer
      >`.
      i It must be numeric or character.
    Code
      foo[[1:3, 1]] <- 1
    Condition
      Error in `vectbl_as_row_location2()`:
      ! Must assign to row with a single valid subscript.
      x Subscript `1:3` has size 3 but must be size 1.
    Code
      foo[[TRUE, 1]] <- 1
    Condition
      Error in `vectbl_as_row_location2()`:
      ! Must assign to row with a single valid subscript.
      x Subscript `TRUE` has the wrong type `logical`.
      i It must be numeric or character.
    Code
      foo[[mean, 1]] <- 1
    Condition
      Error in `vectbl_as_row_location2()`:
      ! Must assign to row with a single valid subscript.
      x Subscript `mean` has the wrong type `function`.
      i It must be numeric or character.
    Code
      foo[[foo, 1]] <- 1
    Condition
      Error in `vectbl_as_row_location2()`:
      ! Must assign to row with a single valid subscript.
      x Subscript `foo` has the wrong type `tbl_df<
        x: integer
        y: integer
      >`.
      i It must be numeric or character.
    Code
      # # [[<-.tbl_df throws an error with OOB assignment
      df <- tibble(x = 1:2, y = x)
      df[[4]] <- 3
    Condition
      Error in `numtbl_as_col_location_assign()`:
      ! Can't assign to columns beyond the end with non-consecutive locations.
      i Input has size 2.
      x Subscript `4` contains non-consecutive location 4.
    Code
      # # [[<-.tbl_df throws an error with bad RHS
      df <- tibble(x = 1:2, y = x)
      df[[1]] <- mean
    Condition
      Error in `vec_size()`:
      ! `x` must be a vector, not a function.
    Code
      df[[1]] <- lm(y ~ x, df)
    Condition
      Error in `vec_size()`:
      ! `x` must be a vector, not a <lm> object.
    Code
      # # [[<-.tbl_df recycles only values of length one
      df <- tibble(x = 1:3)
      df[["x"]] <- 8:9
    Condition
      Error:
      ! Assigned data `8:9` must be compatible with existing data.
      x Existing data has 3 rows.
      x Assigned data has 2 rows.
      i Only vectors of size 1 are recycled.
    Code
      df[["w"]] <- 8:9
    Condition
      Error:
      ! Assigned data `8:9` must be compatible with existing data.
      x Existing data has 3 rows.
      x Assigned data has 2 rows.
      i Only vectors of size 1 are recycled.
    Code
      df[["a"]] <- character()
    Condition
      Error:
      ! Assigned data `character()` must be compatible with existing data.
      x Existing data has 3 rows.
      x Assigned data has 0 rows.
      i Only vectors of size 1 are recycled.
    Code
      # # [<-.tbl_df throws an error with invalid values
      df <- tibble(x = 1:2, y = x)
      df[1] <- lm(y ~ x, df)
    Condition
      Error:
      ! `lm(y ~ x, df)` must be a vector, a bare list, a data frame, a matrix, or NULL.
    Code
      df[1:2, 1] <- NULL
    Condition
      Error:
      ! `NULL` must be a vector, a bare list, a data frame or a matrix.
    Code
      # # $<- recycles only values of length one
      df <- tibble(x = 1:3)
      df$x <- 8:9
    Condition
      Error:
      ! Assigned data `8:9` must be compatible with existing data.
      x Existing data has 3 rows.
      x Assigned data has 2 rows.
      i Only vectors of size 1 are recycled.
    Code
      df$w <- 8:9
    Condition
      Error:
      ! Assigned data `8:9` must be compatible with existing data.
      x Existing data has 3 rows.
      x Assigned data has 2 rows.
      i Only vectors of size 1 are recycled.
    Code
      df$a <- character()
    Condition
      Error:
      ! Assigned data `character()` must be compatible with existing data.
      x Existing data has 3 rows.
      x Assigned data has 0 rows.
      i Only vectors of size 1 are recycled.


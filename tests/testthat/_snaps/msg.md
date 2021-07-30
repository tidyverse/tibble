# output test

    Code
      # # add
      error_add_rows_to_grouped_df()
    Output
      <error/tibble_error_add_rows_to_grouped_df>
      Can't add rows to grouped data frames.
    Code
      error_incompatible_new_rows("a")
    Output
      <error/tibble_error_incompatible_new_rows>
      New rows can't add columns.
      x Can't find column `a` in `.data`.
    Code
      error_incompatible_new_rows(letters[2:3])
    Output
      <error/tibble_error_incompatible_new_rows>
      New rows can't add columns.
      x Can't find columns `b` and `c` in `.data`.
    Code
      error_incompatible_new_rows(LETTERS)
    Output
      <error/tibble_error_incompatible_new_rows>
      New rows can't add columns.
      x Can't find columns `A`, `B`, `C`, `D`, `E`, and 21 more in `.data`.
    Code
      error_both_before_after()
    Output
      <error/tibble_error_both_before_after>
      Can't specify both `.before` and `.after`.
    Code
      error_unknown_column_names("a")
    Output
      <error/tibble_error_unknown_column_names>
      Can't find column `a` in `.data`.
    Code
      error_unknown_column_names(c("b", "c"))
    Output
      <error/tibble_error_unknown_column_names>
      Can't find columns `b` and `c` in `.data`.
    Code
      error_unknown_column_names(LETTERS)
    Output
      <error/tibble_error_unknown_column_names>
      Can't find columns `A`, `B`, `C`, `D`, `E`, and 21 more in `.data`.
    Code
      error_incompatible_new_cols(10, data.frame(a = 1:2))
    Output
      <error/tibble_error_incompatible_new_cols>
      New columns must be compatible with `.data`.
      x New column has 2 rows.
      i `.data` has 10 rows.
    Code
      error_incompatible_new_cols(1, data.frame(a = 1:3, b = 2:4))
    Output
      <error/tibble_error_incompatible_new_cols>
      New columns must be compatible with `.data`.
      x New columns have 3 rows.
      i `.data` has 1 row.
    Code
      # # as_tibble
      error_column_scalar_type("a", 3, "environment")
    Output
      <error/tibble_error_column_scalar_type>
      All columns in a tibble must be vectors.
      x Column `a` is environment.
    Code
      error_column_scalar_type("", 3, "environment")
    Output
      <error/tibble_error_column_scalar_type>
      All columns in a tibble must be vectors.
      x Column 3 is environment.
    Code
      error_column_scalar_type(letters[2:3], 3:4, c("name", "NULL"))
    Output
      <error/tibble_error_column_scalar_type>
      All columns in a tibble must be vectors.
      x Column `b` is name.
      x Column `c` is NULL.
    Code
      error_column_scalar_type(c("", "", LETTERS), 1:28, c("QQ", "VV", letters))
    Output
      <error/tibble_error_column_scalar_type>
      All columns in a tibble must be vectors.
      x Column 1 is QQ.
      x Column 2 is VV.
      x Column `A` is a.
      x Column `B` is b.
      x Column `C` is c.
      x ... and 23 more problems.
    Code
      error_as_tibble_row_vector(new_environment())
    Output
      <error/tibble_error_as_tibble_row_vector>
      `x` must be a vector in `as_tibble_row()`, not environment.
    Code
      error_as_tibble_row_size_one(3, "foo", 7)
    Output
      <error/tibble_error_as_tibble_row_size_one>
      All elements must be size one, use `list()` to wrap.
      x Element `foo` is of size 7.
    Code
      # # class-tbl_df
      error_names_must_be_non_null()
    Output
      <error/tibble_error_names_must_be_non_null>
      `names` must not be `NULL`.
    Code
      error_names_must_have_length(length = 5, n = 3)
    Output
      <error/tibble_error_names_must_have_length>
      `names` must have length 3, not 5.
    Code
      # #enframe
      error_enframe_value_null()
    Output
      <error/tibble_error_enframe_value_null>
      `value` can't be NULL.
    Code
      error_enframe_must_be_vector(lm(speed ~ ., cars))
    Output
      <error/tibble_error_enframe_must_be_vector>
      The `x` argument to `enframe()` must be a vector, not lm.
    Code
      # # names
      error_column_names_cannot_be_empty(1, repair_hint = TRUE)
    Output
      <error/tibble_error_column_names_cannot_be_empty>
      Column 1 must be named.
      Use .name_repair to specify repair.
    Code
      error_column_names_cannot_be_empty(2:3, repair_hint = TRUE)
    Output
      <error/tibble_error_column_names_cannot_be_empty>
      Columns 2 and 3 must be named.
      Use .name_repair to specify repair.
    Code
      error_column_names_cannot_be_empty(seq_along(letters), repair_hint = TRUE)
    Output
      <error/tibble_error_column_names_cannot_be_empty>
      Columns 1, 2, 3, 4, 5, and 21 more must be named.
      Use .name_repair to specify repair.
    Code
      error_column_names_cannot_be_empty(4:6, repair_hint = FALSE)
    Output
      <error/tibble_error_column_names_cannot_be_empty>
      Columns 4, 5, and 6 must be named.
    Code
      error_column_names_cannot_be_dot_dot(1, repair_hint = FALSE)
    Output
      <error/tibble_error_column_names_cannot_be_dot_dot>
      Column 1 must not have names of the form ... or ..j.
    Code
      error_column_names_cannot_be_dot_dot(2:3, repair_hint = TRUE)
    Output
      <error/tibble_error_column_names_cannot_be_dot_dot>
      Columns 2 and 3 must not have names of the form ... or ..j.
      Use .name_repair to specify repair.
    Code
      error_column_names_cannot_be_dot_dot(1:26, repair_hint = TRUE)
    Output
      <error/tibble_error_column_names_cannot_be_dot_dot>
      Columns 1, 2, 3, 4, 5, and 21 more must not have names of the form ... or ..j.
      Use .name_repair to specify repair.
    Code
      error_column_names_must_be_unique("a", repair_hint = FALSE)
    Output
      <error/tibble_error_column_names_must_be_unique>
      Column name `a` must not be duplicated.
    Code
      error_column_names_must_be_unique(letters[2:3], repair_hint = TRUE)
    Output
      <error/tibble_error_column_names_must_be_unique>
      Column names `b` and `c` must not be duplicated.
      Use .name_repair to specify repair.
    Code
      error_column_names_must_be_unique(LETTERS, repair_hint = TRUE)
    Output
      <error/tibble_error_column_names_must_be_unique>
      Column names `A`, `B`, `C`, `D`, `E`, and 21 more must not be duplicated.
      Use .name_repair to specify repair.
    Code
      # # new
      error_new_tibble_must_be_list()
    Output
      <error/tibble_error_new_tibble_must_be_list>
      `x` must be a list.
    Code
      # # rownames
      error_already_has_rownames()
    Output
      <error/tibble_error_already_has_rownames>
      `.data` must be a data frame without row names.
    Code
      # # subsetting
      error_need_rhs_vector(quote(RHS))
    Output
      <error/tibble_error_need_rhs_vector>
      `RHS` must be a vector, a bare list, a data frame or a matrix.
    Code
      error_need_rhs_vector_or_null(quote(RHS))
    Output
      <error/tibble_error_need_rhs_vector_or_null>
      `RHS` must be a vector, a bare list, a data frame, a matrix, or NULL.
    Code
      error_na_column_index(1:3)
    Output
      <error/tibble_error_na_column_index>
      Can't use NA as column index with `[` at positions 1, 2, and 3.
    Code
      error_dim_column_index(as.matrix("x"))
    Output
      <error/tibble_error_dim_column_index>
      Must use a vector in `[`, not an object of class matrix.
    Code
      error_assign_columns_non_na_only()
    Output
      <error/tibble_error_assign_columns_non_na_only>
      Can't use NA as column index in a tibble for assignment.
    Code
      error_subset_columns_non_missing_only()
    Output
      <error/tibble_error_subset_columns_non_missing_only>
      Subscript can't be missing for tibbles in `[[`.
    Code
      error_assign_columns_non_missing_only()
    Output
      <error/tibble_error_assign_columns_non_missing_only>
      Subscript can't be missing for tibbles in `[[<-`.
    Code
      error_duplicate_column_subscript_for_assignment(c(1, 1))
    Output
      <error/tibble_error_duplicate_column_subscript_for_assignment>
      Column index 1 is used more than once for assignment.
    Code
      error_duplicate_column_subscript_for_assignment(c(1, 1, 2, 2))
    Output
      <error/tibble_error_duplicate_column_subscript_for_assignment>
      Column indexes 1 and 2 are used more than once for assignment.
    Code
      error_assign_rows_non_na_only()
    Output
      <error/tibble_error_assign_rows_non_na_only>
      Can't use NA as row index in a tibble for assignment.
    Code
      error_duplicate_row_subscript_for_assignment(c(1, 1))
    Output
      <error/tibble_error_duplicate_row_subscript_for_assignment>
      Row index 1 is used more than once for assignment.
    Code
      error_duplicate_row_subscript_for_assignment(c(1, 1, 2, 2))
    Output
      <error/tibble_error_duplicate_row_subscript_for_assignment>
      Row indexes 1 and 2 are used more than once for assignment.
    Code
      error_assign_incompatible_size(3, list(1:2), 1, NULL, quote(rhs))
    Output
      <error/tibble_error_assign_incompatible_size>
      Assigned data `rhs` must be compatible with existing data.
      x Existing data has 3 rows.
      x Assigned data has 2 rows.
      i Only vectors of size 1 are recycled.
    Code
      error_assign_incompatible_size(4, list(1:4, 3:4), 2, quote(4:1), quote(rhs))
    Output
      <error/tibble_error_assign_incompatible_size>
      Assigned data `rhs` must be compatible with row subscript `4:1`.
      x 4 rows must be assigned.
      x Element 2 of assigned data has 2 rows.
      i Only vectors of size 1 are recycled.
    Code
      error_assign_incompatible_type(tibble(a = 1), list("c"), 1, quote(rhs),
      "Can't frobnicate.")
    Output
      <error/tibble_error_assign_incompatible_type>
      Assigned data `rhs` must be compatible with existing data.
      i Error occurred for column `a`.
      x Can't frobnicate.
    Code
      # # subsetting-matrix
      error_subset_matrix_must_be_logical(quote(is.na(x) + 1))
    Output
      <error/tibble_error_subset_matrix_must_be_logical>
      Subscript `is.na(x) + 1` is a matrix, it must be of type logical.
    Code
      error_subset_matrix_must_have_same_dimensions(quote(t(is.na(x))))
    Output
      <error/tibble_error_subset_matrix_must_have_same_dimensions>
      Subscript `t(is.na(x))` is a matrix, it must have the same dimensions as the input.
    Code
      error_subset_matrix_scalar_type(quote(is.na(x)), quote(new_environment()))
    Output
      <error/tibble_error_subset_matrix_scalar_type>
      Subscript `is.na(x)` is a matrix, the data `new_environment()` must be a vector of size 1.
    Code
      error_subset_matrix_must_be_scalar(quote(is.na(x)), quote(1:3))
    Output
      <error/tibble_error_subset_matrix_must_be_scalar>
      Subscript `is.na(x)` is a matrix, the data `1:3` must have size 1.
    Code
      # # tibble
      error_tibble_row_size_one(3, "foo", 7)
    Output
      <error/tibble_error_tibble_row_size_one>
      All vectors must be size one, use `list()` to wrap.
      x Column `foo` is of size 7.
    Code
      error_incompatible_size(10, letters[1:3], c(4, 4, 3),
      "Requested with `uvw` argument")
    Output
      <error/tibble_error_incompatible_size>
      Tibble columns must have compatible sizes.
      * Size 10: Requested with `uvw` argument.
      * Size 3: Column `c`.
      * Size 4: Columns `a` and `b`.
      i Only values of size one are recycled.
    Code
      error_incompatible_size(10, letters[1:3], c(2, 2, 3),
      "Requested with `xyz` argument")
    Output
      <error/tibble_error_incompatible_size>
      Tibble columns must have compatible sizes.
      * Size 10: Requested with `xyz` argument.
      * Size 2: Columns `a` and `b`.
      * Size 3: Column `c`.
      i Only values of size one are recycled.
    Code
      error_incompatible_size(NULL, letters[1:3], c(2, 2, 3),
      "Requested with `xyz` argument")
    Output
      <error/tibble_error_incompatible_size>
      Tibble columns must have compatible sizes.
      * Size 2: Columns `a` and `b`.
      * Size 3: Column `c`.
      i Only values of size one are recycled.
    Code
      error_incompatible_size(10, 1:3, c(4, 4, 3), "Requested with `uvw` argument")
    Output
      <error/tibble_error_incompatible_size>
      Tibble columns must have compatible sizes.
      * Size 10: Requested with `uvw` argument.
      * Size 3: Column at position 3.
      * Size 4: Columns at positions 1 and 2.
      i Only values of size one are recycled.
    Code
      error_incompatible_size(10, 1:3, c(2, 2, 3), "Requested with `xyz` argument")
    Output
      <error/tibble_error_incompatible_size>
      Tibble columns must have compatible sizes.
      * Size 10: Requested with `xyz` argument.
      * Size 2: Columns at positions 1 and 2.
      * Size 3: Column at position 3.
      i Only values of size one are recycled.
    Code
      error_incompatible_size(NULL, 1:3, c(2, 2, 3), "Requested with `xyz` argument")
    Output
      <error/tibble_error_incompatible_size>
      Tibble columns must have compatible sizes.
      * Size 2: Columns at positions 1 and 2.
      * Size 3: Column at position 3.
      i Only values of size one are recycled.
    Code
      # # tribble
      error_tribble_needs_columns()
    Output
      <error/tibble_error_tribble_needs_columns>
      Must specify at least one column using the `~name` syntax.
    Code
      error_tribble_lhs_column_syntax(quote(lhs))
    Output
      <error/tibble_error_tribble_lhs_column_syntax>
      All column specifications must use the `~name` syntax.
      x Found `lhs` on the left-hand side of `~`.
    Code
      error_tribble_rhs_column_syntax(quote(a + b))
    Output
      <error/tibble_error_tribble_rhs_column_syntax>
      All column specifications must use the `~name` or `~"name"` syntax.
      x Found `a + b` on the right-hand side of `~`.
    Code
      error_tribble_non_rectangular(5, 17)
    Output
      <error/tibble_error_tribble_non_rectangular>
      Data must be rectangular.
      * Found 5 columns.
      * Found 17 cells.
      i 17 is not an integer multiple of 5.
    Code
      error_frame_matrix_list(2:4)
    Output
      <error/tibble_error_frame_matrix_list>
      All values must be atomic.
      x Found list-valued elements at positions 2, 3, and 4.


test_that("error class", {
  expect_equal(tibble_error_class("boo"), c("tibble_error_boo", "tibble_error"))
})

test_that("aborting with class", {
  expect_error(abort_enframe_value_null(), class = tibble_error_class("enframe_value_null")[[1]])
})

test_that("output test", {
  skip_if_not_installed("testthat", "3.1.1")

  expect_snapshot(variant = rlang_variant(), {
    "# add"
    print_error(abort_add_rows_to_grouped_df())

    print_error(abort_incompatible_new_rows("a"))
    print_error(abort_incompatible_new_rows(letters[2:3]))
    print_error(abort_incompatible_new_rows(LETTERS))

    print_error(abort_both_before_after())

    print_error(abort_unknown_column_names("a"))
    print_error(abort_unknown_column_names(c("b", "c")))
    print_error(abort_unknown_column_names(LETTERS))

    print_error(abort_incompatible_new_cols(10, data.frame(a = 1:2)))
    print_error(abort_incompatible_new_cols(1, data.frame(a = 1:3, b = 2:4)))

    "# as_tibble"
    print_error(abort_column_scalar_type("a", 3, "environment"))
    print_error(abort_column_scalar_type("", 3, "environment"))
    print_error(abort_column_scalar_type(letters[2:3], 3:4, c("name", "NULL")))
    print_error(abort_column_scalar_type(c("", "", LETTERS), 1:28, c("QQ", "VV", letters)))

    print_error(abort_as_tibble_row_vector(new_environment()))
    print_error(abort_as_tibble_row_size_one(3, "foo", 7))

    "# class-tbl_df"
    print_error(abort_names_must_be_non_null())

    print_error(abort_names_must_have_length(length = 5, n = 3))

    "#enframe"
    print_error(abort_enframe_value_null())
    print_error(abort_enframe_must_be_vector(lm(speed ~ ., cars)))

    "# names"
    print_error(abort_column_names_cannot_be_empty(1, repair_hint = TRUE))
    print_error(abort_column_names_cannot_be_empty(2:3, repair_hint = TRUE))
    print_error(abort_column_names_cannot_be_empty(seq_along(letters), repair_hint = TRUE))
    print_error(abort_column_names_cannot_be_empty(4:6, repair_hint = FALSE))

    print_error(abort_column_names_cannot_be_dot_dot(1, repair_hint = FALSE))
    print_error(abort_column_names_cannot_be_dot_dot(2:3, repair_hint = TRUE))
    print_error(abort_column_names_cannot_be_dot_dot(1:26, repair_hint = TRUE))

    print_error(abort_column_names_must_be_unique("a", repair_hint = FALSE))
    print_error(abort_column_names_must_be_unique(letters[2:3], repair_hint = TRUE))
    print_error(abort_column_names_must_be_unique(LETTERS, repair_hint = TRUE))

    "# new"
    print_error(abort_new_tibble_must_be_list())
    print_error(abort_new_tibble_nrow_must_be_nonnegative())

    "# rownames"
    print_error(abort_already_has_rownames())

    "# subsetting"
    print_error(abort_need_rhs_vector(quote(RHS)))
    print_error(abort_need_rhs_vector_or_null(quote(RHS)))

    print_error(abort_na_column_index(1:3))
    print_error(abort_dim_column_index(as.matrix("x")))

    print_error(abort_assign_columns_non_na_only())
    print_error(abort_subset_columns_non_missing_only())
    print_error(abort_assign_columns_non_missing_only())

    print_error(abort_assign_duplicate_column_subscript(c(1, 1)))
    print_error(abort_assign_duplicate_column_subscript(c(1, 1, 2, 2)))

    print_error(abort_assign_rows_non_na_only())

    print_error(abort_assign_duplicate_row_subscript(c(1, 1)))
    print_error(abort_assign_duplicate_row_subscript(c(1, 1, 2, 2)))

    print_error(abort_assign_incompatible_size(3, list(1:2), 1, NULL, quote(rhs)))
    print_error(abort_assign_incompatible_size(4, list(1:4, 3:4), 2, quote(4:1), quote(rhs)))

    print_error(abort_assign_incompatible_type(tibble(a = 1), list("c"), 1, quote(rhs)))
    print_error(abort_assign_vector(list("c"), 1, quote(rhs)))

    "# subsetting-matrix"
    print_error(abort_subset_matrix_must_be_logical(quote(is.na(x) + 1)))
    print_error(abort_subset_matrix_must_have_same_dimensions(quote(t(is.na(x)))))
    print_error(abort_subset_matrix_scalar_type(quote(is.na(x)), quote(new_environment())))
    print_error(abort_subset_matrix_must_be_scalar(quote(is.na(x)), quote(1:3)))

    "# tibble"
    print_error(abort_tibble_row_size_one(3, "foo", 7))

    print_error(abort_incompatible_size(
      10,
      letters[1:3],
      c(4, 4, 3),
      "Requested with `uvw` argument"
    ))
    print_error(abort_incompatible_size(
      10,
      letters[1:3],
      c(2, 2, 3),
      "Requested with `xyz` argument"
    ))
    print_error(abort_incompatible_size(
      NULL,
      letters[1:3],
      c(2, 2, 3),
      "Requested with `xyz` argument"
    ))
    print_error(abort_incompatible_size(
      10,
      1:3,
      c(4, 4, 3),
      "Requested with `uvw` argument"
    ))
    print_error(abort_incompatible_size(
      10,
      1:3,
      c(2, 2, 3),
      "Requested with `xyz` argument"
    ))
    print_error(abort_incompatible_size(
      NULL,
      1:3,
      c(2, 2, 3),
      "Requested with `xyz` argument"
    ))

    "# tribble"
    print_error(abort_tribble_needs_columns())

    print_error(abort_tribble_lhs_column_syntax(quote(lhs)))

    print_error(abort_tribble_rhs_column_syntax(quote(a + b)))

    print_error(abort_tribble_non_rectangular(5, 17))

    print_error(abort_frame_matrix_list(2:4))
  })
})

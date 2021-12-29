test_that("error class", {
  expect_equal(tibble_error_class("boo"), c("tibble_error_boo", "tibble_error"))
})

test_that("aborting with class", {
  expect_error(cnd_signal(error_enframe_value_null()), class = tibble_error_class("enframe_value_null")[[1]])
})

test_that("output test", {
  skip_if_not_installed("testthat", "3.1.1")

  expect_snapshot(variant = rlang_variant(), {
    "# add"
    error_add_rows_to_grouped_df()

    error_incompatible_new_rows("a")
    error_incompatible_new_rows(letters[2:3])
    error_incompatible_new_rows(LETTERS)

    error_both_before_after()

    error_unknown_column_names("a")
    error_unknown_column_names(c("b", "c"))
    error_unknown_column_names(LETTERS)

    error_incompatible_new_cols(10, data.frame(a = 1:2))
    error_incompatible_new_cols(1, data.frame(a = 1:3, b = 2:4))

    "# as_tibble"
    error_column_scalar_type("a", 3, "environment")
    error_column_scalar_type("", 3, "environment")
    error_column_scalar_type(letters[2:3], 3:4, c("name", "NULL"))
    error_column_scalar_type(c("", "", LETTERS), 1:28, c("QQ", "VV", letters))

    error_as_tibble_row_vector(new_environment())
    error_as_tibble_row_size_one(3, "foo", 7)

    "# class-tbl_df"
    error_names_must_be_non_null()

    error_names_must_have_length(length = 5, n = 3)

    "#enframe"
    error_enframe_value_null()
    error_enframe_must_be_vector(lm(speed ~ ., cars))

    "# names"
    error_column_names_cannot_be_empty(1, repair_hint = TRUE)
    error_column_names_cannot_be_empty(2:3, repair_hint = TRUE)
    error_column_names_cannot_be_empty(seq_along(letters), repair_hint = TRUE)
    error_column_names_cannot_be_empty(4:6, repair_hint = FALSE)

    error_column_names_cannot_be_dot_dot(1, repair_hint = FALSE)
    error_column_names_cannot_be_dot_dot(2:3, repair_hint = TRUE)
    error_column_names_cannot_be_dot_dot(1:26, repair_hint = TRUE)

    error_column_names_must_be_unique("a", repair_hint = FALSE)
    error_column_names_must_be_unique(letters[2:3], repair_hint = TRUE)
    error_column_names_must_be_unique(LETTERS, repair_hint = TRUE)

    "# new"
    error_new_tibble_must_be_list()
    error_new_tibble_nrow_must_be_nonnegative()

    "# rownames"
    error_already_has_rownames()

    "# subsetting"
    error_need_rhs_vector(quote(RHS))
    error_need_rhs_vector_or_null(quote(RHS))

    error_na_column_index(1:3)
    error_dim_column_index(as.matrix("x"))

    error_assign_columns_non_na_only()
    error_subset_columns_non_missing_only()
    error_assign_columns_non_missing_only()

    error_duplicate_column_subscript_for_assignment(c(1, 1))
    error_duplicate_column_subscript_for_assignment(c(1, 1, 2, 2))

    error_assign_rows_non_na_only()

    error_duplicate_row_subscript_for_assignment(c(1, 1))
    error_duplicate_row_subscript_for_assignment(c(1, 1, 2, 2))

    error_assign_incompatible_size(3, list(1:2), 1, NULL, quote(rhs))
    error_assign_incompatible_size(4, list(1:4, 3:4), 2, quote(4:1), quote(rhs))

    error_assign_incompatible_type(tibble(a = 1), list("c"), 1, quote(rhs), "Can't frobnicate.")

    "# subsetting-matrix"
    error_subset_matrix_must_be_logical(quote(is.na(x) + 1))
    error_subset_matrix_must_have_same_dimensions(quote(t(is.na(x))))
    error_subset_matrix_scalar_type(quote(is.na(x)), quote(new_environment()))
    error_subset_matrix_must_be_scalar(quote(is.na(x)), quote(1:3))

    "# tibble"
    error_tibble_row_size_one(3, "foo", 7)

    error_incompatible_size(
      10,
      letters[1:3],
      c(4, 4, 3),
      "Requested with `uvw` argument"
    )
    error_incompatible_size(
      10,
      letters[1:3],
      c(2, 2, 3),
      "Requested with `xyz` argument"
    )
    error_incompatible_size(
      NULL,
      letters[1:3],
      c(2, 2, 3),
      "Requested with `xyz` argument"
    )
    error_incompatible_size(
      10,
      1:3,
      c(4, 4, 3),
      "Requested with `uvw` argument"
    )
    error_incompatible_size(
      10,
      1:3,
      c(2, 2, 3),
      "Requested with `xyz` argument"
    )
    error_incompatible_size(
      NULL,
      1:3,
      c(2, 2, 3),
      "Requested with `xyz` argument"
    )

    "# tribble"
    error_tribble_needs_columns()

    error_tribble_lhs_column_syntax(quote(lhs))

    error_tribble_rhs_column_syntax(quote(a + b))

    error_tribble_non_rectangular(5, 17)

    error_frame_matrix_list(2:4)
  })
})

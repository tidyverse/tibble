context("msg")

test_that("error_unsupported_index()", {
  expect_equal(
    error_unsupported_index(raw()),
    "Can't subset with `[` using an object of class raw."
  )
})

test_that("error_na_column_index()", {
  expect_equal(
    error_na_column_index(),
    "Can't use numeric NA as column index with `[`."
  )
})

test_that("error_nonint_column_index()", {
  expect_equal(
    error_nonint_column_index(2:3, 3:4 + 0.5),
    bullets(
      "Must use integers to index columns with `[`:",
      paste0("Position ", 2:3, " equals ", 3:4 + 0.5)
    )
  )
})

test_that("error_small_column_index()", {
  expect_equal(
    error_small_column_index(3, 2, -4),
    bullets(
      "Negative column indexes in `[` must match number of columns:",
      "`.data` has 3 columns",
      "Position 2 equals -4"
    )
  )
})

test_that("error_large_column_index()", {
  expect_equal(
    error_large_column_index(3, 2, 5),
    bullets(
      "Positive column indexes in `[` must match number of columns:",
      "`.data` has 3 columns",
      "Position 2 equals 5"
    )
  )
})

test_that("error_mismatch_column_flag()", {
  expect_equal(
    error_mismatch_column_flag(5, 3),
    bullets(
      "Length of logical index vector for `[` must equal number of columns (or 1):",
      "`.data` has 5 columns",
      "Index vector has length 3"
    )
  )
})

test_that("error_na_column_flag()", {
  expect_equal(
    error_na_column_flag(),
    "Can't use logical NA when selecting columns with `[`."
  )
})

test_that("error_unknown_names()", {
  expect_equal(
    error_unknown_names("a"),
    "Can't find column `a` in `.data`."
  )
  expect_equal(
    error_unknown_names(c("b", "c")),
    "Can't find columns `b`, `c` in `.data`."
  )
  expect_equal(
    error_unknown_names(LETTERS),
    "Can't find columns `A`, `B`, `C`, `D`, `E`, ... (and 21 more) in `.data`."
  )
})

test_that("error_existing_names()", {
  expect_equal(
    error_existing_names("a"),
    "Column `a` already exists in `.data`."
  )
  expect_equal(
    error_existing_names(c("b", "c")),
    "Columns `b`, `c` already exist in `.data`."
  )
  expect_equal(
    error_existing_names(LETTERS),
    "Columns `A`, `B`, `C`, `D`, `E`, ... (and 21 more) already exist in `.data`."
  )
})

test_that("error_add_rows_to_grouped_df()", {
  expect_equal(
    error_add_rows_to_grouped_df(),
    "Can't add rows to grouped data frames"
  )
})

test_that("error_inconsistent_new_rows()", {
  expect_equal(
    error_inconsistent_new_rows("a"),
    bullets(
      "New rows in `add_row()` must use columns that already exist:",
      "Can't find column `a` in `.data`."
    )
  )

  expect_equal(
    error_inconsistent_new_rows(letters[2:3]),
    bullets(
      "New rows in `add_row()` must use columns that already exist:",
      "Can't find columns `b`, `c` in `.data`."
    )
  )

  expect_equal(
    error_inconsistent_new_rows(LETTERS),
    bullets(
      "New rows in `add_row()` must use columns that already exist:",
      "Can't find columns `A`, `B`, `C`, `D`, `E`, ... (and 21 more) in `.data`."
    )
  )
})

test_that("error_column_must_be_named()", {
  expect_equal(
    error_column_must_be_named(1),
    "Column 1 must be named."
  )
  expect_equal(
    error_column_must_be_named(2:3),
    "Columns 2, 3 must be named."
  )
  expect_equal(
    error_column_must_be_named(seq_along(letters)),
    "Columns 1, 2, 3, 4, 5, ... (and 21 more) must be named."
  )
})

test_that("error_column_must_have_unique_name()", {
  expect_equal(
    error_column_must_have_unique_name("a"),
    "Column `a` must have a unique name."
  )
  expect_equal(
    error_column_must_have_unique_name(letters[2:3]),
    "Columns `b`, `c` must have unique names."
  )
  expect_equal(
    error_column_must_have_unique_name(LETTERS),
    "Columns `A`, `B`, `C`, `D`, `E`, ... (and 21 more) must have unique names."
  )
})

test_that("error_column_must_be_vector()", {
  expect_equal(
    error_column_must_be_vector("a", "environment"),
    bullets(
      "All columns in a tibble must be a 1d vector or a list:",
      "Column `a` is environment"
    )
  )

  expect_equal(
    error_column_must_be_vector(letters[2:3], c("name", "NULL")),
    bullets(
      "All columns in a tibble must be a 1d vector or a list:",
      "Column `b` is name",
      "Column `c` is NULL"
    )
  )

  expect_equal(
    error_column_must_be_vector(LETTERS, letters),
    bullets(
      "All columns in a tibble must be a 1d vector or a list:",
      paste0("Column `", LETTERS, "` is ", letters)
    )
  )
})

test_that("error_time_column_must_be_posixct()", {
  expect_equal(
    error_time_column_must_be_posixct("a"),
    "Column `a` is a date/time and must be stored as POSIXct, not POSIXlt."
  )
  expect_equal(
    error_time_column_must_be_posixct(letters[2:3]),
    "Columns `b`, `c` are dates/times and must be stored as POSIXct, not POSIXlt."
  )
  expect_equal(
    error_time_column_must_be_posixct(LETTERS),
    "Columns `A`, `B`, `C`, `D`, `E`, ... (and 21 more) are dates/times and must be stored as POSIXct, not POSIXlt."
  )
})

test_that("error_inconsistent_cols()", {
  expect_equal(
    error_inconsistent_cols(
      10,
      "detection method",
      c("a", "b"),
      2:3
    ),
    bullets(
      "All columns in a tibble must have consistent lengths:",
      "Expected column length is 10 based on detection method",
      "Column `a` has length 2",
      "Column `b` has length 3"
    )
  )

  expect_equal(
    error_inconsistent_new_cols(1, data.frame(a = 1:3, b = 2:4)),
    bullets(
      "New columns in `add_column()` must be consistent with `.data`:",
      "`.data` has 1 row",
      "New columns contribute 3 rows"
    )
  )
})

test_that("error_inconsistent_new_cols()", {
  expect_equal(
    error_inconsistent_new_cols(10, data.frame(a = 1:2)),
    bullets(
      "New columns in `add_column()` must be consistent with `.data`:",
      "`.data` has 10 rows",
      "New column contributes 2 rows"
    )
  )

  expect_equal(
    error_inconsistent_new_cols(1, data.frame(a = 1:3, b = 2:4)),
    bullets(
      "New columns in `add_column()` must be consistent with `.data`:",
      "`.data` has 1 row",
      "New columns contribute 3 rows"
    )
  )
})

test_that("error_duplicate_new_cols()", {
  expect_equal(
    error_duplicate_new_cols("a"),
    bullets(
      "Can't add duplicate columns with `add_column()`:",
      "Column `a` already exists in `.data`."
    )
  )

  expect_equal(
    error_duplicate_new_cols(letters[2:3]),
    bullets(
      "Can't add duplicate columns with `add_column()`:",
      "Columns `b`, `c` already exist in `.data`."
    )
  )

  expect_equal(
    error_duplicate_new_cols(LETTERS),
    bullets(
      "Can't add duplicate columns with `add_column()`:",
      "Columns `A`, `B`, `C`, `D`, `E`, ... (and 21 more) already exist in `.data`."
    )
  )
})

test_that("error_both_before_after()", {
  expect_equal(
    error_both_before_after(),
    "Can't specify both `.before` and `.after`."
  )
})

test_that("error_already_has_rownames()", {
  expect_equal(
    error_already_has_rownames(),
    "`df` must be a data frame without row names in `column_to_rownames()`."
  )
})

test_that("error_already_has_rownames()", {
  expect_equal(
    error_as_tibble_needs_rownames(),
    "Object passed to `as_tibble()` must have row names if the `rownames` argument is set."
  )
})

test_that("error_glimpse_infinite_width()", {
  expect_equal(
    error_glimpse_infinite_width(),
    "`glimpse()` requires a finite value for the `width` argument."
  )
})

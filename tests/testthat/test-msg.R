context("msg")

test_that("error_enframe_value_null()", {
  expect_equal(
    error_enframe_value_null(),
    "The `value` argument to `enframe()` cannot be NULL."
  )
})

test_that("error_enframe_has_dim()", {
  expect_equal(
    error_enframe_has_dim(Titanic),
    "`x` must not have more than one dimension. `length(dim(x))` must be zero or one, not 4."
  )
})

test_that("error_1d_array_column()", {
  expect_equal(
    error_1d_array_column(),
    "1d arrays are not supported in a tibble column."
  )
})

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
    unell(error_unknown_names(LETTERS)),
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
    unell(error_existing_names(LETTERS)),
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
    unell(error_inconsistent_new_rows(LETTERS)),
    bullets(
      "New rows in `add_row()` must use columns that already exist:",
      "Can't find columns `A`, `B`, `C`, `D`, `E`, ... (and 21 more) in `.data`."
    )
  )
})

test_that("error_names_must_not_be_null()", {
  expect_equal(
    error_names_must_be_non_null(repair = TRUE),
    "The `names` must not be `NULL`.\nUse .name_repair to specify repair."
  )
  expect_equal(
    error_names_must_be_non_null(repair = FALSE),
    "The `names` must not be `NULL`."
  )
})

test_that("error_names_must_have_length()", {
  expect_equal(
    error_names_must_have_length(length = 5, n = 3),
    "The `names` must have length 3, not 5."
  )
})

test_that("error_column_must_be_named()", {
  expect_equal(
    error_column_must_be_named(1, repair = TRUE),
    "Column 1 must be named.\nUse .name_repair to specify repair."
  )
  expect_equal(
    error_column_must_be_named(2:3, repair = TRUE),
    "Columns 2, 3 must be named.\nUse .name_repair to specify repair."
  )
  expect_equal(
    unell(error_column_must_be_named(seq_along(letters), repair = TRUE)),
    "Columns 1, 2, 3, 4, 5, ... (and 21 more) must be named.\nUse .name_repair to specify repair."
  )
  expect_equal(
    error_column_must_be_named(4:6, repair = FALSE),
    "Columns 4, 5, 6 must be named."
  )
})

test_that("error_column_names_must_be_unique()", {
  expect_equal(
    error_column_names_must_be_unique("a", repair = FALSE),
    "Column name `a` must not be duplicated."
  )
  expect_equal(
    error_column_names_must_be_unique(letters[2:3], repair = TRUE),
    "Column names `b`, `c` must not be duplicated.\nUse .name_repair to specify repair."
  )
  expect_equal(
    unell(error_column_names_must_be_unique(LETTERS, repair = TRUE)),
    "Column names `A`, `B`, `C`, `D`, `E`, ... (and 21 more) must not be duplicated.\nUse .name_repair to specify repair."
  )
})

test_that("error_column_names_must_be_syntactic()", {
  expect_equal(
    error_column_names_must_be_syntactic("a", repair = FALSE),
    "Column name `a` must be syntactic."
  )
  expect_equal(
    error_column_names_must_be_syntactic(letters[2:3], repair = TRUE),
    "Column names `b`, `c` must be syntactic.\nUse .name_repair to specify repair."
  )
  expect_equal(
    unell(error_column_names_must_be_syntactic(LETTERS, repair = TRUE)),
    "Column names `A`, `B`, `C`, `D`, `E`, ... (and 21 more) must be syntactic.\nUse .name_repair to specify repair."
  )
})

test_that("error_column_must_be_vector()", {
  expect_equal(
    error_column_must_be_vector("a", "environment"),
    bullets(
      "All columns in a tibble must be 1d or 2d objects:",
      "Column `a` is environment"
    )
  )

  expect_equal(
    error_column_must_be_vector(letters[2:3], c("name", "NULL")),
    bullets(
      "All columns in a tibble must be 1d or 2d objects:",
      "Column `b` is name",
      "Column `c` is NULL"
    )
  )

  expect_equal(
    error_column_must_be_vector(LETTERS, letters),
    bullets(
      "All columns in a tibble must be 1d or 2d objects:",
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
    unell(error_time_column_must_be_posixct(LETTERS)),
    "Columns `A`, `B`, `C`, `D`, `E`, ... (and 21 more) are dates/times and must be stored as POSIXct, not POSIXlt."
  )
})

test_that("error_inconsistent_cols()", {
  expect_equal(
    error_inconsistent_cols(
      10,
      letters[1:3],
      c(4, 4, 3),
      "`uvw` argument"
    ),
    bullets(
      "Tibble columns must have consistent lengths, only values of length one are recycled:",
      "Length 10: Requested with `uvw` argument",
      "Length 3: Column `c`",
      "Length 4: Columns `a`, `b`"
    )
  )

  expect_equal(
    error_inconsistent_cols(
      10,
      letters[1:3],
      c(2, 2, 3),
      "`xyz` argument"
    ),
    bullets(
      "Tibble columns must have consistent lengths, only values of length one are recycled:",
      "Length 10: Requested with `xyz` argument",
      "Length 2: Columns `a`, `b`",
      "Length 3: Column `c`"
    )
  )

  expect_equal(
    error_inconsistent_cols(
      NULL,
      letters[1:3],
      c(2, 2, 3),
      "`xyz` argument"
    ),
    bullets(
      "Tibble columns must have consistent lengths, only values of length one are recycled:",
      "Length 2: Columns `a`, `b`",
      "Length 3: Column `c`"
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
    unell(error_duplicate_new_cols(LETTERS)),
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

test_that("error_tribble_needs_columns()", {
  expect_equal(
    error_tribble_needs_columns(),
    "`tribble()` needs to specify at least one column using the `~name` syntax."
  )
})

test_that("error_tribble_lhs_column_syntax()", {
  expect_equal(
    error_tribble_lhs_column_syntax(quote(lhs)),
    bullets(
      "All column specifications in `tribble()` must use the `~name` syntax.",
      "Found `lhs` on the left-hand side of `~`."
    )
  )
})

test_that("error_tribble_rhs_column_syntax()", {
  expect_equal(
    error_tribble_rhs_column_syntax(quote(a + b)),
    bullets(
      'All column specifications in `tribble()` must use the `~name` or `~"name"` syntax.',
      "Found `a + b` on the right-hand side of `~`."
    )
  )
})

test_that("error_tribble_non_rectangular()", {
  expect_equal(
    error_tribble_non_rectangular(5, 17),
    bullets(
      "`tribble()` must be used with rectangular data:",
      "Found 5 columns.",
      "Found 17 cells.",
      "17 is not an integer multiple of 5."
    )
  )
})

test_that("error_frame_matrix_list()", {
  expect_equal(
    error_frame_matrix_list(2:4),
    bullets(
      "All values in `frame_matrix()` must be atomic:",
      "Found list-valued elements at positions 2, 3, 4."
    )
  )
})

test_that("error_name_repair_arg()", {
  expect_equal(
    error_name_repair_arg(),
    "The `.name_repair` argument must be a string or a function that specifies the name repair strategy."
  )
})

test_that("error_new_tibble_must_be_list()", {
  expect_equal(
    error_new_tibble_must_be_list(),
    "Must pass a list as `x` argument to `new_tibble()`."
  )
})

test_that("error_new_tibble_needs_nrow()", {
  expect_equal(
    error_new_tibble_needs_nrow(),
    "Must pass a scalar integer as `nrow` argument to `new_tibble()`."
  )
})

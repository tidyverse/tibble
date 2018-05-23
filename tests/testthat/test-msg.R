context("msg")

test_that("error_unsupported_index()", {
  expect_equal(
    error_unsupported_index(raw()),
    "Can't subset with `[` using an index of class raw."
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
      "Must use integers to index columns:",
      paste0("Position ", 2:3, " equals ", 3:4 + 0.5)
    )
  )
})

test_that("error_small_column_index()", {
  expect_equal(
    error_small_column_index(3, 2, -4),
    bullets(
      "Negative column indexes must match number of columns:",
      "`.data` has 3 columns",
      "Position 2 equals -4"
    )
  )
})

test_that("error_large_column_index()", {
  expect_equal(
    error_large_column_index(3, 2, 5),
    bullets(
      "Positive column indexes must match number of columns:",
      "`.data` has 3 columns",
      "Position 2 equals 5"
    )
  )
})

test_that("error_mismatch_column_flag()", {
  expect_equal(
    error_mismatch_column_flag(5, 3),
    bullets(
      "Length of logical index vector must equal number of columns (or 1):",
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

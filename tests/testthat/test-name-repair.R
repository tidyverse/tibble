context("test-name_repair")

# minimal names -------------------------------------------------------------

test_that("minimal names have '' instead of NAs", {
  expect_identical(minimal_names(c("", NA, "", NA)), c("", "", "", ""))
})

test_that("check_minimal() errors when names aren't minimal", {
  expect_error(
    check_minimal(NULL),
    error_names_must_be_non_null(repair = FALSE),
    fixed = TRUE
  )
  expect_error(
    check_minimal(c("a", NA)),
    error_column_must_be_named(2, repair = FALSE),
    fixed = TRUE
  )
})

test_that("minimal_names() is idempotent", {
  x <- c("", "", NA)
  expect_identical(minimal_names(x), minimal_names(minimal_names(x)))
})

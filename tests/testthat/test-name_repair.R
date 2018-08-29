context("test-name_repair")

test_that("minimal names are made from `n` when `name = NULL`", {
  expect_identical(minimal_names(NULL, 2), c("", ""))
  expect_error(
    minimal_names(NULL),
    error_name_length_required(),
    fixed = TRUE
  )
})

test_that("minimal names have '' instead of NAs", {
  expect_identical(minimal_names(c("", NA)), c("", ""))
})

test_that("set_minimal_names() copes with NULL input names", {
  x <- 1:3
  x_named <- set_minimal_names(x)
  expect_equal(names(x_named), rep("", 3))
})

test_that("check_minimal() errors when names aren't minimal", {
  expect_error(
    check_minimal(NULL),
    error_names_must_be_non_null()
  )
  expect_error(
    check_minimal(c("a", NA)),
    error_column_must_be_named(2)
  )
})

test_that("valid_names() eliminates emptiness and duplication", {
  x <- c("", "x", "y", "x")
  expect_identical(valid_names(x), c("..1", "x..2", "y", "x..4"))
})

test_that("valid_names() strips positional suffixes, re-applies as needed", {
  x <- c("..20", "a..1", "b")
  expect_identical(valid_names(x), c("..1", "a", "b"))
})

test_that("check_valid() imposes check_minimal()", {
  expect_error(
    check_valid(NULL),
    capture_error(check_minimal(NULL))$message,
    fixed = TRUE
  )

  expect_error(
    check_valid(c("x", NA)),
    capture_error(error_column_must_be_named(2))$message,
    fixed = TRUE
  )
})

test_that("check_valid() errors for empty or duplicated names", {
  expect_error(
    check_valid(c("x", "")),
    error_column_must_be_named(2),
    fixed = TRUE
  )
  expect_error(
    check_valid(c("", "x", "")),
    error_column_must_be_named(c(1, 3)),
    fixed = TRUE
  )
  expect_error(
    check_valid(c("x", "x", "y")),
    error_column_names_must_be_unique("x"),
    fixed = TRUE
  )
  expect_error(
    check_valid(c("x", "y", "x", "y")),
    error_column_names_must_be_unique(c("x", "y")),
    fixed = TRUE
  )
})

test_that("syntactic_names() pass checks minimal, valid, and syntactic", {
  x <- c(NA, "", "x", "x", "a1:", "_x_y}")
  x_syn <- syntactic_names(x)
  expect_error(check_minimal(x_syn), NA)
  expect_error(check_valid(x_syn), NA)
  expect_true(all(is_syntactic(x_syn)))
  expect_identical(x_syn, c("..1", "..2", "x..3", "x..4", "a1.", "X_x_y."))
})

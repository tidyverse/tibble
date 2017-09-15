context("has-name")

test_that("basic", {
  expect_true(has_name(iris, "Species"))
  expect_false(has_name(mtcars, "gears"))
})

test_that("other types", {
  expect_true(has_name(list(a = 1), "a"))
  expect_true(has_name(c(a = 1), "a"))
})

test_that("vectorized", {
  expect_equal(has_name(list(a = 1), letters), c(TRUE, rep(FALSE, 25)))
})

test_that("NA", {
  expect_false(has_name(list(a = 1), NA))
})

test_that("unnamed", {
  expect_false(has_name(1, "a"))
  expect_true(has_name(1, ""))
})

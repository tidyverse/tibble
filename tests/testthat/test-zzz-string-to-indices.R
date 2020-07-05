context("string to indices")

test_that("works as expected", {
  expect_identical(string_to_indices(as.character(1:3)), 1:3)
  expect_identical(string_to_indices(letters[1:3]), rep(NA_integer_, 3))
  expect_identical(string_to_indices(as.character(1:3 + 1e10)), 1:3 + 1e10)
  expect_identical(string_to_indices(c(as.character(1:3 + 1e10), "x")), c(1:3 + 1e10, NA))
  expect_identical(string_to_indices(as.character(c(1:3, 1:3 + 1e10))), c(1:3, 1:3 + 1e10))
})

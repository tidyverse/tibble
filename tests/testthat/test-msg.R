context("error")

test_that("error_unsupported_index()", {
  expect_equal(
    error_unsupported_index(raw()),
    "Can't subset with `[` using an index of class raw."
  )
})

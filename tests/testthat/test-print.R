test_that("big_mark() works for large numbers", {
  expect_match(big_mark(123), "123")
  expect_match(big_mark(123456), "123.456")
  expect_match(big_mark(123456789), "123.456.789")
})

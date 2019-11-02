test_that("class is retained", {
  expect_equal(tibble(a = 1) * 3, tibble(a = 3))
  expect_s3_class(tibble(a = 1) * 3, class(tibble()), exact = TRUE)
})

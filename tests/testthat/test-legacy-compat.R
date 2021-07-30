test_that("tbl_subset_col()", {
  data <- tibble(a = 1:2, b = 3:4)
  expect_equal(tbl_subset_col(data, 2), data[2])
})

test_that("[.tbl_df supports subsetting with a logical matrix (#649)", {
  foo <- tibble(x = 1:10, y = 1:10, z = letters[1:10])

  m <- matrix(c(rep(FALSE, 8), rep(TRUE, 3), rep(FALSE, 19)), ncol = 3)
  expect_equal(foo[m], c(9, 10, 1))

  m <- matrix(c(rep(FALSE, 18), rep(TRUE, 3), rep(FALSE, 9)), ncol = 3)
  expect_error(foo[m], class = "vctrs_error_incompatible_type")
})

test_that("[<-.tbl_df supports subsetting with a logical matrix (#649)", {
  foo <- tibble(x = 1:10, y = 1:10, z = letters[1:10])

  m <- matrix(c(rep(FALSE, 8), rep(TRUE, 3), rep(FALSE, 19)), ncol = 3)
  foo[m] <- 1
  expect_equal(foo[m], c(1, 1, 1))

  expect_error(foo[m] <- 1:3)

  m <- matrix(c(rep(FALSE, 18), rep(TRUE, 3), rep(FALSE, 9)), ncol = 3)
  expect_error(foo[m] <- 1, class = "tibble_error_assign_incompatible_type")
})

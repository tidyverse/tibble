test_that("needs_dim()", {
  expect_false(needs_dim(NULL))
  expect_false(needs_dim(1))
  expect_false(needs_dim(1:3))
  expect_true(needs_dim(trees))
  expect_true(needs_dim(Titanic))
})

test_that("has_nonnull_names()", {
  expect_false(has_null_names(c(a = 1)))
  expect_true(has_null_names(NULL))
  expect_true(has_null_names(1))
})

test_that("needs_list_col()", {
  expect_false(needs_list_col(1))
  expect_false(needs_list_col(matrix(1:3, nrow = 1, ncol = 3)))
  expect_true(needs_list_col(matrix(1:3, nrow = 3, ncol = 1)))
  expect_true(needs_list_col(list(1:3)))
  expect_true(needs_list_col(1:3))
  expect_true(needs_list_col(integer()))
  expect_true(needs_list_col(NULL))
  expect_true(needs_list_col(trees))
  expect_true(needs_list_col(Titanic))
})

test_that("nchar_width()", {
  expect_equal(nchar_width(""), 0)
  expect_equal(nchar_width("abc"), 3)
  expect_equal(nchar_width("\u6210"), 2)
})

test_that("is_rstudio()", {
  expect_false(withr::with_envvar(c(RSTUDIO = NA), is_rstudio()))
  expect_true(withr::with_envvar(c(RSTUDIO = 1), is_rstudio()))
})

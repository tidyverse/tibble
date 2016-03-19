context("tbl_df")


# [ -----------------------------------------------------------------------

test_that("[ never drops", {
  mtcars2 <- tbl_df(mtcars)
  expect_is(mtcars2[, 1], "data.frame")
  expect_is(mtcars2[, 1], "tbl_df")
  expect_equal(mtcars2[, 1], mtcars2[1])
})

test_that("[ retains class", {
  mtcars2 <- tbl_df(mtcars)
  expect_identical(class(mtcars2), class(mtcars2[1:5, ]))
  expect_identical(class(mtcars2), class(mtcars2[, 1:5]))
  expect_identical(class(mtcars2), class(mtcars2[1:5, 1:5]))
})

test_that("[ with 0 cols creates correct row names (#656)", {
  zero_row <- tbl_df(iris)[, 0]
  expect_is(zero_row, "tbl_df")
  expect_equal(nrow(zero_row), 150)
  expect_equal(ncol(zero_row), 0)

  expect_identical(zero_row, tbl_df(iris)[0])
})

test_that("[.tbl_df is careful about names (#1245)",{
  foo <- data_frame(x = 1:10, y = 1:10)
  expect_error( foo["z"] )
  expect_error( foo[ c("x", "y", "z") ] )

  expect_error( foo[, "z"] )
  expect_error( foo[, c("x", "y", "z") ] )
})

test_that("[.tbl_df is no-op if args missing",{
  expect_identical(df_all[], df_all)
})

test_that("[.tbl_df warns for drop argument",{
  expect_warning(df_all[1, 2, drop = TRUE], "ignored")
})


# [[ ----------------------------------------------------------------------

test_that("[[.tbl_df ignores exact argument",{
  foo <- data_frame(x = 1:10, y = 1:10)
  expect_warning(foo[["x"]], NA)
  expect_warning(foo[["x", exact = FALSE]], "ignored")
  expect_identical(getElement(foo, "y"), 1:10)
})

test_that("can use recursive indexing with [[", {
  foo <- data_frame(x = list(y = 1:3, z = 4:5))
  expect_equal(foo[[c(1, 1)]], 1:3)
  expect_equal(foo[[c("x", "y")]], 1:3)
})

test_that("[[ throws error if name doesn't exist", {
  df <- data_frame(x = 1)
  expect_error(df[["y"]], "Unknown column 'y'")
})

# $ -----------------------------------------------------------------------

test_that("[[ throws error if name doesn't exist", {
  df <- data_frame(x = 1)
  expect_error(df$y, "Unknown column 'y'")
})

context("tbl_df")


# [ -----------------------------------------------------------------------

test_that("[ never drops", {
  mtcars2 <- as_tibble(mtcars)
  expect_is(mtcars2[, 1], "data.frame")
  expect_is(mtcars2[, 1], "tbl_df")
  expect_equal(mtcars2[, 1], mtcars2[1])
})

test_that("[ retains class", {
  mtcars2 <- as_tibble(mtcars)
  expect_identical(class(mtcars2), class(mtcars2[1:5, ]))
  expect_identical(class(mtcars2), class(mtcars2[, 1:5]))
  expect_identical(class(mtcars2), class(mtcars2[1:5, 1:5]))
})

test_that("[ and as_tibble commute", {
  mtcars2 <- as_tibble(mtcars)
  expect_identical(mtcars2, as_tibble(mtcars))
  expect_identical(mtcars2[], remove_rownames(as_tibble(mtcars[])))
  expect_identical(mtcars2[1:5, ], remove_rownames(as_tibble(mtcars[1:5, ])))
  expect_identical(mtcars2[, 1:5], remove_rownames(as_tibble(mtcars[, 1:5])))
  expect_identical(mtcars2[1:5, 1:5], remove_rownames(as_tibble(mtcars[1:5, 1:5])))
  expect_identical(mtcars2[1:5], remove_rownames(as_tibble(mtcars[1:5])))
})

test_that("[ with 0 cols creates correct row names (#656)", {
  zero_row <- as_tibble(iris)[, 0]
  expect_is(zero_row, "tbl_df")
  expect_equal(nrow(zero_row), 150)
  expect_equal(ncol(zero_row), 0)

  expect_identical(zero_row, as_tibble(iris)[0])
})

test_that("[.tbl_df is careful about names (#1245)",{
  z_msg <- "Unknown column: 'z'"

  foo <- tibble(x = 1:10, y = 1:10)
  expect_error(foo["z"], z_msg, fixed = TRUE)
  expect_error(foo[ c("x", "y", "z") ], z_msg, fixed = TRUE)

  expect_error(foo[, "z"], z_msg, fixed = TRUE)
  expect_error(foo[, c("x", "y", "z") ], z_msg, fixed = TRUE)

  expect_error(foo[as.matrix("x")], "matrix")
  expect_error(foo[array("x", dim = c(1, 1, 1))], "array")
})

test_that("[.tbl_df is careful about column indexes (#83)",{
  foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
  expect_identical(foo[1:3], foo)
  expect_error(foo[0.5], "Invalid non-integer column index: 0.5", fixed = TRUE)
  expect_error(foo[1:5], "Invalid column indexes: 4, 5", fixed = TRUE)
  expect_error(foo[-1:1], "mixed with negative")
  expect_error(foo[c(-1, 1)], "mixed with negative")
  expect_error(foo[-4], "Invalid negative column index: -4", fixed = TRUE)
  expect_error(foo[c(1:3, NA)], "NA column indexes not supported", fixed = TRUE)

  expect_error(foo[as.matrix(1)], "matrix")
  expect_error(foo[array(1, dim = c(1, 1, 1))], "array")
})

test_that("[.tbl_df is careful about column flags (#83)",{
  foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
  expect_identical(foo[TRUE], foo)
  expect_identical(foo[c(TRUE, TRUE, TRUE)], foo)
  expect_identical(foo[FALSE], foo[integer()])
  expect_identical(foo[c(FALSE, TRUE, FALSE)], foo[2])

  expect_error(foo[c(TRUE, TRUE)], "Length of logical index vector must be 1 or 3, got: 2", fixed = TRUE)
  expect_error(foo[c(TRUE, TRUE, FALSE, FALSE)], "Length of logical index vector must be 1 or 3, got: 4", fixed = TRUE)
  expect_error(foo[c(TRUE, TRUE, NA)], "NA column indexes not supported", fixed = TRUE)

  expect_error(foo[as.matrix(TRUE)], "matrix")
  expect_error(foo[array(TRUE, dim = c(1, 1, 1))], "array")
})

test_that("[.tbl_df rejects unknown column indexes (#83)",{
  foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
  expect_error(foo[list(1:3)], "Unsupported index type: list", fixed = TRUE)
  expect_error(foo[as.list(1:3)], "Unsupported index type: list", fixed = TRUE)
  expect_error(foo[factor(1:3)], "Unsupported index type: factor", fixed = TRUE)
  expect_error(foo[Sys.Date()], "Unsupported index type: Date", fixed = TRUE)
  expect_error(foo[Sys.time()], "Unsupported index type: POSIXct", fixed = TRUE)
})

test_that("[.tbl_df is no-op if args missing",{
  expect_identical(df_all[], df_all)
})

test_that("[.tbl_df warns for drop argument",{
  expect_warning(df_all[1, 2, drop = TRUE], "ignored")
})


# [[ ----------------------------------------------------------------------

test_that("[[.tbl_df ignores exact argument",{
  foo <- tibble(x = 1:10, y = 1:10)
  expect_warning(foo[["x"]], NA)
  expect_warning(foo[["x", exact = FALSE]], "ignored")
  expect_identical(getElement(foo, "y"), 1:10)
})

test_that("can use recursive indexing with [[", {
  foo <- tibble(x = list(y = 1:3, z = 4:5))
  expect_equal(foo[[c(1, 1)]], 1:3)
  expect_equal(foo[[c("x", "y")]], 1:3)
})

test_that("[[ returns NULL if name doesn't exist", {
  df <- tibble(x = 1)
  expect_null(df[["y"]])
  expect_null(df[[1, "y"]])
})

test_that("can use two-dimensional indexing with [[", {
  iris2 <- as_tibble(iris)
  expect_equal(iris2[[1, 2]], iris[[1, 2]])
  expect_equal(iris2[[2, 3]], iris[[2, 3]])
})

# $ -----------------------------------------------------------------------

test_that("$ throws warning if name doesn't exist", {
  df <- tibble(x = 1)
  expect_warning(expect_null(df$y),
                 "Unknown or uninitialised column: 'y'")
})

test_that("$ throws different warning if attempting a partial initialization (#199)", {
  df <- tibble(x = 1)
  expect_warning(df$y[1] <- 2, "Unknown or uninitialised column: 'y'")
})

test_that("$ doesn't do partial matching", {
  df <- tibble(partial = 1)
  expect_warning(expect_null(df$p),
                 "Unknown or uninitialised column: 'p'")
  expect_warning(expect_null(df$part),
                 "Unknown or uninitialised column: 'part'")
  expect_error(df$partial, NA)
})

# is.tibble ---------------------------------------------------------------

test_that("is.tibble", {
  expect_false(is.tibble(iris))
  expect_true(is.tibble(as_tibble(iris)))
  expect_false(is.tibble(NULL))
  expect_false(is.tibble(0))
})

test_that("is_tibble", {
  expect_identical(is.tibble, is_tibble)
})

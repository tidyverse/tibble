context("obj_sum")

# obj_sum ----------------------------------------------------------------

test_that("shows only first class name for S4", {
  A <- methods::setClass("A")
  expect_equal(obj_sum(A), "S4: classGeneratorFunction")
})

test_that("NULL handled specially", {
  expect_equal(obj_sum(NULL), "NULL")
})

test_that("data frame includes rows and cols", {
  expect_equal(obj_sum(mtcars), "data.frame [32,11]")
})

test_that("S3 others list all classes", {
  x <- structure(list(), class = c("a", "b", "c"))
  expect_equal(obj_sum(x), "S3: a/b/c")
})

test_that("common data vectors treated as atomic", {
  expect_equal(obj_sum(factor(1:3)), "fctr [3]")
  expect_equal(obj_sum(Sys.Date() + 1:3), "date [3]")
  expect_equal(obj_sum(Sys.time() + 1:3), "time [3]")
})


# type_sum ----------------------------------------------------------------

test_that("less common objects get abbreviations", {
  expect_equal(type_sum(environment()), "env")
  expect_equal(type_sum(environment), "fun")
})

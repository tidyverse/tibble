context("Equality")

# A data frame with all major types
df_all <- data.frame(
  a = c(1, 2.5),
  b = 1:2,
  c = c(T, F),
  d = c("a", "b"),
  e = factor(c("a", "b")),
  f = Sys.Date() + 1:2,
  g = Sys.time() + 1:2,
  stringsAsFactors = FALSE
)

test_that("data frames equal to themselves", {
  expect_true(all.equal(tbl_df(mtcars), tbl_df(mtcars)))
  expect_true(all.equal(tbl_df(iris), tbl_df(iris)))
  expect_true(all.equal(tbl_df(df_all), tbl_df(df_all)))
})

test_that("BoolResult does not overwrite singleton R_TrueValue", {
  dplyr:::equal_data_frame(mtcars, mtcars)
  expect_equal( class(2 == 2), "logical" )
})

test_that("all.equal.data.frame handles data.frames with NULL names", {
  x <- data.frame(LETTERS[1:3], rnorm(3))
  names(x) <- NULL
  expect_true(all.equal(x,x))
})

test_that( "data frame equality test with ignore_row_order=TRUE detects difference in number of rows. #1065", {
  DF1 <- data_frame(a = 1:4, b = letters[1:4])
  DF2 <- data_frame(a = c(1:4,4L), b = letters[c(1:4,4L)])
  expect_false( isTRUE(all.equal(DF1, DF2, ignore_row_order=TRUE)))

  DF1 <- data_frame(a = c(1:4,2L), b = letters[c(1:4,2L)])
  DF2 <- data_frame(a = c(1:4,4L), b = letters[c(1:4,4L)])
  expect_false(isTRUE(all.equal(DF1, DF2, ignore_row_order=TRUE)))

})

test_that("all.equal handles NA_character_ correctly. #1095", {
  d1 <- data_frame(x = c(NA_character_))
  expect_true(all.equal(d1, d1))

  d2 <- data_frame( x = c(NA_character_, "foo", "bar" ) )
  expect_true(all.equal(d2, d2))
})

test_that( "handle Date columns of different types, integer and numeric (#1204)", {
  a <- data.frame(date = as.Date("2015-06-07"))
  b <- data.frame(date = structure( as.integer(a$date), class = "Date" ) )
  expect_true( all.equal(a, b) )
})

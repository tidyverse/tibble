context("Glimpse")

test_that("glimpse output matches known output", {
  expect_output_identical(
    glimpse(tbl_df(mtcars), width = 70L),
    "glimpse/mtcars-70.txt")

  expect_output_identical(
    glimpse(tbl_df(iris), width = 70L),
    "glimpse/iris-70.txt")

  expect_output_identical(
    glimpse(tbl_df(iris[integer()]), width = 70L),
    "glimpse/iris-empty-70.txt")

  expect_output_identical(
    glimpse(tbl_df(df_all), width = 70L),
    "glimpse/all-70.txt")

  withr::with_options(
    list(tibble.width = 50),
    expect_output_identical(
      glimpse(tbl_df(df_all)),
      "glimpse/all-50.txt")
  )

  expect_output_identical(
    glimpse(5),
    "glimpse/5.txt")
})

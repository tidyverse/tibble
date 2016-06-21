context("Glimpse")

test_that("glimpse output matches known output", {
  expect_output_file_rel(
    glimpse(as_data_frame(mtcars), width = 70L),
    "glimpse/mtcars-70.txt")

  expect_output_file_rel(
    glimpse(as_data_frame(iris), width = 70L),
    "glimpse/iris-70.txt")

  expect_output_file_rel(
    glimpse(as_data_frame(iris[integer()]), width = 70L),
    "glimpse/iris-empty-70.txt")

  expect_output_file_rel(
    glimpse(as_data_frame(df_all), width = 70L),
    "glimpse/all-70.txt")

  withr::with_options(
    list(tibble.width = 50),
    expect_output_file_rel(
      glimpse(as_data_frame(df_all)),
      "glimpse/all-50.txt")
  )

  withr::with_options(
    list(tibble.width = 35),
    expect_output_file_rel(
      glimpse(as_data_frame(df_all)),
      "glimpse/all-35.txt")
  )

  expect_output_file_rel(
    glimpse(5),
    "glimpse/5.txt")
})

context("Glimpse")

test_that("format_v for values", {
  expect_equal(format_v(1), "1")
  expect_equal(format_v(1:3), c("1", "2", "3"))
  expect_equal(format_v(NA), "NA")
  expect_equal(format_v(TRUE), "TRUE")
  expect_equal(format_v(logical()), character())
})

test_that("format_v for character", {
  expect_equal(format_v("1"), paste0('"', "1", '"'))
  expect_equal(format_v(letters), paste0('"', letters, '"'))
  expect_equal(format_v(NA_character_), "NA")
  expect_equal(format_v(character()), character())
})

test_that("format_v for list", {
  expect_equal(format_v(list(1:3)), "<1, 2, 3>")
  expect_equal(format_v(as.list(1:3)), "[1, 2, 3]")
  expect_equal(format_v(list(1:3, 4)), "[<1, 2, 3>, 4]")
  expect_equal(format_v(list(1:3, 4:5)), "[<1, 2, 3>, <4, 5>]")
  expect_equal(format_v(list()), "[]")

  skip("format_v corner cases")
  expect_equal(format_v(list(list())), "[[]]")
  expect_equal(format_v(list(character())), "[<>]")
  expect_equal(format_v(list(1:3, list(4))), "[<1, 2, 3>, [4]]")
  expect_equal(format_v(list(1:3, list(4:5))), "[<1, 2, 3>, [<4, 5>]]")
})

test_that("glimpse output matches known output", {
  expect_output_file_rel(
    glimpse(as_tibble(mtcars), width = 70L),
    "glimpse/mtcars-70.txt")

  expect_output_file_rel(
    glimpse(as_tibble(iris), width = 70L),
    "glimpse/iris-70.txt")

  expect_output_file_rel(
    glimpse(as_tibble(iris[integer()]), width = 70L),
    "glimpse/iris-empty-70.txt")

  expect_output_file_rel(
    glimpse(as_tibble(df_all), width = 70L),
    "glimpse/all-70.txt")

  withr::with_options(
    list(tibble.width = 50),
    expect_output_file_rel(
      glimpse(as_tibble(df_all)),
      "glimpse/all-50.txt")
  )

  withr::with_options(
    list(tibble.width = 35),
    expect_output_file_rel(
      glimpse(as_tibble(df_all)),
      "glimpse/all-35.txt")
  )

  expect_output_file_rel(
    glimpse(5),
    "glimpse/5.txt")
})

test_that("glimpse(width = Inf) raises legible error", {
  expect_error(glimpse(mtcars, width = Inf), "is[.]finite")
})

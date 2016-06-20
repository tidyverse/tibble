context("Truncated matrix")

test_that("print() returns output invisibly", {
  expect_output(ret <- withVisible(print(as_data_frame(mtcars))))
  expect_false(ret$visible)
  expect_identical(ret$value, as_data_frame(mtcars))
})

test_that("trunc_mat output matches known output", {
  expect_output_file_rel(
    print(as_data_frame(mtcars), n = 8L, width = 30L),
    "trunc_mat/mtcars-8-30.txt")

  expect_output_file_rel(
    print(as_data_frame(iris), n = 5L, width = 30L),
    "trunc_mat/iris-5-30.txt")

  expect_output_file_rel(
    print(as_data_frame(iris), n = 3L, width = 5L),
    "trunc_mat/iris-3-5.txt")

  expect_output_file_rel(
    print(as_data_frame(iris), n = NULL, width = 70L),
    "trunc_mat/iris--70.txt")

  expect_output_file_rel(
    print(as_unknown_rows(iris), n = 10, width = 70L),
    "trunc_mat/iris_unk-10-70.txt")

  expect_output_file_rel(
    print(df_all, n = NULL, width = 30L),
    "trunc_mat/all--30.txt")

  expect_output_file_rel(
    print(df_all, n = NULL, width = 300L),
    "trunc_mat/all--300.txt")

  expect_output_file_rel(
    print(data_frame(a = seq.int(10000)), n = 5L, width = 30L),
    "trunc_mat/long-5-30.txt")

  expect_output_file_rel(
    print(data_frame(a = character(), b = logical()), width = 30L),
    "trunc_mat/zero_rows--30.txt")

  expect_output_file_rel(
    print(as_data_frame(iris)[character()], n = 5L, width = 30L),
    "trunc_mat/zero_cols-5-30.txt")

  expect_output_file_rel(
    print(as_unknown_rows(iris[, character()]), n = 5L, width = 30L),
    "trunc_mat/zero-cols_unk-5-30.txt")

  expect_output_file_rel(
    print(as_unknown_rows(data_frame(a = seq.int(10000))), n = 5L,
          width = 30L),
    "trunc_mat/long_unk-5-30.txt")

  expect_output_file_rel(
    print(trunc_mat(df_all, n = 1L, n_extra = 2L, width = 30L)),
    "trunc_mat/all-1-30-2.txt")

  expect_output_file_rel(
    print(trunc_mat(df_all, n = 1L, n_extra = 0L, width = 30L)),
    "trunc_mat/all-1-30-0.txt")

  expect_output_knit(
    knitr::knit_print(trunc_mat(df_all, width = 60L)),
    "trunc_mat/all-knit-60.txt")

  expect_output_knit(
    knitr::knit_print(trunc_mat(df_all, width = 120L)),
    "trunc_mat/all-knit-120.txt")

  expect_output_knit(
    knitr::knit_print(trunc_mat(mtcars, width = 60L)),
    "trunc_mat/mtcars-knit-60.txt")
})

test_that("trunc_mat for POSIXlt columns (#86)", {
  df <- data_frame(x = as.POSIXct("2016-01-01 12:34:56 GMT") + 1:12)
  df$y <- as.POSIXlt(df$x)

  expect_output_file_rel(
    print(as_data_frame(df), n = 8L, width = 60L),
    "trunc_mat/POSIXlt-8-30.txt")
})

test_that("strings are shortend", {
  vec <- c("a", "123456789", "1234 678901234 67890")
  exp_10 <- c("a", "123456789", "1234 67890...")

  expect_equal(format_character(vec), vec)

  withr::with_options(
    list(tibble.print_string_max = 10),
    expect_equal(format_character(vec), exp_10))
})

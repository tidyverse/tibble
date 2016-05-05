context("Truncated matrix")

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
    print(df_all, n = NULL, width = 30L),
    "trunc_mat/all--30.txt")

  expect_output_file_rel(
    print(data_frame(a = character(), b = logical()), width = 30L),
    "trunc_mat/zero_rows--30.txt")

  expect_output_file_rel(
    print(as_data_frame(iris)[character()], n = 5L, width = 30L),
    "trunc_mat/zero_cols-5-30.txt")

  expect_output_file_rel(
    print(trunc_mat(df_all, n = 1L, n_extra = 2L, width = 30L)),
    "trunc_mat/all-1-30-2.txt")

  knit <- knitr::knit_print(trunc_mat(df_all, width = 60L))
  expect_output_file_rel(
    cat(knit),
    "trunc_mat/all-knit-60.txt")
  expect_is(knit, "knit_asis")
  expect_true(attr(knit, "knit_cacheable"))

  knit <- knitr::knit_print(trunc_mat(df_all, width = 120L))
  expect_output_file_rel(
    cat(knit),
    "trunc_mat/all-knit-120.txt")
  expect_is(knit, "knit_asis")
  expect_true(attr(knit, "knit_cacheable"))
})

context("Truncated matrix")

test_that("interface of print() identical to trunc_mat()", {
  print_arg_names <- names(formals(print.tbl_df))
  print_arg_names_without_ellipsis <- setdiff(print_arg_names, "...")

  trunc_mat_arg_names <- names(formals(trunc_mat))

  expect_equal(print_arg_names_without_ellipsis, trunc_mat_arg_names)
})

test_that("print() returns output invisibly", {
  expect_output(ret <- withVisible(print(as_tibble(mtcars))))
  expect_false(ret$visible)
  expect_identical(ret$value, as_tibble(mtcars))
})

test_that("trunc_mat output matches known output", {
  skip_on_os("windows")

  expect_output_file_rel(
    print(as_tibble(mtcars), n = 8L, width = 30L),
    "trunc_mat/mtcars-8-30.txt")

  expect_output_file_rel(
    print(as_tibble(iris), n = 5L, width = 30L),
    "trunc_mat/iris-5-30.txt")

  expect_output_file_rel(
    print(as_tibble(iris), n = 3L, width = 5L),
    "trunc_mat/iris-3-5.txt")

  expect_output_file_rel(
    print(as_tibble(iris), n = NULL, width = 70L),
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
    print(tibble(a = seq.int(10000)), n = 5L, width = 30L),
    "trunc_mat/long-5-30.txt")

  expect_output_file_rel(
    print(tibble(a = character(), b = logical()), width = 30L),
    "trunc_mat/zero_rows--30.txt")

  expect_output_file_rel(
    print(as_tibble(iris)[character()], n = 5L, width = 30L),
    "trunc_mat/zero_cols-5-30.txt")

  expect_output_file_rel(
    print(as_unknown_rows(iris[integer(), ]), n = 5L, width = 30L),
    "trunc_mat/zero-rows_unk-5-30.txt")

  expect_output_file_rel(
    print(as_unknown_rows(iris[, character()]), n = 5L, width = 30L),
    "trunc_mat/zero-cols_unk-5-30.txt")

  expect_output_file_rel(
    print(as_unknown_rows(tibble(a = seq.int(10000))), n = 5L,
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
  skip_on_os("windows")

  df <- tibble(x = as.POSIXct("2016-01-01 12:34:56 GMT") + 1:12)
  df$y <- as.POSIXlt(df$x)

  expect_output_file_rel(
    print(as_tibble(df), n = 8L, width = 60L),
    "trunc_mat/POSIXlt-8-60.txt")
})

test_that("trunc_mat for wide-character columns (#100)", {
  skip_on_os("windows")

  x <- c("成交日期", "合同录入日期")
  df <- setNames(tibble(1:3, 4:6), x)

  expect_output_file_rel(
    print(df, n = 8L, width = 60L),
    "trunc_mat/wide-8-60.txt")
})

test_that("trunc_mat backticks non-syntactic names", {
  tb <- tibble(
    `:)` = "smile",
    ` ` = "space"
  )
  narrow <- trunc_mat(tb, width = 5)
  expect_equal(names(narrow$table), "`:)`")
  expect_equal(names(narrow$extra), "` `")
})

test_that("trunc_mat backticks NA names", {
  tb <- tibble(
    x = 1,
    y = 2,
    z = 3
  )
  ## there must be at least 2 NA names
  colnames(tb)[1:2] <- NA
  narrow <- trunc_mat(tb, width = 5)
  expect_equal(names(narrow$table), "`NA`")
  expect_equal(names(narrow$extra), c("`NA`", "z"))
})

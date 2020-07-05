context("Truncated matrix")

test_that("interface of print() identical to trunc_mat()", {
  print_arg_names <- names(formals(print.tbl))
  print_arg_names_without_ellipsis <- setdiff(print_arg_names, "...")

  trunc_mat_arg_names <- names(formals(trunc_mat))

  expect_equal(print_arg_names_without_ellipsis, trunc_mat_arg_names)
})

test_that("print() returns output invisibly", {
  expect_output(ret <- withVisible(print(as_tibble(iris))))
  expect_false(ret$visible)
  expect_identical(ret$value, as_tibble(iris))
})

test_that("trunc_mat output matches known output", {
  skip_on_non_utf8_locale()
  skip_if_not_installed("mockr")
  testthat::skip_if(getRversion() < "3.2")

  mtcars2 <- as_tibble(mtcars, rownames = NA)

  expect_output_file_rel(
    print_without_body(mtcars2, n = 8L, width = 30L),
    "trunc_mat/mtcars-8-30.txt"
  )

  expect_output_file_rel(
    print_without_body(as_tibble(iris), n = 5L, width = 30L),
    "trunc_mat/iris-5-30.txt"
  )

  expect_output_file_rel(
    print_without_body(as_tibble(iris), n = -1L, width = 30L),
    "trunc_mat/iris-neg-30.txt"
  )

  expect_output_file_rel(
    print_without_body(as_tibble(iris), n = Inf, width = 30L),
    "trunc_mat/iris-inf-30.txt"
  )

  expect_output_file_rel(
    print_without_body(as_tibble(iris), n = 3L, width = 5L),
    "trunc_mat/iris-3-5.txt"
  )

  expect_output_file_rel(
    print_without_body(as_tibble(iris), n = NULL, width = 70L),
    "trunc_mat/iris--70.txt"
  )

  expect_output_file_rel(
    print_without_body(as_unknown_rows(iris), n = 10, width = 70L),
    "trunc_mat/iris_unk-10-70.txt"
  )

  expect_output_file_rel(
    print_without_body(as_unknown_rows(iris[1:9, ]), n = 10, width = 70L),
    "trunc_mat/iris_9_unk-10-70.txt"
  )

  expect_output_file_rel(
    print_without_body(as_unknown_rows(iris[1:10, ]), n = 10, width = 70L),
    "trunc_mat/iris_10_unk-10-70.txt"
  )

  expect_output_file_rel(
    print_without_body(as_unknown_rows(iris[1:11, ]), n = 10, width = 70L),
    "trunc_mat/iris_11_unk-10-70.txt"
  )

  expect_output_file_rel(
    print_without_body(df_all, n = NULL, width = 30L),
    "trunc_mat/all--30.txt"
  )

  expect_output_file_rel(
    print_without_body(df_all, n = NULL, width = 300L),
    "trunc_mat/all--300.txt"
  )

  expect_output_file_rel(
    print_without_body(tibble(a = seq.int(10000)), n = 5L, width = 30L),
    "trunc_mat/long-5-30.txt"
  )

  expect_output_file_rel(
    print_without_body(tibble(a = character(), b = logical()), width = 30L),
    "trunc_mat/zero_rows--30.txt"
  )

  expect_output_file_rel(
    print_without_body(as_tibble(iris)[character()], n = 5L, width = 30L),
    "trunc_mat/zero_cols-5-30.txt"
  )

  expect_output_file_rel(
    print_without_body(as_unknown_rows(iris[integer(), ]), n = 5L, width = 30L),
    "trunc_mat/zero-rows_unk-5-30.txt"
  )

  expect_output_file_rel(
    print_without_body(as_unknown_rows(iris[, character()]), n = 5L, width = 30L),
    "trunc_mat/zero-cols_unk-5-30.txt"
  )

  expect_output_file_rel(
    print_without_body(
      as_unknown_rows(tibble(a = seq.int(10000))),
      n = 5L,
      width = 30L
    ),
    "trunc_mat/long_unk-5-30.txt"
  )

  expect_output_file_rel(
    print_without_body(trunc_mat(df_all, n = 1L, n_extra = 2L, width = 30L)),
    "trunc_mat/all-1-30-2.txt"
  )

  expect_output_file_rel(
    print_without_body(trunc_mat(df_all, n = 1L, n_extra = 0L, width = 30L)),
    "trunc_mat/all-1-30-0.txt"
  )

  expect_output_file_rel(
    print_without_body(trunc_mat(tibble("mean(x)" = 5, "var(x)" = 3), width = 28)),
    "trunc_mat/non-syntactic.txt"
  )
})

test_that("trunc_mat for POSIXlt columns (#86)", {
  skip_on_non_utf8_locale()

  df <- tibble(x = as.POSIXct("2016-01-01 12:34:56 GMT") + 1:12)
  df$y <- as.POSIXlt(df$x)

  expect_output_file_rel(
    print(df, n = 8L, width = 60L),
    "trunc_mat/POSIXlt-8-60.txt"
  )
})

test_that("trunc_mat for wide-character columns (#100)", {
  skip_on_non_utf8_locale() # capture_output_lines() forces native encoding

  x <- c("\u6210\u4ea4\u65e5\u671f", "\u5408\u540c\u5f55\u5165\u65e5\u671f")
  df <- setNames(tibble(1:3, 4:6), x)

  expect_output_file_rel(
    print(df, n = 8L, width = 60L),
    "trunc_mat/wide-8-60.txt"
  )
})

test_that("trunc_mat for wide-character columns in non-UTF-8 locale", {
  skip_on_non_utf8_locale() # capture_output_lines() forces native encoding

  with_non_utf8_locale({
    x <- c("\u6210\u4ea4\u65e5\u671f", "\u5408\u540c\u5f55\u5165\u65e5\u671f")
    df <- setNames(tibble(1:3, 4:6), x)

    expect_output_file_rel(
      print(df, n = 8L, width = 60L),
      "trunc_mat/wide-8-60.txt"
    )
  })
})

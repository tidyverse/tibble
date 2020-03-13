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

test_that("trunc_mat header output", {
  skip_on_non_utf8_locale()
  skip_if_not_installed("mockr")
  testthat::skip_if(getRversion() < "3.2")

  verify_output("trunc_mat.txt", unicode = TRUE, {
    mtcars2 <- as_tibble(mtcars, rownames = NA)

    print_without_body(mtcars2, n = 8L, width = 30L)

    print_without_body(as_tibble(iris), n = 5L, width = 30L)

    print_without_body(as_tibble(iris), n = -1L, width = 30L)

    print_without_body(as_tibble(iris), n = Inf, width = 30L)

    print_without_body(as_tibble(iris), n = 3L, width = 5L)

    print_without_body(as_tibble(iris), n = NULL, width = 70L)

    print_without_body(as_unknown_rows(iris), n = 10, width = 70L)

    print_without_body(as_unknown_rows(iris[1:9, ]), n = 10, width = 70L)

    print_without_body(as_unknown_rows(iris[1:10, ]), n = 10, width = 70L)

    print_without_body(as_unknown_rows(iris[1:11, ]), n = 10, width = 70L)

    print_without_body(df_all, n = NULL, width = 30L)

    print_without_body(df_all, n = NULL, width = 300L)

    print_without_body(tibble(a = seq.int(10000)), n = 5L, width = 30L)

    print_without_body(tibble(a = character(), b = logical()), width = 30L)

    print_without_body(as_tibble(iris)[character()], n = 5L, width = 30L)

    print_without_body(as_unknown_rows(iris[integer(), ]), n = 5L, width = 30L)

    print_without_body(as_unknown_rows(iris[, character()]), n = 5L, width = 30L)

    print_without_body(
      as_unknown_rows(tibble(a = seq.int(10000))),
      n = 5L,
      width = 30L
    )

    print_without_body(trunc_mat(df_all, n = 1L, n_extra = 2L, width = 30L))

    print_without_body(trunc_mat(df_all, n = 1L, n_extra = 0L, width = 30L))

    df <- tibble(!!!set_names(c(5, 3), c("mean(x)", "var(x)")))
    print_without_body(trunc_mat(df, width = 28))
  })
})

test_that("trunc_mat output matches known output", {
  skip_on_non_utf8_locale()
  testthat::skip_if(getRversion() < "3.2")

  verify_output("trunc_mat_full.txt", unicode = TRUE, {
    df <- tibble(x = as.POSIXct("2016-01-01 12:34:56 GMT") + 1:12)
    df$y <- as.POSIXlt(df$x)

    print(df, n = 8L, width = 60L)

    x <- c("\u6210\u4ea4\u65e5\u671f", "\u5408\u540c\u5f55\u5165\u65e5\u671f")
    df <- setNames(tibble(1:3, 4:6), x)
    print(df, n = 8L, width = 60L)
  })
})

test_that("big_mark() works for large numbers", {
  expect_match(big_mark(123), "123")
  expect_match(big_mark(123456), "123.456")
  expect_match(big_mark(123456789), "123.456.789")
})

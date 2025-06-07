test_that("print() returns output invisibly", {
  expect_output(ret <- withVisible(print(as_tibble(trees))))
  expect_false(ret$visible)
  expect_identical(ret$value, as_tibble(trees))
})

test_that("output test", {
  skip_if(getRversion() < "3.2")

  expect_snapshot({
    mtcars2 <- as_tibble(mtcars, rownames = NA)

    print_without_body(mtcars2, n = 8L, width = 30L)

    print_without_body(as_tibble(trees), n = 5L, width = 30L)

    print_without_body(as_tibble(trees), n = -1L, width = 30L)

    print_without_body(as_tibble(trees), n = Inf, width = 15L)

    print_without_body(as_tibble(trees), n = NULL, width = 70L)

    print_without_body(as_unknown_rows(trees), n = 10, width = 70L)

    print_without_body(as_unknown_rows(trees[1:9, ]), n = 10, width = 70L)

    print_without_body(as_unknown_rows(trees[1:10, ]), n = 10, width = 70L)

    print_without_body(as_unknown_rows(trees[1:11, ]), n = 10, width = 70L)

    print_without_body(df_all, n = NULL, width = 30L)

    print_without_body(df_all, n = NULL, width = 300L)

    print_without_body(tibble(a = seq.int(10000)), n = 5L, width = 30L)

    print_without_body(tibble(a = character(), b = logical()), width = 30L)

    print_without_body(as_tibble(trees)[character()], n = 5L, width = 30L)

    print_without_body(as_unknown_rows(trees[integer(), ]), n = 5L, width = 30L)

    print_without_body(
      as_unknown_rows(trees[, character()]),
      n = 5L,
      width = 30L
    )

    print_without_body(
      as_unknown_rows(tibble(a = seq.int(10000))),
      n = 5L,
      width = 30L
    )
  })
})

test_that("full output test", {
  skip_if(getRversion() < "3.2")

  expect_snapshot({
    df <- tibble(x = as.POSIXct("2016-01-01 12:34:56 GMT") + 1:12)
    df$y <- as.POSIXlt(df$x)

    print(df, n = 8L, width = 60L)

    x <- c("\u6210\u4ea4\u65e5\u671f", "\u5408\u540c\u5f55\u5165\u65e5\u671f")
    df <- setNames(tibble(1:3, 4:6), x)
    print(df, n = 8L, width = 60L)
  })
})

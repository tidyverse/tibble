context("options")

test_that("tibble option takes preference", {
  withr::with_options(
    list(
      tibble.width = 10,
      dplyr.width = 20
    ),
    expect_equal(tibble_opt("width"), 10)
  )
})

test_that("dplyr option is used for compatibility", {
  withr::with_options(
    list(
      tibble.width = NULL,
      dplyr.width = 20
    ),
    expect_equal(tibble_opt("width"), 20)
  )
})

test_that("fallback to default option", {
  withr::with_options(
    list(
      tibble.width = NULL,
      dplyr.width = NULL
    ),
    expect_equal(tibble_opt("width"), op.tibble[["tibble.width"]])
  )
})

test_that("tibble_width returns user-input width,
          then tibble.width option, then width option", {
  test_width <- 42

  expect_equal(tibble_width(test_width), test_width)
  withr::with_options(
    list(tibble.width = test_width),
    expect_equal(tibble_width(NULL), test_width)
  )
  withr::with_options(
    list(width = test_width),
    expect_equal(tibble_width(NULL), test_width)
  )
})

test_that("tibble_width prefers tibble.width / dplyr.width over width", {
  withr::with_options(
    list(tibble.width = 10, width = 20),
    expect_equal(tibble_width(NULL), 10)
  )

  withr::with_options(
    list(dplyr.width = 10, width = 20),
    expect_equal(tibble_width(NULL), 10)
  )
})

test_that("tibble_glimpse_width returns user-input width,
          then tibble.width option, then width option", {
  test_width <- 42

  expect_equal(tibble_glimpse_width(test_width), test_width)
  withr::with_options(
    list(tibble.width = test_width),
    expect_equal(tibble_glimpse_width(NULL), test_width)
  )
  withr::with_options(
    list(width = test_width),
    expect_equal(tibble_glimpse_width(NULL), test_width)
  )
})

test_that("tibble_glimpse_width prefers tibble.width / dplyr.width over width", {
  withr::with_options(
    list(tibble.width = 10, width = 20),
    expect_equal(tibble_glimpse_width(NULL), 10)
  )

  withr::with_options(
    list(dplyr.width = 10, width = 20),
    expect_equal(tibble_glimpse_width(NULL), 10)
  )
})

test_that("tibble_glimpse_width ignores Inf tibble.width", {
  withr::with_options(
    list(tibble.width = Inf, width = 20),
    expect_equal(tibble_glimpse_width(NULL), 20)
  )
})

test_that("print.tbl ignores max.print option", {
  iris2 <- as_tibble(iris)
  expect_output(
    withr::with_options(list(max.print = 3), print(iris2)),
    capture_output(print(iris2)),
    fixed = TRUE
  )
})

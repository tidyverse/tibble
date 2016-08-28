context("utils-format")

test_that("tibble_width returns user-input width,
          then tibble.width option, then width option", {
  test_width <- rpois(1, 100) # Randomized test value

  expect_equal(tibble_width(test_width), test_width)
  withr::with_options(
    list(tibble.width = test_width),
    expect_equal(tibble_width(NULL), test_width))
  withr::with_options(
    list(width = test_width),
    expect_equal(tibble_width(NULL), test_width))
})

test_that("tibble_width prefers tibble.width / dplyr.width over width", {
  withr::with_options(
    list(tibble.width = 10, width = 20),
    expect_equal(tibble_width(NULL), 10))

  withr::with_options(
    list(dplyr.width = 10, width = 20),
    expect_equal(tibble_width(NULL), 10))
})

test_that("tibble_glimpse_width returns user-input width,
          then tibble.width option, then width option", {
  test_width <- rpois(1, 100) # Randomized test value

  expect_equal(tibble_glimpse_width(test_width), test_width)
  withr::with_options(
    list(tibble.width = test_width),
    expect_equal(tibble_glimpse_width(NULL), test_width))
  withr::with_options(
    list(width = test_width),
    expect_equal(tibble_glimpse_width(NULL), test_width))
})

test_that("tibble_glimpse_width prefers tibble.width / dplyr.width over width", {
  withr::with_options(
    list(tibble.width = 10, width = 20),
    expect_equal(tibble_glimpse_width(NULL), 10))

  withr::with_options(
    list(dplyr.width = 10, width = 20),
    expect_equal(tibble_glimpse_width(NULL), 10))
})

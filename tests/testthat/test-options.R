context("options")

test_that("tibble option takes preference", {
  withr::with_options(
    list(tibble.width = 10,
         dplyr.width = 20),
    expect_equal(tibble_opt("width"), 10))
})

test_that("dplyr option is used for compatibility", {
  withr::with_options(
    list(tibble.width = NULL,
         dplyr.width = 20),
    expect_equal(tibble_opt("width"), 20))
})

test_that("fallback to default option", {
  withr::with_options(
    list(tibble.width = NULL,
         dplyr.width = NULL),
    expect_equal(tibble_opt("width"), op.tibble[["tibble.width"]]))
})

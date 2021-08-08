test_that("tibble vignette", {
  skip_if_not_installed("rlang", "0.4.11.9001")

  test_galley("tibble")
})

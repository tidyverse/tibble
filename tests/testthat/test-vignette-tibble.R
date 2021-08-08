test_that("tibble vignette", {
  # Unclear
  skip_on_ci()
  skip_if_not_installed("rlang", "0.4.11.9001")

  test_galley("tibble")
})

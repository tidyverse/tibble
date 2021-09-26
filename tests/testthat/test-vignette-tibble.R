test_that("tibble vignette", {
  # Unclear
  skip_on_ci()
  skip_if_not_installed("rlang", "0.4.11.9001")
  skip_if_not_installed("knitr", "1.34.2")

  test_galley("tibble")
})

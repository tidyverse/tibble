test_that("tibble vignette", {
  # Unclear
  skip_if_not_installed("knitr", "1.34.2")

  test_galley("tibble", variant = rlang_variant())
})

test_that("types vignette", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("tidyr")
  skip_if_not_installed("purrr")

  test_galley("types", variant = rlang_variant())
})

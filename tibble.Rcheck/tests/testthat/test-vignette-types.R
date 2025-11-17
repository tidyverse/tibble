test_that("types vignette", {
  skip_if_not_installed("dplyr")
  skip_if_not_installed("tidyr")
  skip_if_not_installed("purrr")
  skip_if_not_installed("bit64")
  skip_if_not_installed("blob")
  skip_if_not_installed("hms")

  test_galley("types", variant = rlang_variant())
})

test_that("formats vignette", {
  skip_if_not_installed("knitr", "1.34.2")
  skip_if_not_installed("dplyr")
  skip_if_not_installed("formattable")
  skip_if_not_installed("ggplot2")
  skip_if_not_installed("tidyr")

  # Fails on Linux
  test_galley("formats")
})

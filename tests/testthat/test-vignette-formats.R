test_that("formats vignette", {
  skip_if_not_installed("knitr", "1.34.2")

  # Fails on Linux
  test_galley("formats")
})

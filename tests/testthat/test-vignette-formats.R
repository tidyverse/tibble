test_that("formats vignette", {
  skip_if_not_installed("pillar", "1.6.2")
  test_galley("formats")
})

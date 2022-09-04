test_that("invariants vignette", {
  skip_if_not_installed("vctrs", "0.4.1.9000")
  skip_if_not_installed("knitr", "1.34.2")
  skip_if(getRversion() < "4.0")
  test_galley("invariants", variant = rlang_pillar_variant())
})

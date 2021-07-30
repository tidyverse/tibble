test_that("invariants vignette", {
  skip_if(getRversion() < "4.0")
  test_galley("invariants")
})

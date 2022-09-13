test_that("types vignette", {
  # FIXME: tidyr warning about vec_unchop()
  local_options(lifecycle_verbosity = "quiet")

  test_galley("types", variant = rlang_variant())
})

test_that("invariants vignette", {
  skip_on_cran()

  path <- render_galley("invariants.Rmd")
  expect_snapshot_file(path, name = "invariants.md", compare = compare_file_text)
})

test_that("invariants vignette", {
  skip_on_cran()

  path <- tempfile(fileext = ".md")

  suppressMessages(capture.output(
    rmarkdown::render(
      vignette_path("invariants.Rmd"),
      output_file = path,
      output_format = rmarkdown::md_document(preserve_yaml = TRUE)
    )
  ))

  expect_snapshot_file(path, name = "invariants.md", compare = compare_file_text)
})

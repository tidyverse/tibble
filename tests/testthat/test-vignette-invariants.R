test_that("invariants vignette", {
  path <- tempfile(fileext = ".md")

  suppressMessages(capture.output(
    rmarkdown::render(
      system.file("vignettes/invariants.Rmd", package = "tibble"),
      output_file = path,
      output_format = rmarkdown::md_document(preserve_yaml = TRUE)
    )
  ))

  expect_snapshot_file(path, name = "invariants.md", compare = compare_file_text)
})

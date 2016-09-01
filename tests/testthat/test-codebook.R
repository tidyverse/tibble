context("Codebook")

test_that("codebook for numeric matches known output", {
  expect_output_file_rel(
    codebook(df_labelled$mpg, width = 70L),
    "codebook/labelled-mpg-70.txt")
})

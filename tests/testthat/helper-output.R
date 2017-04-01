output_file <- function(filename) file.path("output", filename)

expect_output_file_rel <- function(x, filename) {
  expect_output_file(x, output_file(filename), update = TRUE)
}

expect_output_knit <- function(knit, filename, envir = parent.frame()) {
  expect_output_file_rel(cat(knit), filename)
}

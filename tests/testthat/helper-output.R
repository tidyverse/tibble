output_file <- function(filename) file.path("output", filename)

expect_output_identical <- function(x, filename) {
  expect_output_file(x, output_file(filename), update = TRUE)
}

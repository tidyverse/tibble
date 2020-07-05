output_file <- function(filename) file.path("output", filename)

expect_output_file_rel <- function(x, filename) {
  withr::with_options(
    list(digits = 4, width = 80),
    expect_output_file(x, output_file(filename), update = TRUE)
  )
}

expect_output_knit <- function(knit, filename, envir = parent.frame()) {
  expect_output_file_rel(cat(knit), filename)
}

unell <- function(x) {
  gsub(cli::symbol$ellipsis, "...", x, fixed = TRUE)
}

unell_bullets <- function(...) {
  unell(bullets(...))
}

unell_commas <- function(...) {
  unell(commas(...))
}

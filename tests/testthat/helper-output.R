output_file <- function(filename) file.path("output", filename)

expect_output_file_rel <- function(x, filename) {
  withr::with_options(list(digits = 4, width = 80),
    expect_output_file(x, output_file(filename), update = TRUE)
  )
}

expect_output_knit <- function(knit, filename, envir = parent.frame()) {
  expect_asis_output_with_cacheable(substitute(knit), envir)
  expect_output_file_rel(cat(knit), filename)
}

expect_asis_output_with_cacheable <- function(knit_call, envir) {
  asis_output_args <-
    withr::with_options(list(digits = 4, width = 80),
      with_mock(`knitr::asis_output` = function(...) list(...),
        eval(knit_call, envir = envir)
      ))
  expect_true(asis_output_args[["cacheable"]])
}

output_file <- function(filename) file.path("output", filename)

try_read_output <- function(filename) {
  filepath <- output_file(filename)
  if (!file.exists(filepath))
    return(character())
  readLines(filepath)
}

write_output <- function(text, filename) {
  tryCatch(
    writeLines(text, output_file(filename)),
    error = function(e) NULL
  )
}

expect_output_identical <- function(x, filename) {
  expr <- substitute(x)
  out <- eval(bquote(expect_equal(
    capture.output(.(expr)),
    try_read_output(.(filename)))), parent.frame())
  write_output(out, filename)
}

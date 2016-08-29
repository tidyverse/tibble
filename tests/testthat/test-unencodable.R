context("unencodable")

unencodable <- function() {
  # An umlaut and a Chinese character, one of them probably can't be represented
  # in the native locale
  cand <- c("\u00f6", "\u6210")
  native <- enc2native(cand)
  different <- cand != native
  if (!any(different)) {
    skip("Cannot be tested in UTF-8 locale")
  }
  cand[different][[1]]
}

test_that("warning with unencodable column names", {
  data <- data.frame(a = 1)
  colnames(data) <- unencodable()
  expect_warning(as_tibble(data), "native encoding")
})

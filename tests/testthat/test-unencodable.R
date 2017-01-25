context("unencodable")

with_latin1_locale <- function(code) {
  all_locales <- system2("locale", "-a", stdout = TRUE)
  latin1_locale <- grep(8859, all_locales, value = TRUE)

  if (length(latin1_locale) == 0) {
    warning("No latin-1 locale found.", call. = FALSE)
  }

  withr::with_locale(c(LC_CTYPE = latin1_locale[[1]]), code)
}

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

with_latin1_locale({

  test_that("warning with unencodable column names", {
    data <- data.frame(a = 1)
    colnames(data) <- unencodable()
    expect_warning(as_tibble(data), "native encoding")
  })

})

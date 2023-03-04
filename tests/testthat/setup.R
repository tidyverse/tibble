if (getRversion() >= "3.6") {
  local_options(
    warnPartialMatchArgs = TRUE,
    warnPartialMatchAttr = TRUE,
    warnPartialMatchDollar = TRUE,
    .frame = testthat::teardown_env()
  )
} else {
  local_options(
    warnPartialMatchAttr = TRUE,
    warnPartialMatchDollar = TRUE,
    .frame = testthat::teardown_env()
  )
}

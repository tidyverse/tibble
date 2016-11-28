context("type_sum")

SomeClass <- function (x) {
  structure(x, class = "SomeClass")
}

type_sum.SomeClass <- function (x, ...) {
  "SC"
}

test_that("works with glimpse", {

  foo <- SomeClass(2011:2013)
  expect_equal(type_sum(foo), "SC")
  expect_output(glimpse(tibble(foo)), "foo <SC>")

})

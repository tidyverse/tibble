context("type_sum")

SomeClass <- function (x) {
  structure(x, class = "SomeClass")
}

# Simply defining type_sum.SomeClass here
# (or inside the following test_that block)
# doesn't seem to work.
#
# So, let's assign it to .GlobalEnv and then
# politely destroy it when we're done testing.
#
assign("type_sum.SomeClass",
       function (x, ...) { "SC" },
       .GlobalEnv)

test_that("works with glimpse", {

  foo <- SomeClass(2011:2013)
  expect_equal(type_sum(foo), "SC")
  expect_output(glimpse(tibble(foo)), "foo <SC>")

})

rm("type_sum.SomeClass",
   envir = .GlobalEnv)

test_that("teardown succeeded", {
  expect_error(
    get("type_sum.SomeClass"),
    "object 'type_sum.SomeClass' not found")
})

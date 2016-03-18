context("repair_names")

test_that("zero-length inputs given character names", {
  out <- repair_names(character())
  expect_equal(names(out), character())
})

test_that("unnamed input gives uniquely named output", {
  out <- repair_names(1:3)
  expect_equal(names(out), c("V1", "V2", "V3"))
})

# make_unique -------------------------------------------------------------

test_that("duplicates are de-deduped", {
  expect_equal(make_unique(c("x", "x")), c("x", "x1"))
})

test_that("blanks get prefix + numeric id", {
  expect_equal(make_unique(c("", "")), c("V1", "V2"))
})

test_that("blanks skip existing names", {
  expect_equal(make_unique(c("", "V1")), c("V2", "V1"))
})

test_that("blanks skip names created when de-duping", {
  expect_equal(make_unique(c("", "V", "V")), c("V2", "V", "V1"))
})

# names2 ------------------------------------------------------------------

test_that("names2 returns character vector even if names NULL", {
  expect_equal(names2(1:3), rep("", 3))
})

test_that("names2 replaces missing value with blanks", {
  x <- 1:3
  names(x) <- c("a", "b", NA)

  expect_equal(names2(x), c("a", "b", ""))
})

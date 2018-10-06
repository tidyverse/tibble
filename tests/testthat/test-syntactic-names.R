context("syntactic_names")

test_that("zero-length inputs given character names", {
  out <- set_syntactic_names(character())
  expect_equal(names(out), character())
})

test_that("unnamed input gives uniquely named output", {
  out <- set_syntactic_names(1:3)
  expect_equal(names(out), c("...1", "...2", "...3"))
})

test_that("messages by default", {
  expect_message(
    set_syntactic_names(set_names(1, "")),
    "New names:\n* `` -> ...1\n",
    fixed = TRUE
  )
})

test_that("quiet = TRUE", {
  expect_message(set_syntactic_names(set_names(1, ""), quiet = TRUE), NA)
})

test_that("non-syntactic names", {
  out <- set_syntactic_names(set_names(1, "a b"))
  expect_equal(names(out), "a.b")

  expect_equal(syntactic_names("a b"), "a.b")
})

# syntactic_names ---------------------------------------------------------------

test_that("zero-length input", {
  expect_equal(syntactic_names(character()), character())
})

test_that("proper names", {
  expect_equal(syntactic_names(letters), letters)
})

test_that("dupes", {
  expect_equal(
    syntactic_names(c("a", "b", "a", "c", "b")),
    c("a..1", "b..2", "a..3", "c", "b..5")
  )
})

test_that("empty", {
  expect_equal(syntactic_names(""), "...1")
})

test_that("dot", {
  expect_equal(syntactic_names("."), "...1")
})

test_that("NA", {
  expect_equal(syntactic_names(NA_character_), "...1")
})

test_that("corner case", {
  expect_equal(syntactic_names("..1"), "...1")
  expect_equal(syntactic_names("..13"), "...1")
  expect_equal(syntactic_names("..."), "....")

  expect_equal(syntactic_names("a..1"), "a")
  expect_equal(syntactic_names(c("a..2", "a")), c("a..1", "a..2"))
  expect_equal(syntactic_names(c("a..3", "a", "a")), c("a..1", "a..2", "a..3"))
  expect_equal(syntactic_names(c("a..2", "a", "a")), c("a..1", "a..2", "a..3"))
  expect_equal(syntactic_names(c("a..2", "a..2", "a..2")), c("a..1", "a..2", "a..3"))
  expect_equal(syntactic_names("if..2"), ".if")
})

test_that("message", {
  expect_message(
    syntactic_names(c("", "")),
    "New names:\n* `` -> ...1\n* `` -> ...2\n",
    fixed = TRUE
  )
})

test_that("quiet", {
  expect_message(
    syntactic_names("", quiet = TRUE),
    NA
  )
})

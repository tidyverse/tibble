context("tidy_names")

test_that("zero-length inputs given character names", {
  out <- tidy_names(character())
  expect_equal(names(out), character())
})

test_that("unnamed input gives uniquely named output", {
  out <- tidy_names(1:3)
  expect_equal(names(out), c("..1", "..2", "..3"))
})

test_that("messages by default", {
  expect_message(
    tidy_names(set_names(1, "")),
    "New names:\n -> ..1",
    fixed = TRUE
  )
})

test_that("quiet = TRUE", {
  expect_message(tidy_names(set_names(1, ""), quiet = TRUE), NA)
})

test_that("syntactic = TRUE", {
  out <- tidy_names(set_names(1, "a b"))
  expect_equal(names(out), make_tidy("a b"))
})

# make_tidy ---------------------------------------------------------------

test_that("zero-length input", {
  expect_equal(make_tidy(character()), character())
})

test_that("proper names", {
  expect_equal(make_tidy(letters), letters)
})

test_that("dupes", {
  expect_equal(make_tidy(c("a", "b", "a", "c", "b")), c("a", "b", "a..3", "c", "b..5"))
})

test_that("empty", {
  expect_equal(make_tidy(""), "..1")
})

test_that("NA", {
  expect_equal(make_tidy(NA_character_), "..1")
})

test_that("corner case", {
  expect_equal(make_tidy(c("a..3", "a", "a")), c("a..1", "a", "a..3"))
  expect_equal(make_tidy(c("a..2", "a", "a")), c("a..1", "a", "a..3"))
  expect_equal(make_tidy(c("a..2", "a..2", "a..2")), c("a..1", "a..2", "a..3"))
})

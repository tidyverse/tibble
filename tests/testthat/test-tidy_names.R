context("tidy_names")

# tidy_names ---------------------------------------------------------------
test_that("zero-length input", {
  expect_identical(tidy_names(character()), character())
})

test_that("unique, syntactic are never changed", {
  expect_identical(tidy_names(letters, syntactic = FALSE), letters)
  expect_identical(tidy_names(letters, syntactic = TRUE), letters)
})

test_that("default is to forward unique_names()", {
  name <- c("a", "b", "a", "c", "b")
  expect_identical(tidy_names(name), unique_names(name))

  expect_identical(tidy_names(""), unique_names(""))
  expect_identical(tidy_names(NA_character_), unique_names(NA_character_))

  name <- c("a..2", "a", "a")
  expect_identical(tidy_names(name), unique_names(name))
})

test_that("syntactic = TRUE forwards to syntactic_names()", {
  expect_identical(tidy_names("a b", syntactic = TRUE), universal_names("a b"))

  name <- c(NA, "", "x", "x", "a1:", "_x_y}")
  expect_identical(tidy_names(name, syntactic = TRUE), universal_names(name))

  name <- c("", ".", NA, "if..4", "if", "if..8", "for", "if){1")
  expect_identical(tidy_names(name, syntactic = TRUE), universal_names(name))
})

test_that("message", {
  expect_message(
    tidy_names(c("", "")),
    "New names:\n* `` -> `..1`\n* `` -> `..2`\n",
    fixed = TRUE
  )
})

test_that("quiet", {
  expect_message(
    tidy_names("", quiet = TRUE),
    NA
  )
})

# set_tidy_names ---------------------------------------------------------------

test_that("zero-length inputs given character names", {
  out <- set_tidy_names(character())
  expect_equal(names(out), character())
})

test_that("unnamed input gives uniquely named output", {
  out <- set_tidy_names(1:3)
  expect_equal(names(out), c("..1", "..2", "..3"))
})

test_that("messages by default", {
  expect_message(
    set_tidy_names(set_names(1, "")),
    "New names:\n* `` -> `..1`\n",
    fixed = TRUE
  )
})

test_that("quiet = TRUE", {
  expect_message(set_tidy_names(set_names(1, ""), quiet = TRUE), NA)
})

test_that("syntactic = FALSE is the default, forwards to unique_names()", {
  out <- set_tidy_names(set_names(1, "a b"))
  expect_equal(names(out), unique_names("a b"))
})

test_that("syntactic = TRUE works, forwards to syntactic_names()", {
  out <- set_tidy_names(set_names(1, "a b"), syntactic = TRUE)
  expect_identical(names(out), universal_names("a b"))
})

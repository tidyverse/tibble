test_that("zero-length inputs given character names", {
  out <- set_tidy_names(character())
  expect_equal(names(out), character())
})

test_that("unnamed input gives uniquely named output", {
  expect_snapshot(
    out <- set_tidy_names(1:3)
  )
  expect_equal(names(out), c("..1", "..2", "..3"))
})

test_that("messages by default", {
  expect_snapshot(
    set_tidy_names(set_names(1, ""))
  )
})

test_that("quiet = TRUE", {
  expect_message(set_tidy_names(set_names(1, ""), quiet = TRUE), NA)
})

test_that("syntactic = TRUE", {
  out <- set_tidy_names(set_names(1, "a b"))
  expect_equal(names(out), tidy_names("a b"))
})

# tidy_names ---------------------------------------------------------------

test_that("zero-length input", {
  expect_equal(tidy_names(character()), character())
})

test_that("proper names", {
  expect_equal(tidy_names(letters), letters)
})

test_that("dupes", {
  expect_snapshot(
    names <- tidy_names(c("a", "b", "a", "c", "b"))
  )
  expect_equal(names, c("a..1", "b..2", "a..3", "c", "b..5"))
})

test_that("empty", {
  expect_snapshot(
    names <- tidy_names("")
  )
  expect_equal(names, "..1")
})

test_that("NA", {
  expect_snapshot(
    names <- tidy_names(NA_character_)
  )
  expect_equal(names, "..1")
})

test_that("corner case", {
  expect_snapshot({
    expect_equal(tidy_names(c("a..2", "a")), c("a..2", "a"))
    expect_equal(tidy_names(c("a..3", "a", "a")), c("a..1", "a..2", "a..3"))
    expect_equal(tidy_names(c("a..2", "a", "a")), c("a..1", "a..2", "a..3"))
    expect_equal(
      tidy_names(c("a..2", "a..2", "a..2")),
      c("a..1", "a..2", "a..3")
    )
  })
})

test_that("syntactic", {
  expect_snapshot(
    names <- tidy_names(c("a b"), syntactic = TRUE)
  )
  expect_equal(names, make.names("a b"))
})

test_that("some syntactic + message (#260)", {
  expect_snapshot(
    names <- tidy_names(c("a b", "c"), syntactic = TRUE)
  )
  expect_equal(names, c(make.names("a b"), "c"))
})

test_that("message", {
  expect_message(
    tidy_names(""),
    "New names:\n -> ..1\n",
    fixed = TRUE
  )
})

test_that("quiet", {
  expect_message(
    tidy_names("", quiet = TRUE),
    NA
  )
})

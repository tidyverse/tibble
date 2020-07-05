context("msg-format")

test_that("bullets", {
  expect_equal(
    unell_bullets("header", c("item 1", "item 2")),
    "header\n* item 1\n* item 2"
  )
  expect_equal(
    unell_bullets("header", LETTERS),
    "header\n* A\n* B\n* C\n* D\n* E\n* ... and 21 more problems"
  )
  expect_equal(
    unell_bullets("header", 1:6),
    "header\n* 1\n* 2\n* 3\n* 4\n* 5\n* ... and 1 more problem"
  )
})

test_that("commas", {
  expect_equal(
    commas("1"),
    "1"
  )
  expect_equal(
    commas(letters[2:4]),
    "b, c, d"
  )
  expect_equal(
    unell_commas(LETTERS),
    "A, B, C, D, E, ... (and 21 more)"
  )
})


test_that("pluralise works correctly", {
  expect_identical(pluralise("[an ]index(es)", c("x")), "an index")
  expect_identical(pluralise("[an ]index(es)", c("x", "y")), "indexes")
})

test_that("pluralise leaves alone parentheses / square brackets that have spaces inside", {
  expect_identical(
    pluralise("[an ]invalid index(es) (be careful) [for real]", c("x")),
    "an invalid index (be careful) [for real]"
  )
  expect_identical(
    pluralise("[an ]invalid index(es) (be careful) [for real]", c("x", "y")),
    "invalid indexes (be careful) [for real]"
  )
})

test_that("pluralise_msg works correctly", {
  expect_identical(pluralise_msg("[an ]index(es) ", c("x")), "an index `x`")
  expect_identical(pluralise_msg("[an ]index(es) ", c("x", "y")), "indexes `x`, `y`")
  expect_identical(pluralise_msg("[an ]index(es) ", c(-4, -5)), "indexes -4, -5")
})

context("msg-format")

test_that("bullets", {
  expect_equal(
    bullets("header", c("item 1", "item 2")),
    "header\n* item 1\n* item 2"
  )
  expect_equal(
    bullets("header", LETTERS),
    "header\n* A\n* B\n* C\n* D\n* E\n* ... and 21 more problems"
  )
  expect_equal(
    bullets("header", 1:6),
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
    commas(LETTERS),
    "A, B, C, D, E, ... (and 21 more)"
  )
})

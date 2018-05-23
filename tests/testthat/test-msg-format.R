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

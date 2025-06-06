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
  expect_identical(
    pluralise_msg("[an ]index(es) ", c("x", "y")),
    "indexes `x`, `y`"
  )
  expect_identical(
    pluralise_msg("[an ]index(es) ", c(-4, -5)),
    "indexes -4, -5"
  )
})

test_that("output test", {
  expect_snapshot({
    "# Problems"
    writeLines(format_error_bullets(problems("header", c("item 1", "item 2"))))
    writeLines(format_error_bullets(problems("header", LETTERS)))
    writeLines(format_error_bullets(problems("header", as.character(1:6))))

    "# Bullets"
    writeLines(format_error_bullets(bullets("header", c("item 1", "item 2"))))
    writeLines(format_error_bullets(bullets("header", LETTERS)))
    writeLines(format_error_bullets(bullets("header", as.character(1:6))))

    "# Commas"
    commas("1")
    commas(letters[2:4])
    commas(LETTERS)
  })
})

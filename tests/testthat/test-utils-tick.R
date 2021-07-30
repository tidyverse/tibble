test_that("output test", {
  expect_snapshot({
    name_or_pos(c("a", "", "c"), 1:3)

    cat(tick(c("a", "b c", "if", "`")))
    cat(tick_if_needed(c("a", "b c", "if", "`")))
  })
})

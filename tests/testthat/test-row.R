context("row")

# tibble_row ------------------------------------------------------------

test_that("basic", {
  model <- lm(hp ~ cyl, mtcars)
  expect_identical(
    tibble_row(a = 1, b = 2:3, c = model, d = list(1)),
    tibble(a = 1, b = list(2:3), c = list(model), d = list(list(1))),
  )
})

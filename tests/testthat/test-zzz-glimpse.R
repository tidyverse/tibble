context("Glimpse")

test_that("format_v for values", {
  expect_equal(format_v(1), "1")
  expect_equal(format_v(1:3), c("1", "2", "3"))
  expect_equal(format_v(NA), "NA")
  expect_equal(format_v(TRUE), "TRUE")
  expect_equal(format_v(logical()), character())
})

test_that("format_v for character", {
  expect_equal(format_v("1"), paste0('"', "1", '"'))
  expect_equal(format_v(letters), paste0('"', letters, '"'))
  expect_equal(format_v(NA_character_), "NA")
  expect_equal(format_v(character()), character())
})

test_that("format_v for factor", {
  expect_equal(format_v(factor(c("1", "a"))), c("1", "a"))
  expect_equal(format_v(factor(c("foo", '"bar"'))), c("foo", "\"bar\""))
  expect_equal(format_v(factor()), character())
  # Add quotes around factor levels with comma
  # so they don't appear as if they were two observations (GH 384)
  expect_equal(
    format_v(factor(c("foo, bar", "foo", '"bar"'))),
    paste0('"', c("foo, bar", "foo", "\\\"bar\\\""), '"')
  )
})

test_that("format_v for list", {
  expect_equal(format_v(list(1:3)), "[<1, 2, 3>]")
  expect_equal(format_v(as.list(1:3)), "[1, 2, 3]")
  expect_equal(format_v(list(1:3, 4)), "[<1, 2, 3>, 4]")
  expect_equal(format_v(list(1:3, 4:5)), "[<1, 2, 3>, <4, 5>]")
  expect_equal(format_v(list()), "[]")

  expect_equal(format_v(list(list())), "[[]]")
  expect_equal(format_v(list(character())), "[<>]")
  expect_equal(format_v(list(1:3, list(4))), "[<1, 2, 3>, [4]]")
  expect_equal(format_v(list(1:3, list(4:5))), "[<1, 2, 3>, [<4, 5>]]")
})

test_that("glimpse output matches known output", {
  skip_on_non_utf8_locale()

  expect_output_file_rel(
    glimpse(as_tibble(mtcars), width = 70L),
    "glimpse/mtcars-70.txt"
  )

  expect_output_file_rel(
    glimpse(as_tibble(iris), width = 70L),
    "glimpse/iris-70.txt"
  )

  expect_output_file_rel(
    glimpse(as_tibble(iris[integer()]), width = 70L),
    "glimpse/iris-empty-70.txt"
  )

  expect_output_file_rel(
    glimpse(tibble("mean(x)" = 5, "var(x)" = 3), width = 28),
    "glimpse/non-syntactic.txt"
  )

  expect_output_file_rel(
    glimpse(as_tibble(df_all), width = 70L),
    "glimpse/all-70.txt"
  )

  withr::with_options(
    list(tibble.width = 50),
    expect_output_file_rel(
      glimpse(as_tibble(df_all)),
      "glimpse/all-50.txt"
    )
  )

  withr::with_options(
    list(tibble.width = 35),
    expect_output_file_rel(
      glimpse(as_tibble(df_all)),
      "glimpse/all-35.txt"
    )
  )

  expect_output_file_rel(
    glimpse(5),
    "glimpse/5.txt"
  )
})

test_that("glimpse(width = Inf) raises legible error", {
  expect_error(
    glimpse(mtcars, width = Inf),
    error_glimpse_infinite_width(),
    fixed = TRUE
  )
})

test_that("glimpse works for structures with unknown rows", {
  skip_on_non_utf8_locale() # capture_output_lines() forces native encoding
  iris2 <- as_unknown_rows(iris)

  expect_output_file(
    glimpse(iris2, width = 70L),
    output_file("glimpse/iris-70-na-nrow.txt")
  )
})

test_that("glimpse calls tbl_sum() (#550)", {
  skip_on_non_utf8_locale() # capture_output_lines() forces native encoding
  iris2 <- as_override_tbl_sum(iris)

  expect_output(
    glimpse(iris2),
    "Overridden: tbl_sum",
    fixed = TRUE
  )
})

test_that("glimpse works on nested data (#486)", {
  skip_on_non_utf8_locale()

  nested_iris_df <- tibble(
    Species = unique(iris$Species),
    data = unname(split(iris, iris$Species))
  )

  nested_iris_tbl <- tibble(
    Species = unique(iris$Species),
    data = map(unname(split(iris, iris$Species)), as_tibble)
  )

  expect_output_file_rel(
    glimpse(nested_iris_df, width = 70L),
    "glimpse/iris-nested-df-70.txt"
  )

  expect_output_file_rel(
    glimpse(nested_iris_tbl, width = 70L),
    "glimpse/iris-nested-tbl-70.txt"
  )
})

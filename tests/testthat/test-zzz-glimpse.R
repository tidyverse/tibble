test_that("format_v for values", {
  skip_dep_glimpse()

  expect_equal(format_v(1), "1")
  expect_equal(format_v(1:3), c("1", "2", "3"))
  expect_equal(format_v(NA), "NA")
  expect_equal(format_v(TRUE), "TRUE")
  expect_equal(format_v(logical()), character())
})

test_that("format_v for character", {
  skip_dep_glimpse()

  expect_equal(format_v("1"), paste0('"', "1", '"'))
  expect_equal(format_v(letters), paste0('"', letters, '"'))
  expect_equal(format_v(NA_character_), "NA")
  expect_equal(format_v(character()), character())
})

test_that("format_v for factor", {
  skip_dep_glimpse()

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
  skip_dep_glimpse()

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
  skip_dep_glimpse()

  skip_on_non_utf8_locale()
  skip_if(packageVersion("pillar") >= "1.4.99")

  local_options(digits = 4, width = 80, cli.unicode = l10n_info()$`UTF-8`)

  expect_snapshot({
    glimpse(as_tibble(mtcars), width = 70L)

    glimpse(as_tibble(iris), width = 70L)

    glimpse(as_tibble(iris[integer()]), width = 70L)

    glimpse(tibble("mean(x)" = 5, "var(x)" = 3), width = 28)

    glimpse(as_tibble(df_all), width = 70L)

    options(tibble.width = 50)
    glimpse(as_tibble(df_all))

    options(tibble.width = 35)
    glimpse(as_tibble(df_all))

    glimpse(5)
  })
})

test_that("glimpse(width = Inf) raises legible error", {
  expect_legacy_error(
    glimpse(mtcars, width = Inf),
    abort_glimpse_infinite_width(),
    fixed = TRUE
  )
})

test_that("glimpse works for structures with unknown rows", {
  skip_on_non_utf8_locale() # capture_output_lines() forces native encoding
  skip_if(packageVersion("pillar") >= "1.4.99")
  iris2 <- as_unknown_rows(iris)

  local_options(digits = 4, width = 80, cli.unicode = l10n_info()$`UTF-8`)

  expect_snapshot({
    glimpse(iris2, width = 70L)
  })
})

test_that("glimpse calls tbl_sum() (#550)", {
  skip_on_non_utf8_locale() # capture_output_lines() forces native encoding
  skip_if(packageVersion("pillar") >= "1.4.99")
  iris2 <- as_override_tbl_sum(iris)

  expect_output(
    glimpse(iris2),
    "Overridden: tbl_sum",
    fixed = TRUE
  )
})

test_that("glimpse works on nested data (#486)", {
  skip_on_non_utf8_locale()
  skip_if(packageVersion("pillar") >= "1.4.99")

  nested_iris_df <- tibble(
    Species = unique(iris$Species),
    data = unname(split(iris, iris$Species))
  )

  nested_iris_tbl <- tibble(
    Species = unique(iris$Species),
    data = map(unname(split(iris, iris$Species)), as_tibble)
  )

  local_options(digits = 4, width = 80, cli.unicode = l10n_info()$`UTF-8`)

  expect_snapshot({
    glimpse(nested_iris_df, width = 70L)

    glimpse(nested_iris_tbl, width = 70L)
  })
})

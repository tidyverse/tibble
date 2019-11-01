test_that("str output matches known output", {
  skip_on_non_utf8_locale()

  expect_output_file_rel(
    str(as_tibble(mtcars), width = 70L),
    "str/mtcars-70.txt"
  )

  expect_output_file_rel(
    str(as_tibble(iris), width = 70L),
    "str/iris-70.txt"
  )

  expect_output_file_rel(
    str(as_tibble(iris[integer()]), width = 70L),
    "str/iris-empty-70.txt"
  )

  expect_output_file_rel(
    str(tibble("mean(x)" = 5, "var(x)" = 3), width = 28),
    "str/non-syntactic.txt"
  )

  expect_output_file_rel(
    str(as_tibble(df_all), width = 70L),
    "str/all-70.txt"
  )

  withr::with_options(
    list(tibble.width = 50),
    expect_output_file_rel(
      str(as_tibble(df_all)),
      "str/all-50.txt"
    )
  )

  withr::with_options(
    list(tibble.width = 35),
    expect_output_file_rel(
      str(as_tibble(df_all)),
      "str/all-35.txt"
    )
  )

  expect_output_file_rel(
    str(5),
    "str/5.txt"
  )
})

test_that("str works for structures with unknown rows", {
  skip_on_non_utf8_locale() # capture_output_lines() forces native encoding
  iris2 <- as_unknown_rows(iris)

  expect_output_file(
    str(iris2, width = 70L),
    output_file("str/iris-70-na-nrow.txt")
  )
})

test_that("str works on nested data (#486)", {
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
    str(nested_iris_df, width = 70L),
    "str/iris-nested-df-70.txt"
  )

  expect_output_file_rel(
    str(nested_iris_tbl, width = 70L),
    "str/iris-nested-tbl-70.txt"
  )
})

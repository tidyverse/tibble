test_that("str output matches known output", {
  skip_on_non_utf8_locale()

  verify_output("str.txt", unicode = TRUE, {
    str(as_tibble(mtcars), width = 70L)

    str(as_tibble(iris), width = 70L)

    "No columns"
    str(as_tibble(iris[integer()]), width = 70L)

    "Non-syntactic names"
    df <- tibble(!!!set_names(c(5, 3), c("mean(x)", "var(x)")))
    str(df, width = 28)

    str(as_tibble(df_all), width = 70L)

    "options(tibble.width = 50)"
    withr::with_options(
      list(tibble.width = 50),
      str(as_tibble(df_all))
    )

    "options(tibble.width = 35)"
    withr::with_options(
      list(tibble.width = 35),
      str(as_tibble(df_all))
    )

    "non-tibble"
    str(5)

    iris2 <- as_unknown_rows(iris)
    str(iris2, width = 70L)

    Species <- unique(iris$Species)
    data <- unname(split(iris, iris$Species))
    nested_iris_df <- tibble(Species, data)
    str(nested_iris_df, width = 70L)

    data <- map(data, as_tibble)
    nested_iris_tbl <- tibble(Species, data)
    str(nested_iris_tbl, width = 70L)
  })
})

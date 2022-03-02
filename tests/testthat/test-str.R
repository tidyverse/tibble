test_that("output test", {
  expect_snapshot({
    str(as_tibble(mtcars), width = 70L)

    str(as_tibble(trees), width = 70L)

    "No columns"
    str(as_tibble(trees[integer()]), width = 70L)

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

    trees2 <- as_unknown_rows(trees)
    str(trees2, width = 70L)

    Volume <- unique(trees$Volume)
    data <- unname(split(trees, trees$Volume))
    nested_trees_df <- tibble(Volume, data)
    str(nested_trees_df, width = 70L)

    data <- map(data, as_tibble)
    nested_trees_tbl <- tibble(Volume, data)
    str(nested_trees_tbl, width = 70L)
  })
})

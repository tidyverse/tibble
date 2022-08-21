# output test

    Code
      mtcars2 <- as_tibble(mtcars, rownames = NA)
      print_without_body(mtcars2, n = 8L, width = 30L)
    Output
      # A tibble: 32 x 11
      <body created by pillar>
      # ... with 24 more rows, and
      #   7 more variables:
      #   drat <dbl>, wt <dbl>,
      #   qsec <dbl>, vs <dbl>,
      #   am <dbl>, gear <dbl>,
      #   carb <dbl>
    Code
      print_without_body(as_tibble(trees), n = 5L, width = 30L)
    Output
      # A tibble: 31 x 3
      <body created by pillar>
      # ... with 26 more rows
    Code
      print_without_body(as_tibble(trees), n = -1L, width = 30L)
    Output
      # A tibble: 31 x 3
      <body created by pillar>
      # ... with 21 more rows
    Code
      print_without_body(as_tibble(trees), n = Inf, width = 15L)
    Output
      # A tibble: 31
      #   x 3
      <body created by pillar>
      # ... with 1
      #   more
      #   variable:
      #   Volume <dbl>
    Code
      print_without_body(as_tibble(trees), n = NULL, width = 70L)
    Output
      # A tibble: 31 x 3
      <body created by pillar>
      # ... with 21 more rows
    Code
      print_without_body(as_unknown_rows(trees), n = 10, width = 70L)
    Output
      # A tibble: ?? x 3
      <body created by pillar>
      # ... with more rows
    Code
      print_without_body(as_unknown_rows(trees[1:9, ]), n = 10, width = 70L)
    Output
      # A tibble: ?? x 3
      <body created by pillar>
    Code
      print_without_body(as_unknown_rows(trees[1:10, ]), n = 10, width = 70L)
    Output
      # A tibble: ?? x 3
      <body created by pillar>
    Code
      print_without_body(as_unknown_rows(trees[1:11, ]), n = 10, width = 70L)
    Output
      # A tibble: ?? x 3
      <body created by pillar>
      # ... with more rows
    Code
      print_without_body(df_all, n = NULL, width = 30L)
    Output
      # A tibble: 3 x 9
      <body created by pillar>
      # ... with 5 more variables:
      #   e <fct>, f <date>,
      #   g <dttm>, h <list>,
      #   i <list>
    Code
      print_without_body(df_all, n = NULL, width = 300L)
    Output
      # A tibble: 3 x 9
      <body created by pillar>
    Code
      print_without_body(tibble(a = seq.int(10000)), n = 5L, width = 30L)
    Output
      # A tibble: 10,000 x 1
      <body created by pillar>
      # ... with 9,995 more rows
    Code
      print_without_body(tibble(a = character(), b = logical()), width = 30L)
    Output
      # A tibble: 0 x 2
      <body created by pillar>
      # ... with 2 variables:
      #   a <chr>, b <lgl>
    Code
      print_without_body(as_tibble(trees)[character()], n = 5L, width = 30L)
    Output
      # A tibble: 31 x 0
      <body created by pillar>
    Code
      print_without_body(as_unknown_rows(trees[integer(), ]), n = 5L, width = 30L)
    Output
      # A tibble: ?? x 3
      <body created by pillar>
      # ... with 3 variables:
      #   Girth <dbl>,
      #   Height <dbl>,
      #   Volume <dbl>
    Code
      print_without_body(as_unknown_rows(trees[, character()]), n = 5L, width = 30L)
    Output
      # A tibble: ?? x 0
      <body created by pillar>
      # ... with at least 5 rows
      #   total
    Code
      print_without_body(as_unknown_rows(tibble(a = seq.int(10000))), n = 5L, width = 30L)
    Output
      # A tibble: ?? x 1
      <body created by pillar>
      # ... with more rows
    Code
      print_with_mocked_format_body(trunc_mat(df_all, n = 1L, n_extra = 2L, width = 30L))
    Output
      # A tibble: 3 x 9
      <body created by pillar>
      # ... with 2 more rows, and 5
      #   more variables: e <fct>,
      #   f <date>, ...
    Code
      print_with_mocked_format_body(trunc_mat(df_all, n = 1L, n_extra = 0L, width = 30L))
    Output
      # A tibble: 3 x 9
      <body created by pillar>
      # ... with 2 more rows, and 5
      #   more variables
    Code
      df <- tibble(!!!set_names(c(5, 3), c("mean(x)", "var(x)")))
      print_with_mocked_format_body(trunc_mat(df, width = 28))
    Output
      # A tibble: 1 x 2
      <body created by pillar>


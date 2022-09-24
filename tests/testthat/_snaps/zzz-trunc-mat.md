# trunc_mat output matches known output

    Code
      print_without_body(mtcars2, n = 8L, width = 30L)
    Output
      # A tibble: 32 × 11
      <body created by pillar>
      # … with 24 more rows, and 7
      #   more variables:
      #   drat <dbl>, wt <dbl>,
      #   qsec <dbl>, vs <dbl>,
      #   am <dbl>, gear <dbl>,
      #   carb <dbl>
    Code
      print_without_body(as_tibble(iris), n = 5L, width = 30L)
    Output
      # A tibble: 150 × 5
      <body created by pillar>
      # … with 145 more rows, 2
      #   more variables:
      #   Petal.Width <dbl>,
      #   Species <fct>, and
      #   abbreviated variable
      #   names ¹​Sepal.Width,
      #   ²​Petal.Length
    Code
      print_without_body(as_tibble(iris), n = -1L, width = 30L)
    Output
      # A tibble: 150 × 5
      <body created by pillar>
      # … with 140 more rows, 2
      #   more variables:
      #   Petal.Width <dbl>,
      #   Species <fct>, and
      #   abbreviated variable
      #   names ¹​Sepal.Length,
      #   ²​Sepal.Width, …
    Code
      print_without_body(as_tibble(iris), n = Inf, width = 30L)
    Output
      # A tibble: 150 × 5
      <body created by pillar>
      # … with 2 more variables:
      #   Petal.Width <dbl>,
      #   Species <fct>, and
      #   abbreviated variable
      #   names ¹​Sepal.Length,
      #   ²​Sepal.Width,
      #   ³​Petal.Length
    Code
      print_without_body(as_tibble(iris), n = NULL, width = 70L)
    Output
      # A tibble: 150 × 5
      <body created by pillar>
      # … with 140 more rows
    Code
      print_without_body(as_unknown_rows(iris), n = 10, width = 70L)
    Output
      # A tibble: ?? × 5
      <body created by pillar>
      # … with more rows
    Code
      print_without_body(as_unknown_rows(iris[1:9, ]), n = 10, width = 70L)
    Output
      # A tibble: ?? × 5
      <body created by pillar>
    Code
      print_without_body(as_unknown_rows(iris[1:10, ]), n = 10, width = 70L)
    Output
      # A tibble: ?? × 5
      <body created by pillar>
    Code
      print_without_body(as_unknown_rows(iris[1:11, ]), n = 10, width = 70L)
    Output
      # A tibble: ?? × 5
      <body created by pillar>
      # … with more rows
    Code
      print_without_body(df_all, n = NULL, width = 30L)
    Output
      # A tibble: 3 × 9
      <body created by pillar>
      # … with 5 more variables:
      #   e <fct>, f <date>,
      #   g <dttm>, h <list>,
      #   i <list>
    Code
      print_without_body(df_all, n = NULL, width = 300L)
    Output
      # A tibble: 3 × 9
      <body created by pillar>
    Code
      print_without_body(tibble(a = seq.int(10000)), n = 5L, width = 30L)
    Output
      # A tibble: 10,000 × 1
      <body created by pillar>
      # … with 9,995 more rows
    Code
      print_without_body(tibble(a = character(), b = logical()), width = 30L)
    Output
      # A tibble: 0 × 2
      <body created by pillar>
      # … with 2 variables:
      #   a <chr>, b <lgl>
    Code
      print_without_body(as_tibble(iris)[character()], n = 5L, width = 30L)
    Output
      # A tibble: 150 × 0
      <body created by pillar>
    Code
      print_without_body(as_unknown_rows(iris[integer(), ]), n = 5L, width = 30L)
    Output
      # A tibble: ?? × 5
      <body created by pillar>
      # … with 5 variables:
      #   Sepal.Length <dbl>,
      #   Sepal.Width <dbl>,
      #   Petal.Length <dbl>,
      #   Petal.Width <dbl>,
      #   Species <fct>
    Code
      print_without_body(as_unknown_rows(iris[, character()]), n = 5L, width = 30L)
    Output
      # A tibble: ?? × 0
      <body created by pillar>
      # … with at least 5 rows
      #   total
    Code
      print_without_body(as_unknown_rows(tibble(a = seq.int(10000))), n = 5L, width = 30L)
    Output
      # A tibble: ?? × 1
      <body created by pillar>
      # … with more rows
    Code
      print_with_mocked_format_body(trunc_mat(df_all, n = 1L, n_extra = 2L, width = 30L))
    Output
      # A tibble: 3 × 9
      <body created by pillar>
      # … with 2 more rows, and 5
      #   more variables: e <fct>,
      #   f <date>, …
    Code
      print_with_mocked_format_body(trunc_mat(df_all, n = 1L, n_extra = 0L, width = 30L))
    Output
      # A tibble: 3 × 9
      <body created by pillar>
      # … with 2 more rows, and 5
      #   more variables
    Code
      print_with_mocked_format_body(trunc_mat(tibble(`mean(x)` = 5, `var(x)` = 3),
      width = 28))
    Output
      # A tibble: 1 × 2
      <body created by pillar>

# trunc_mat for POSIXlt columns (#86)

    Code
      print(df, n = 8L, width = 60L)
    Output
      # A tibble: 12 × 2
        x                   y                  
        <dttm>              <dttm>             
      1 2016-01-01 12:34:57 2016-01-01 12:34:57
      2 2016-01-01 12:34:58 2016-01-01 12:34:58
      3 2016-01-01 12:34:59 2016-01-01 12:34:59
      4 2016-01-01 12:35:00 2016-01-01 12:35:00
      5 2016-01-01 12:35:01 2016-01-01 12:35:01
      6 2016-01-01 12:35:02 2016-01-01 12:35:02
      7 2016-01-01 12:35:03 2016-01-01 12:35:03
      8 2016-01-01 12:35:04 2016-01-01 12:35:04
      # … with 4 more rows

# trunc_mat for wide-character columns (#100)

    Code
      print(df, n = 8L, width = 60L)
    Output
      # A tibble: 3 × 2
        成交日期 合同录入日期
           <int>        <int>
      1        1            4
      2        2            5
      3        3            6

# trunc_mat for wide-character columns in non-UTF-8 locale

    Code
      print(df, n = 8L, width = 60L)
    Output
      # A tibble: 3 × 2
        成交日期 合同录入日期
           <int>        <int>
      1        1            4
      2        2            5
      3        3            6


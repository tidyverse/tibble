# output test

    Code
      mtcars2 <- as_tibble(mtcars, rownames = NA)
      print_without_body(mtcars2, n = 8L, width = 30L)
    Output
      # A tibble: 32 x 11
      <body created by pillar>
      # i 24 more rows
      # i 7 more variables:
      #   drat <dbl>, wt <dbl>,
      #   qsec <dbl>, vs <dbl>,
      #   am <dbl>, gear <dbl>,
      #   carb <dbl>
    Code
      print_without_body(as_tibble(trees), n = 5L, width = 30L)
    Output
      # A tibble: 31 x 3
      <body created by pillar>
      # i 26 more rows
    Code
      print_without_body(as_tibble(trees), n = -1L, width = 30L)
    Output
      # A tibble: 31 x 3
      <body created by pillar>
      # i 21 more rows
    Code
      print_without_body(as_tibble(trees), n = Inf, width = 15L)
    Output
      # A tibble: 31
      #   x 3
      <body created by pillar>
      # i 1 more
      #   variable:
      #   Volume <dbl>
    Code
      print_without_body(as_tibble(trees), n = NULL, width = 70L)
    Output
      # A tibble: 31 x 3
      <body created by pillar>
      # i 21 more rows
    Code
      print_without_body(as_unknown_rows(trees), n = 10, width = 70L)
    Output
      # A tibble: ?? x 3
      <body created by pillar>
      # i more rows
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
      # i more rows
    Code
      print_without_body(df_all, n = NULL, width = 30L)
    Output
      # A tibble: 3 x 9
      <body created by pillar>
      # i 5 more variables:
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
      # i 9,995 more rows
    Code
      print_without_body(tibble(a = character(), b = logical()), width = 30L)
    Output
      # A tibble: 0 x 2
      <body created by pillar>
      # i 2 variables: a <chr>,
      #   b <lgl>
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
      # i 3 variables: Girth <dbl>,
      #   Height <dbl>,
      #   Volume <dbl>
    Code
      print_without_body(as_unknown_rows(trees[, character()]), n = 5L, width = 30L)
    Output
      # A tibble: ?? x 0
      <body created by pillar>
      # i at least 5 rows total
    Code
      print_without_body(as_unknown_rows(tibble(a = seq.int(10000))), n = 5L, width = 30L)
    Output
      # A tibble: ?? x 1
      <body created by pillar>
      # i more rows

# full output test

    Code
      df <- tibble(x = as.POSIXct("2016-01-01 12:34:56 GMT") + 1:12)
      df$y <- as.POSIXlt(df$x)
      print(df, n = 8L, width = 60L)
    Output
      # A tibble: 12 x 2
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
      # i 4 more rows
    Code
      x <- c("成交日期", "合同录入日期")
      df <- setNames(tibble(1:3, 4:6), x)
      print(df, n = 8L, width = 60L)
    Output
      # A tibble: 3 x 2
        成交日期 合同录入日期
           <int>        <int>
      1        1            4
      2        2            5
      3        3            6


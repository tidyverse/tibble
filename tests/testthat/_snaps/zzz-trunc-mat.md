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


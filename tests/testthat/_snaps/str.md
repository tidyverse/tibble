# output test

    Code
      str(as_tibble(mtcars), width = 70L)
    Output
      tibble [32 x 11] (S3: tbl_df/tbl/data.frame)
       $ mpg : num [1:32] 21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
       $ cyl : num [1:32] 6 6 4 6 8 6 8 4 4 6 ...
       $ disp: num [1:32] 160 160 108 258 360 ...
       $ hp  : num [1:32] 110 110 93 110 175 105 245 62 95 123 ...
       $ drat: num [1:32] 3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...
       $ wt  : num [1:32] 2.62 2.88 2.32 3.21 3.44 ...
       $ qsec: num [1:32] 16.5 17 18.6 19.4 17 ...
       $ vs  : num [1:32] 0 0 1 1 0 1 0 1 1 1 ...
       $ am  : num [1:32] 1 1 1 0 0 0 0 0 0 0 ...
       $ gear: num [1:32] 4 4 4 3 3 3 3 4 4 4 ...
       $ carb: num [1:32] 4 4 1 1 2 1 4 2 2 4 ...
    Code
      str(as_tibble(trees), width = 70L)
    Output
      tibble [31 x 3] (S3: tbl_df/tbl/data.frame)
       $ Girth : num [1:31] 8.3 8.6 8.8 10.5 10.7 10.8 11 11 11.1 11.2 ...
       $ Height: num [1:31] 70 65 63 72 81 83 66 75 80 75 ...
       $ Volume: num [1:31] 10.3 10.3 10.2 16.4 18.8 19.7 15.6 18.2 22.6 19.9 ...
    Code
      # No columns
      str(as_tibble(trees[integer()]), width = 70L)
    Output
      tibble [31 x 0] (S3: tbl_df/tbl/data.frame)
       Named list()
    Code
      # Non-syntactic names
      df <- tibble(!!!set_names(c(5, 3), c("mean(x)", "var(x)")))
      str(df, width = 28)
    Output
      tibble [1 x 2] (S3: tbl_df/tbl/data.frame)
       $ mean(x): num 5
       $ var(x) : num 3
    Code
      str(as_tibble(df_all), width = 70L)
    Output
      tibble [3 x 9] (S3: tbl_df/tbl/data.frame)
       $ a: num [1:3] 1 2.5 NA
       $ b: int [1:3] 1 2 NA
       $ c: logi [1:3] TRUE FALSE NA
       $ d: chr [1:3] "a" "b" NA
       $ e: Factor w/ 2 levels "a","b": 1 2 NA
       $ f: Date[1:3], format: "2015-12-10" ...
       $ g: POSIXct[1:3], format: "2015-12-09 10:51:35" ...
       $ h:List of 3
        ..$ : int 1
        ..$ : int 2
        ..$ : int NA
       $ i:List of 3
        ..$ :List of 2
        .. ..$ : num 1
        .. ..$ : int [1:2] 2 3
        ..$ :List of 1
        .. ..$ : int [1:3] 4 5 6
        ..$ :List of 1
        .. ..$ : logi NA
    Code
      # options(tibble.width = 50)
      withr::with_options(list(tibble.width = 50), str(as_tibble(df_all)))
    Output
      tibble [3 x 9] (S3: tbl_df/tbl/data.frame)
       $ a: num [1:3] 1 2.5 NA
       $ b: int [1:3] 1 2 NA
       $ c: logi [1:3] TRUE FALSE NA
       $ d: chr [1:3] "a" "b" NA
       $ e: Factor w/ 2 levels "a","b": 1 2 NA
       $ f: Date[1:3], format: "2015-12-10" "2015-12-11" ...
       $ g: POSIXct[1:3], format: "2015-12-09 10:51:35" "2015-12-09 10:51:36" ...
       $ h:List of 3
        ..$ : int 1
        ..$ : int 2
        ..$ : int NA
       $ i:List of 3
        ..$ :List of 2
        .. ..$ : num 1
        .. ..$ : int [1:2] 2 3
        ..$ :List of 1
        .. ..$ : int [1:3] 4 5 6
        ..$ :List of 1
        .. ..$ : logi NA
    Code
      # options(tibble.width = 35)
      withr::with_options(list(tibble.width = 35), str(as_tibble(df_all)))
    Output
      tibble [3 x 9] (S3: tbl_df/tbl/data.frame)
       $ a: num [1:3] 1 2.5 NA
       $ b: int [1:3] 1 2 NA
       $ c: logi [1:3] TRUE FALSE NA
       $ d: chr [1:3] "a" "b" NA
       $ e: Factor w/ 2 levels "a","b": 1 2 NA
       $ f: Date[1:3], format: "2015-12-10" "2015-12-11" ...
       $ g: POSIXct[1:3], format: "2015-12-09 10:51:35" "2015-12-09 10:51:36" ...
       $ h:List of 3
        ..$ : int 1
        ..$ : int 2
        ..$ : int NA
       $ i:List of 3
        ..$ :List of 2
        .. ..$ : num 1
        .. ..$ : int [1:2] 2 3
        ..$ :List of 1
        .. ..$ : int [1:3] 4 5 6
        ..$ :List of 1
        .. ..$ : logi NA
    Code
      # non-tibble
      str(5)
    Output
       num 5
    Code
      trees2 <- as_unknown_rows(trees)
      str(trees2, width = 70L)
    Output
      unknown_rows [?? x 3] (S3: unknown_rows/tbl_df/tbl/data.frame)
       $ Girth : num [1:31] 8.3 8.6 8.8 10.5 10.7 10.8 11 11 11.1 11.2 ...
       $ Height: num [1:31] 70 65 63 72 81 83 66 75 80 75 ...
       $ Volume: num [1:31] 10.3 10.3 10.2 16.4 18.8 19.7 15.6 18.2 22.6 19.9 ...
    Code
      Volume <- unique(trees$Volume)
      data <- unname(split(trees, trees$Volume))
      nested_trees_df <- tibble(Volume, data)
      str(nested_trees_df, width = 70L)
    Output
      tibble [30 x 2] (S3: tbl_df/tbl/data.frame)
       $ Volume: num [1:30] 10.3 10.2 16.4 18.8 19.7 15.6 18.2 22.6 19.9 24.2 ...
       $ data  :List of 30
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 8.8
        .. ..$ Height: num 63
        .. ..$ Volume: num 10.2
        ..$ :'data.frame':	2 obs. of  3 variables:
        .. ..$ Girth : num [1:2] 8.3 8.6
        .. ..$ Height: num [1:2] 70 65
        .. ..$ Volume: num [1:2] 10.3 10.3
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 11
        .. ..$ Height: num 66
        .. ..$ Volume: num 15.6
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 10.5
        .. ..$ Height: num 72
        .. ..$ Volume: num 16.4
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 11
        .. ..$ Height: num 75
        .. ..$ Volume: num 18.2
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 10.7
        .. ..$ Height: num 81
        .. ..$ Volume: num 18.8
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 12
        .. ..$ Height: num 75
        .. ..$ Volume: num 19.1
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 10.8
        .. ..$ Height: num 83
        .. ..$ Volume: num 19.7
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 11.2
        .. ..$ Height: num 75
        .. ..$ Volume: num 19.9
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 11.4
        .. ..$ Height: num 76
        .. ..$ Volume: num 21
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 11.7
        .. ..$ Height: num 69
        .. ..$ Volume: num 21.3
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 11.4
        .. ..$ Height: num 76
        .. ..$ Volume: num 21.4
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 12.9
        .. ..$ Height: num 74
        .. ..$ Volume: num 22.2
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 11.1
        .. ..$ Height: num 80
        .. ..$ Volume: num 22.6
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 11.3
        .. ..$ Height: num 79
        .. ..$ Volume: num 24.2
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 13.8
        .. ..$ Height: num 64
        .. ..$ Volume: num 24.9
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 13.7
        .. ..$ Height: num 71
        .. ..$ Volume: num 25.7
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 13.3
        .. ..$ Height: num 86
        .. ..$ Volume: num 27.4
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 14.2
        .. ..$ Height: num 80
        .. ..$ Volume: num 31.7
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 12.9
        .. ..$ Height: num 85
        .. ..$ Volume: num 33.8
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 14
        .. ..$ Height: num 78
        .. ..$ Volume: num 34.5
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 14.5
        .. ..$ Height: num 74
        .. ..$ Volume: num 36.3
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 16
        .. ..$ Height: num 72
        .. ..$ Volume: num 38.3
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 16.3
        .. ..$ Height: num 77
        .. ..$ Volume: num 42.6
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 18
        .. ..$ Height: num 80
        .. ..$ Volume: num 51
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 18
        .. ..$ Height: num 80
        .. ..$ Volume: num 51.5
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 17.3
        .. ..$ Height: num 81
        .. ..$ Volume: num 55.4
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 17.5
        .. ..$ Height: num 82
        .. ..$ Volume: num 55.7
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 17.9
        .. ..$ Height: num 80
        .. ..$ Volume: num 58.3
        ..$ :'data.frame':	1 obs. of  3 variables:
        .. ..$ Girth : num 20.6
        .. ..$ Height: num 87
        .. ..$ Volume: num 77
    Code
      data <- map(data, as_tibble)
      nested_trees_tbl <- tibble(Volume, data)
      str(nested_trees_tbl, width = 70L)
    Output
      tibble [30 x 2] (S3: tbl_df/tbl/data.frame)
       $ Volume: num [1:30] 10.3 10.2 16.4 18.8 19.7 15.6 18.2 22.6 19.9 24.2 ...
       $ data  :List of 30
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 8.8
        .. ..$ Height: num 63
        .. ..$ Volume: num 10.2
        ..$ : tibble [2 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num [1:2] 8.3 8.6
        .. ..$ Height: num [1:2] 70 65
        .. ..$ Volume: num [1:2] 10.3 10.3
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 11
        .. ..$ Height: num 66
        .. ..$ Volume: num 15.6
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 10.5
        .. ..$ Height: num 72
        .. ..$ Volume: num 16.4
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 11
        .. ..$ Height: num 75
        .. ..$ Volume: num 18.2
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 10.7
        .. ..$ Height: num 81
        .. ..$ Volume: num 18.8
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 12
        .. ..$ Height: num 75
        .. ..$ Volume: num 19.1
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 10.8
        .. ..$ Height: num 83
        .. ..$ Volume: num 19.7
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 11.2
        .. ..$ Height: num 75
        .. ..$ Volume: num 19.9
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 11.4
        .. ..$ Height: num 76
        .. ..$ Volume: num 21
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 11.7
        .. ..$ Height: num 69
        .. ..$ Volume: num 21.3
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 11.4
        .. ..$ Height: num 76
        .. ..$ Volume: num 21.4
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 12.9
        .. ..$ Height: num 74
        .. ..$ Volume: num 22.2
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 11.1
        .. ..$ Height: num 80
        .. ..$ Volume: num 22.6
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 11.3
        .. ..$ Height: num 79
        .. ..$ Volume: num 24.2
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 13.8
        .. ..$ Height: num 64
        .. ..$ Volume: num 24.9
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 13.7
        .. ..$ Height: num 71
        .. ..$ Volume: num 25.7
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 13.3
        .. ..$ Height: num 86
        .. ..$ Volume: num 27.4
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 14.2
        .. ..$ Height: num 80
        .. ..$ Volume: num 31.7
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 12.9
        .. ..$ Height: num 85
        .. ..$ Volume: num 33.8
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 14
        .. ..$ Height: num 78
        .. ..$ Volume: num 34.5
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 14.5
        .. ..$ Height: num 74
        .. ..$ Volume: num 36.3
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 16
        .. ..$ Height: num 72
        .. ..$ Volume: num 38.3
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 16.3
        .. ..$ Height: num 77
        .. ..$ Volume: num 42.6
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 18
        .. ..$ Height: num 80
        .. ..$ Volume: num 51
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 18
        .. ..$ Height: num 80
        .. ..$ Volume: num 51.5
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 17.3
        .. ..$ Height: num 81
        .. ..$ Volume: num 55.4
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 17.5
        .. ..$ Height: num 82
        .. ..$ Volume: num 55.7
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 17.9
        .. ..$ Height: num 80
        .. ..$ Volume: num 58.3
        ..$ : tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        .. ..$ Girth : num 20.6
        .. ..$ Height: num 87
        .. ..$ Volume: num 77


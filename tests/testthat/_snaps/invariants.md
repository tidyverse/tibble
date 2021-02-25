# output from invariants vignette

    Code
      with_df(df$n <- rev(df$n), verbose = TRUE)
    Output
      {
        df <- new_df()
        df$n <- rev(df$n)
        df
      }
      # A tibble: 4 x 3
            n c     li       
        <int> <chr> <list>   
      1    NA e     <dbl [1]>
      2     3 f     <int [2]>
      3    NA g     <int [3]>
      4     1 h     <chr [1]>
    Code
      df[[1]]
    Output
      [1]  1 NA  3 NA
    Code
      .subset2(df, 1)
    Output
      [1]  1 NA  3 NA
    Code
      identical(df[[3]], .subset2(df, 3))
    Output
      [1] TRUE
    Code
      identical(df2[["df"]], .subset2(df2, "df"))
    Output
      [1] TRUE
    Code
      vec_size(df[[1]])
    Output
      [1] 4
    Code
      vec_size(df[[3]])
    Output
      [1] 4
    Code
      vec_size(df2[[1]])
    Output
      [1] 4
    Code
      vec_size(df2[[2]])
    Output
      [1] 4
    Code
      df[[1:2]]
    Warning <lifecycle_warning_deprecated>
      The `j` argument of `[[.tbl_df` can't be a vector of length 2 as of tibble 3.0.0.
      Recursive subsetting is deprecated for tibbles.
    Output
      [1] NA
    Code
      df[[c("n", "c")]]
    Error <vctrs_error_subscript_type>
      Must extract column with a single valid subscript.
      x Subscript `c("n", "c")` has size 2 but must be size 1.
    Code
      df[[TRUE]]
    Error <vctrs_error_subscript_type>
      Must extract column with a single valid subscript.
      x Subscript `TRUE` has the wrong type `logical`.
      i It must be numeric or character.
    Code
      df[[mean]]
    Error <vctrs_error_subscript_type>
      Must extract column with a single valid subscript.
      x Subscript `mean` has the wrong type `function`.
      i It must be numeric or character.
    Code
      df[[NA]]
    Error <vctrs_error_subscript_type>
      Must extract column with a single valid subscript.
      x Subscript `NA` can't be `NA`.
    Code
      df[[NA_character_]]
    Error <vctrs_error_subscript_type>
      Must extract column with a single valid subscript.
      x Subscript `NA_character_` can't be `NA`.
    Code
      df[[NA_integer_]]
    Error <vctrs_error_subscript_type>
      Must extract column with a single valid subscript.
      x Subscript `NA_integer_` can't be `NA`.
    Code
      df[[-1]]
    Error <vctrs_error_subscript_type>
      Must extract column with a single valid subscript.
      x Subscript `-1` has value -1 but must be a positive location.
    Code
      df[[4]]
    Error <vctrs_error_subscript_oob>
      Can't subset columns that don't exist.
      x Location 4 doesn't exist.
      i There are only 3 columns.
    Code
      df[[1.5]]
    Error <vctrs_error_subscript_type>
      Must extract column with a single valid subscript.
      x Can't convert from <double> to <integer> due to loss of precision.
    Code
      df[[Inf]]
    Error <vctrs_error_subscript_type>
      Must extract column with a single valid subscript.
      x Can't convert from <double> to <integer> due to loss of precision.
    Code
      df[["x"]]
    Output
      NULL
    Code
      df$n
    Output
      [1]  1 NA  3 NA
    Code
      df$"n"
    Output
      [1]  1 NA  3 NA
    Code
      df[["n"]]
    Output
      [1]  1 NA  3 NA
    Code
      identical(df$li, df[["li"]])
    Output
      [1] TRUE
    Code
      identical(df2$tb, df2[["tb"]])
    Output
      [1] TRUE
    Code
      identical(df2$m, df2[["m"]])
    Output
      [1] TRUE
    Code
      df$l
    Warning <warning>
      Unknown or uninitialised column: `l`.
    Output
      NULL
    Code
      df$not_present
    Warning <warning>
      Unknown or uninitialised column: `not_present`.
    Output
      NULL
    Code
      df[1:2]
    Output
      # A tibble: 4 x 2
            n c    
        <int> <chr>
      1     1 e    
      2    NA f    
      3     3 g    
      4    NA h    
    Code
      df[c(1, 1)]
    Output
      # A tibble: 4 x 2
            n     n
        <int> <int>
      1     1     1
      2    NA    NA
      3     3     3
      4    NA    NA
    Code
      df[integer()]
    Output
      # A tibble: 4 x 0
    Code
      df[is.na(df)]
    Output
      [1] NA NA
    Code
      df[!is.na(df)]
    Error <vctrs_error_incompatible_type>
      Can't combine `n` <integer> and `c` <character>.
    Code
      df[, 1]
    Output
      # A tibble: 4 x 1
            n
        <int>
      1     1
      2    NA
      3     3
      4    NA
    Code
      df[, 1:2]
    Output
      # A tibble: 4 x 2
            n c    
        <int> <chr>
      1     1 e    
      2    NA f    
      3     3 g    
      4    NA h    
    Code
      identical(df[, 2:3], df[2:3])
    Output
      [1] TRUE
    Code
      identical(df2[, 1:2], df2[1:2])
    Output
      [1] TRUE
    Code
      df[, 1, drop = TRUE]
    Output
      [1]  1 NA  3 NA
    Code
      identical(df[, 3, drop = TRUE], df[[3]])
    Output
      [1] TRUE
    Code
      identical(df2[, 1, drop = TRUE], df2[[1]])
    Output
      [1] TRUE
    Code
      identical(df2[, 2, drop = TRUE], df2[[2]])
    Output
      [1] TRUE
    Code
      df[3, ]
    Output
      # A tibble: 1 x 3
            n c     li       
        <int> <chr> <list>   
      1     3 g     <int [3]>
    Code
      df[mean, ]
    Error <vctrs_error_subscript_type>
      Must subset rows with a valid subscript vector.
      x Subscript `mean` has the wrong type `function`.
      i It must be logical, numeric, or character.
    Code
      df[list(1), ]
    Error <vctrs_error_subscript_type>
      Must subset rows with a valid subscript vector.
      x Subscript `list(1)` has the wrong type `list`.
      i It must be logical, numeric, or character.
    Code
      df["1", ]
    Output
      # A tibble: 1 x 3
            n c     li       
        <int> <chr> <list>   
      1     1 e     <dbl [1]>
    Code
      df[10, ]
    Warning <lifecycle_warning_deprecated>
      The `i` argument of `[.tbl_df` must lie in [0, rows] if positive, as of tibble 3.0.0.
      Use `NA_integer_` as row index to obtain a row full of `NA` values.
    Output
      # A tibble: 1 x 3
            n c     li    
        <int> <chr> <list>
      1    NA <NA>  <NULL>
    Code
      df["x", ]
    Warning <lifecycle_warning_deprecated>
      The `i` argument of `[.tbl_df` must use valid row names as of tibble 3.0.0.
      Use `NA_integer_` as row index to obtain a row full of `NA` values.
    Output
      # A tibble: 1 x 3
            n c     li    
        <int> <chr> <list>
      1    NA <NA>  <NULL>
    Code
      df[c(TRUE, FALSE), ]
    Error <vctrs_error_subscript_size>
      Must subset rows with a valid subscript vector.
      i Logical subscripts must match the size of the indexed input.
      x Input has size 4 but subscript `c(TRUE, FALSE)` has size 2.
    Code
      df[NA, ]
    Output
      # A tibble: 4 x 3
            n c     li    
        <int> <chr> <list>
      1    NA <NA>  <NULL>
      2    NA <NA>  <NULL>
      3    NA <NA>  <NULL>
      4    NA <NA>  <NULL>
    Code
      df[NA_integer_, ]
    Output
      # A tibble: 1 x 3
            n c     li    
        <int> <chr> <list>
      1    NA <NA>  <NULL>
    Code
      df[1, , drop = TRUE]
    Output
      # A tibble: 1 x 3
            n c     li       
        <int> <chr> <list>   
      1     1 e     <dbl [1]>
    Code
      df[1, 1]
    Output
      # A tibble: 1 x 1
            n
        <int>
      1     1
    Code
      df[1, ][1]
    Output
      # A tibble: 1 x 1
            n
        <int>
      1     1
    Code
      identical(df[1, 2:3], df[2:3][1, ])
    Output
      [1] TRUE
    Code
      identical(df[2:3, 1], df[1][2:3, ])
    Output
      [1] TRUE
    Code
      identical(df2[2:3, 1:2], df2[1:2][2:3, ])
    Output
      [1] TRUE
    Code
      df[[1, 1]]
    Output
      [1] 1
    Code
      df[[1, 3]]
    Output
      [[1]]
      [1] 9
      
    Code
      with_df(df[[1]] <- 0)
    Output
      # A tibble: 4 x 3
            n c     li       
        <dbl> <chr> <list>   
      1     0 e     <dbl [1]>
      2     0 f     <int [2]>
      3     0 g     <int [3]>
      4     0 h     <chr [1]>
    Code
      with_df(df[[3]] <- 4:1)
    Output
      # A tibble: 4 x 3
            n c        li
        <int> <chr> <int>
      1     1 e         4
      2    NA f         3
      3     3 g         2
      4    NA h         1
    Code
      with_df2(df2[[1]] <- 0)
    Output
      # A tibble: 4 x 2
           tb m[,1]  [,2]  [,3]  [,4]
        <dbl> <dbl> <dbl> <dbl> <dbl>
      1     0     1     0     0     0
      2     0     0     1     0     0
      3     0     0     0     1     0
      4     0     0     0     0     1
    Code
      with_df2(df2[[2]] <- 4:1)
    Output
      # A tibble: 4 x 2
         tb$n $c    $li           m
        <int> <chr> <list>    <int>
      1     1 e     <dbl [1]>     4
      2    NA f     <int [2]>     3
      3     3 g     <int [3]>     2
      4    NA h     <chr [1]>     1
    Code
      with_df(df[[1]] <- 0)
    Output
      # A tibble: 4 x 3
            n c     li       
        <dbl> <chr> <list>   
      1     0 e     <dbl [1]>
      2     0 f     <int [2]>
      3     0 g     <int [3]>
      4     0 h     <chr [1]>
    Code
      with_df(df[["c"]] <- 0)
    Output
      # A tibble: 4 x 3
            n     c li       
        <int> <dbl> <list>   
      1     1     0 <dbl [1]>
      2    NA     0 <int [2]>
      3     3     0 <int [3]>
      4    NA     0 <chr [1]>
    Code
      with_df(df[[TRUE]] <- 0)
    Error <vctrs_error_subscript_type>
      Must assign to column with a single valid subscript.
      x Subscript `TRUE` has the wrong type `logical`.
      i It must be numeric or character.
    Code
      with_df(df[[1:3]] <- 0)
    Error <vctrs_error_subscript_type>
      Must assign to column with a single valid subscript.
      x Subscript `1:3` has size 3 but must be size 1.
    Code
      with_df(df[[c("n", "c")]] <- 0)
    Error <vctrs_error_subscript_type>
      Must assign to column with a single valid subscript.
      x Subscript `c("n", "c")` has size 2 but must be size 1.
    Code
      with_df(df[[FALSE]] <- 0)
    Error <vctrs_error_subscript_type>
      Must assign to column with a single valid subscript.
      x Subscript `FALSE` has the wrong type `logical`.
      i It must be numeric or character.
    Code
      with_df(df[[1:2]] <- 0)
    Error <vctrs_error_subscript_type>
      Must assign to column with a single valid subscript.
      x Subscript `1:2` has size 2 but must be size 1.
    Code
      with_df(df[[NA_integer_]] <- 0)
    Error <simpleError>
      missing value where TRUE/FALSE needed
    Code
      with_df(df[[NA]] <- 0)
    Error <vctrs_error_subscript_type>
      Must assign to column with a single valid subscript.
      x Subscript `NA` can't be `NA`.
    Code
      with_df(df[[NA_character_]] <- 0)
    Error <tibble_error_assign_columns_non_na_only>
      Can't use NA as column index in a tibble for assignment.
    Code
      with_df(df[["li"]] <- list(0))
    Output
      # A tibble: 4 x 3
            n c     li       
        <int> <chr> <list>   
      1     1 e     <dbl [1]>
      2    NA f     <dbl [1]>
      3     3 g     <dbl [1]>
      4    NA h     <dbl [1]>
    Code
      with_df2(df2[["tb"]] <- df[1, ])
    Output
      # A tibble: 4 x 2
         tb$n $c    $li       m[,1]  [,2]  [,3]  [,4]
        <int> <chr> <list>    <dbl> <dbl> <dbl> <dbl>
      1     1 e     <dbl [1]>     1     0     0     0
      2     1 e     <dbl [1]>     0     1     0     0
      3     1 e     <dbl [1]>     0     0     1     0
      4     1 e     <dbl [1]>     0     0     0     1
    Code
      with_df2(df2[["m"]] <- df2[["m"]][1, , drop = FALSE])
    Output
      # A tibble: 4 x 2
         tb$n $c    $li       m[,1]  [,2]  [,3]  [,4]
        <int> <chr> <list>    <dbl> <dbl> <dbl> <dbl>
      1     1 e     <dbl [1]>     1     0     0     0
      2    NA f     <int [2]>     1     0     0     0
      3     3 g     <int [3]>     1     0     0     0
      4    NA h     <chr [1]>     1     0     0     0
    Code
      with_df(df[[1]] <- 1)
    Output
      # A tibble: 4 x 3
            n c     li       
        <dbl> <chr> <list>   
      1     1 e     <dbl [1]>
      2     1 f     <int [2]>
      3     1 g     <int [3]>
      4     1 h     <chr [1]>
    Code
      with_df(df[[1]] <- 4:1)
    Output
      # A tibble: 4 x 3
            n c     li       
        <int> <chr> <list>   
      1     4 e     <dbl [1]>
      2     3 f     <int [2]>
      3     2 g     <int [3]>
      4     1 h     <chr [1]>
    Code
      with_df(df[[1]] <- 3:1)
    Error <tibble_error_assign_incompatible_size>
      Assigned data `3:1` must be compatible with existing data.
      x Existing data has 4 rows.
      x Assigned data has 3 rows.
      i Only vectors of size 1 are recycled.
    Code
      with_df(df[[1]] <- 2:1)
    Error <tibble_error_assign_incompatible_size>
      Assigned data `2:1` must be compatible with existing data.
      x Existing data has 4 rows.
      x Assigned data has 2 rows.
      i Only vectors of size 1 are recycled.
    Code
      with_df(df[["x"]] <- 0)
    Output
      # A tibble: 4 x 4
            n c     li            x
        <int> <chr> <list>    <dbl>
      1     1 e     <dbl [1]>     0
      2    NA f     <int [2]>     0
      3     3 g     <int [3]>     0
      4    NA h     <chr [1]>     0
    Code
      with_df(df[[4]] <- 0)
    Output
      # A tibble: 4 x 4
            n c     li         ...4
        <int> <chr> <list>    <dbl>
      1     1 e     <dbl [1]>     0
      2    NA f     <int [2]>     0
      3     3 g     <int [3]>     0
      4    NA h     <chr [1]>     0
    Code
      with_df(df[[5]] <- 0)
    Error <vctrs_error_subscript_oob>
      Can't assign to columns beyond the end with non-consecutive locations.
      i Input has size 3.
      x Subscript `5` contains non-consecutive location 5.
    Code
      with_df(df[[1]] <- df[[2]])
    Output
      # A tibble: 4 x 3
        n     c     li       
        <chr> <chr> <list>   
      1 e     e     <dbl [1]>
      2 f     f     <int [2]>
      3 g     g     <int [3]>
      4 h     h     <chr [1]>
    Code
      with_df(df[[2]] <- df[[3]])
    Output
      # A tibble: 4 x 3
            n c         li       
        <int> <list>    <list>   
      1     1 <dbl [1]> <dbl [1]>
      2    NA <int [2]> <int [2]>
      3     3 <int [3]> <int [3]>
      4    NA <chr [1]> <chr [1]>
    Code
      with_df(df[[3]] <- df2[[1]])
    Output
      # A tibble: 4 x 3
            n c      li$n $c    $li      
        <int> <chr> <int> <chr> <list>   
      1     1 e         1 e     <dbl [1]>
      2    NA f        NA f     <int [2]>
      3     3 g         3 g     <int [3]>
      4    NA h        NA h     <chr [1]>
    Code
      with_df2(df2[[1]] <- df2[[2]])
    Output
      # A tibble: 4 x 2
        tb[,1]  [,2]  [,3]  [,4] m[,1]  [,2]  [,3]  [,4]
         <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
      1      1     0     0     0     1     0     0     0
      2      0     1     0     0     0     1     0     0
      3      0     0     1     0     0     0     1     0
      4      0     0     0     1     0     0     0     1
    Code
      with_df2(df2[[2]] <- df[[1]])
    Output
      # A tibble: 4 x 2
         tb$n $c    $li           m
        <int> <chr> <list>    <int>
      1     1 e     <dbl [1]>     1
      2    NA f     <int [2]>    NA
      3     3 g     <int [3]>     3
      4    NA h     <chr [1]>    NA
    Code
      with_df(df[[1]] <- NULL)
    Output
      # A tibble: 4 x 2
        c     li       
        <chr> <list>   
      1 e     <dbl [1]>
      2 f     <int [2]>
      3 g     <int [3]>
      4 h     <chr [1]>
    Code
      with_df2(df2[[2]] <- NULL)
    Output
      # A tibble: 4 x 1
         tb$n $c    $li      
        <int> <chr> <list>   
      1     1 e     <dbl [1]>
      2    NA f     <int [2]>
      3     3 g     <int [3]>
      4    NA h     <chr [1]>
    Code
      with_df(df[["q"]] <- NULL)
    Output
      # A tibble: 4 x 3
            n c     li       
        <int> <chr> <list>   
      1     1 e     <dbl [1]>
      2    NA f     <int [2]>
      3     3 g     <int [3]>
      4    NA h     <chr [1]>
    Code
      with_df(df$n <- 0)
    Output
      # A tibble: 4 x 3
            n c     li       
        <dbl> <chr> <list>   
      1     0 e     <dbl [1]>
      2     0 f     <int [2]>
      3     0 g     <int [3]>
      4     0 h     <chr [1]>
    Code
      with_df(df[["n"]] <- 0)
    Output
      # A tibble: 4 x 3
            n c     li       
        <dbl> <chr> <list>   
      1     0 e     <dbl [1]>
      2     0 f     <int [2]>
      3     0 g     <int [3]>
      4     0 h     <chr [1]>
    Code
      with_df(df$"n" <- 0)
    Output
      # A tibble: 4 x 3
            n c     li       
        <dbl> <chr> <list>   
      1     0 e     <dbl [1]>
      2     0 f     <int [2]>
      3     0 g     <int [3]>
      4     0 h     <chr [1]>
    Code
      with_df(df$l <- 0)
    Output
      # A tibble: 4 x 4
            n c     li            l
        <int> <chr> <list>    <dbl>
      1     1 e     <dbl [1]>     0
      2    NA f     <int [2]>     0
      3     3 g     <int [3]>     0
      4    NA h     <chr [1]>     0
    Code
      with_df(df[["l"]] <- 0)
    Output
      # A tibble: 4 x 4
            n c     li            l
        <int> <chr> <list>    <dbl>
      1     1 e     <dbl [1]>     0
      2    NA f     <int [2]>     0
      3     3 g     <int [3]>     0
      4    NA h     <chr [1]>     0
    Code
      with_df(df[1:2] <- list("x", 4:1))
    Output
      # A tibble: 4 x 3
        n         c li       
        <chr> <int> <list>   
      1 x         4 <dbl [1]>
      2 x         3 <int [2]>
      3 x         2 <int [3]>
      4 x         1 <chr [1]>
    Code
      with_df(df[c("li", "x", "c")] <- list("x", 4:1, NULL))
    Output
      # A tibble: 4 x 3
            n li        x
        <int> <chr> <int>
      1     1 x         4
      2    NA x         3
      3     3 x         2
      4    NA x         1
    Code
      with_df(df[1:2] <- list(1))
    Output
      # A tibble: 4 x 3
            n     c li       
        <dbl> <dbl> <list>   
      1     1     1 <dbl [1]>
      2     1     1 <int [2]>
      3     1     1 <int [3]>
      4     1     1 <chr [1]>
    Code
      with_df(df[1:2] <- list(0, 0, 0))
    Error <vctrs_error_incompatible_size>
      Can't recycle `list(0, 0, 0)` (size 3) to size 2.
    Code
      with_df(df[1:3] <- list(0, 0))
    Error <vctrs_error_incompatible_size>
      Can't recycle `list(0, 0)` (size 2) to size 3.
    Code
      with_df(df[c(1, 1)] <- list(1, 2))
    Error <tibble_error_duplicate_column_subscript_for_assignment>
      Column index 1 is used more than once for assignment.
    Code
      with_df(df[1:2] <- list(NULL, 4:1))
    Output
      # A tibble: 4 x 2
            c li       
        <int> <list>   
      1     4 <dbl [1]>
      2     3 <int [2]>
      3     2 <int [3]>
      4     1 <chr [1]>
    Code
      with_df(df[NA] <- list("x"))
    Error <tibble_error_na_column_index>
      Can't use NA as column index with `[` at positions 1, 2, and 3.
    Code
      with_df(df[NA_integer_] <- list("x"))
    Error <tibble_error_assign_columns_non_na_only>
      Can't use NA as column index in a tibble for assignment.
    Code
      with_df(df[NA_character_] <- list("x"))
    Error <tibble_error_assign_columns_non_na_only>
      Can't use NA as column index in a tibble for assignment.
    Code
      with_df(df[1] <- df[2])
    Output
      # A tibble: 4 x 3
        n     c     li       
        <chr> <chr> <list>   
      1 e     e     <dbl [1]>
      2 f     f     <int [2]>
      3 g     g     <int [3]>
      4 h     h     <chr [1]>
    Code
      with_df(df[2] <- df[3])
    Output
      # A tibble: 4 x 3
            n c         li       
        <int> <list>    <list>   
      1     1 <dbl [1]> <dbl [1]>
      2    NA <int [2]> <int [2]>
      3     3 <int [3]> <int [3]>
      4    NA <chr [1]> <chr [1]>
    Code
      with_df(df[3] <- df2[1])
    Output
      # A tibble: 4 x 3
            n c      li$n $c    $li      
        <int> <chr> <int> <chr> <list>   
      1     1 e         1 e     <dbl [1]>
      2    NA f        NA f     <int [2]>
      3     3 g         3 g     <int [3]>
      4    NA h        NA h     <chr [1]>
    Code
      with_df2(df2[1] <- df2[2])
    Output
      # A tibble: 4 x 2
        tb[,1]  [,2]  [,3]  [,4] m[,1]  [,2]  [,3]  [,4]
         <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
      1      1     0     0     0     1     0     0     0
      2      0     1     0     0     0     1     0     0
      3      0     0     1     0     0     0     1     0
      4      0     0     0     1     0     0     0     1
    Code
      with_df2(df2[2] <- df[1])
    Output
      # A tibble: 4 x 2
         tb$n $c    $li           m
        <int> <chr> <list>    <int>
      1     1 e     <dbl [1]>     1
      2    NA f     <int [2]>    NA
      3     3 g     <int [3]>     3
      4    NA h     <chr [1]>    NA
    Code
      with_df(df[c("x", "y")] <- tibble("x", x = 4:1))
    Output
      # A tibble: 4 x 5
            n c     li        x         y
        <int> <chr> <list>    <chr> <int>
      1     1 e     <dbl [1]> x         4
      2    NA f     <int [2]> x         3
      3     3 g     <int [3]> x         2
      4    NA h     <chr [1]> x         1
    Code
      with_df(df[3:4] <- list("x", x = 4:1))
    Output
      # A tibble: 4 x 4
            n c     li        x
        <int> <chr> <chr> <int>
      1     1 e     x         4
      2    NA f     x         3
      3     3 g     x         2
      4    NA h     x         1
    Code
      with_df(df[4] <- list(4:1))
    Output
      # A tibble: 4 x 4
            n c     li         ...4
        <int> <chr> <list>    <int>
      1     1 e     <dbl [1]>     4
      2    NA f     <int [2]>     3
      3     3 g     <int [3]>     2
      4    NA h     <chr [1]>     1
    Code
      with_df(df[5] <- list(4:1))
    Error <vctrs_error_subscript_oob>
      Can't assign to columns beyond the end with non-consecutive locations.
      i Input has size 3.
      x Subscript `5` contains non-consecutive location 5.
    Code
      with_df(df[is.na(df)] <- 4)
    Output
      # A tibble: 4 x 3
            n c     li       
        <int> <chr> <list>   
      1     1 e     <dbl [1]>
      2     4 f     <int [2]>
      3     3 g     <int [3]>
      4     4 h     <chr [1]>
    Code
      with_df(df[is.na(df)] <- 1:2)
    Error <tibble_error_subset_matrix_must_be_scalar>
      Subscript `is.na(df)` is a matrix, the data `1:2` must have size 1.
    Code
      with_df(df[matrix(c(rep(TRUE, 5), rep(FALSE, 7)), ncol = 3)] <- 4)
    Error <tibble_error_assign_incompatible_type>
      Assigned data `4` must be compatible with existing data.
      i Error occurred for column `c`.
      x Can't convert <double> to <character>.
    Code
      with_df(df[1:2] <- matrix(8:1, ncol = 2))
    Output
      # A tibble: 4 x 3
            n     c li       
        <int> <int> <list>   
      1     8     4 <dbl [1]>
      2     7     3 <int [2]>
      3     6     2 <int [3]>
      4     5     1 <chr [1]>
    Code
      with_df(df[1:3, 1:2] <- matrix(6:1, ncol = 2))
    Error <tibble_error_assign_incompatible_type>
      Assigned data `matrix(6:1, ncol = 2)` must be compatible with existing data.
      i Error occurred for column `c`.
      x Can't convert <integer> to <character>.
    Code
      with_df(df[1:2] <- array(4:1, dim = c(4, 1, 1)))
    Output
      # A tibble: 4 x 3
            n     c li       
        <int> <int> <list>   
      1     4     4 <dbl [1]>
      2     3     3 <int [2]>
      3     2     2 <int [3]>
      4     1     1 <chr [1]>
    Code
      with_df(df[1:2] <- array(8:1, dim = c(4, 2, 1)))
    Output
      # A tibble: 4 x 3
            n     c li       
        <int> <int> <list>   
      1     8     4 <dbl [1]>
      2     7     3 <int [2]>
      3     6     2 <int [3]>
      4     5     1 <chr [1]>
    Code
      with_df(df[1:2] <- array(8:1, dim = c(2, 1, 4)))
    Error <tibble_error_need_rhs_vector_or_null>
      `array(8:1, dim = c(2, 1, 4))` must be a vector, a bare list, a data frame, a matrix, or NULL.
    Code
      with_df(df[1:2] <- array(8:1, dim = c(4, 1, 2)))
    Error <tibble_error_need_rhs_vector_or_null>
      `array(8:1, dim = c(4, 1, 2))` must be a vector, a bare list, a data frame, a matrix, or NULL.
    Code
      with_df(df[1] <- 0)
    Output
      # A tibble: 4 x 3
            n c     li       
        <dbl> <chr> <list>   
      1     0 e     <dbl [1]>
      2     0 f     <int [2]>
      3     0 g     <int [3]>
      4     0 h     <chr [1]>
    Code
      with_df(df[1] <- list(0))
    Output
      # A tibble: 4 x 3
            n c     li       
        <dbl> <chr> <list>   
      1     0 e     <dbl [1]>
      2     0 f     <int [2]>
      3     0 g     <int [3]>
      4     0 h     <chr [1]>
    Code
      with_df(df[1] <- list(matrix(1:8, ncol = 2)))
    Output
      # A tibble: 4 x 3
        n[,1]  [,2] c     li       
        <int> <int> <chr> <list>   
      1     1     5 e     <dbl [1]>
      2     2     6 f     <int [2]>
      3     3     7 g     <int [3]>
      4     4     8 h     <chr [1]>
    Code
      with_df(df[1:2] <- list(matrix(1:8, ncol = 2)))
    Output
      # A tibble: 4 x 3
        n[,1]  [,2] c[,1]  [,2] li       
        <int> <int> <int> <int> <list>   
      1     1     5     1     5 <dbl [1]>
      2     2     6     2     6 <int [2]>
      3     3     7     3     7 <int [3]>
      4     4     8     4     8 <chr [1]>
    Code
      with_df(df[1] <- NULL)
    Output
      # A tibble: 4 x 2
        c     li       
        <chr> <list>   
      1 e     <dbl [1]>
      2 f     <int [2]>
      3 g     <int [3]>
      4 h     <chr [1]>
    Code
      with_df(df[, 2:3] <- NULL)
    Output
      # A tibble: 4 x 1
            n
        <int>
      1     1
      2    NA
      3     3
      4    NA
    Code
      with_df(df[1, 2:3] <- NULL)
    Error <tibble_error_need_rhs_vector>
      `NULL` must be a vector, a bare list, a data frame or a matrix.
    Code
      with_df(df[1] <- mean)
    Error <tibble_error_need_rhs_vector_or_null>
      `mean` must be a vector, a bare list, a data frame, a matrix, or NULL.
    Code
      with_df(df[1] <- lm(mpg ~ wt, data = mtcars))
    Error <tibble_error_need_rhs_vector_or_null>
      `lm(mpg ~ wt, data = mtcars)` must be a vector, a bare list, a data frame, a matrix, or NULL.
    Code
      with_df(df[2:3, ] <- df[1, ])
    Output
      # A tibble: 4 x 3
            n c     li       
        <int> <chr> <list>   
      1     1 e     <dbl [1]>
      2     1 e     <dbl [1]>
      3     1 e     <dbl [1]>
      4    NA h     <chr [1]>
    Code
      with_df(df[c(FALSE, TRUE, TRUE, FALSE), ] <- df[1, ])
    Output
      # A tibble: 4 x 3
            n c     li       
        <int> <chr> <list>   
      1     1 e     <dbl [1]>
      2     1 e     <dbl [1]>
      3     1 e     <dbl [1]>
      4    NA h     <chr [1]>
    Code
      with_df(df[0:2, ] <- df[1, ])
    Error <vctrs_error_subscript_type>
      Must assign to rows with a valid subscript vector.
      x Subscript `0:2` can't contain `0` values.
      i It has a `0` value at location 1.
    Code
      with_df(df[0, ] <- df[1, ])
    Error <vctrs_error_subscript_type>
      Must assign to rows with a valid subscript vector.
      x Subscript `0` can't contain `0` values.
      i It has a `0` value at location 1.
    Code
      with_df(df[-2, ] <- df[1, ])
    Output
      # A tibble: 4 x 3
            n c     li       
        <int> <chr> <list>   
      1     1 e     <dbl [1]>
      2    NA f     <int [2]>
      3     1 e     <dbl [1]>
      4     1 e     <dbl [1]>
    Code
      with_df(df[-1:2, ] <- df[1, ])
    Error <vctrs_error_subscript_type>
      Must assign to rows with a valid subscript vector.
      x Negative and positive locations can't be mixed.
      i Subscript `-1:2` has 2 positive values at locations 3 and 4.
    Code
      with_df(df[NA_integer_, ] <- df[1, ])
    Error <vctrs_error_subscript_type>
      Must assign to rows with a valid subscript vector.
      x Subscript `NA_integer_` can't contain missing values.
      x It has a missing value at location 1.
    Code
      with_df2(df2[NA_integer_, ] <- df2[1, ])
    Error <vctrs_error_subscript_type>
      Must assign to rows with a valid subscript vector.
      x Subscript `NA_integer_` can't contain missing values.
      x It has a missing value at location 1.
    Code
      with_df(df[TRUE, ] <- df[1, ])
    Output
      # A tibble: 4 x 3
            n c     li       
        <int> <chr> <list>   
      1     1 e     <dbl [1]>
      2     1 e     <dbl [1]>
      3     1 e     <dbl [1]>
      4     1 e     <dbl [1]>
    Code
      with_df(df[FALSE, ] <- df[1, ])
    Output
      # A tibble: 4 x 3
            n c     li       
        <int> <chr> <list>   
      1     1 e     <dbl [1]>
      2    NA f     <int [2]>
      3     3 g     <int [3]>
      4    NA h     <chr [1]>
    Code
      with_df(df[NA, ] <- df[1, ])
    Error <tibble_error_assign_rows_non_na_only>
      Can't use NA as row index in a tibble for assignment.
    Code
      with_df(df[2:3, ] <- df[1, ])
    Output
      # A tibble: 4 x 3
            n c     li       
        <int> <chr> <list>   
      1     1 e     <dbl [1]>
      2     1 e     <dbl [1]>
      3     1 e     <dbl [1]>
      4    NA h     <chr [1]>
    Code
      with_df(df[2:3, ] <- list(df$n[1], df$c[1:2], df$li[1]))
    Output
      # A tibble: 4 x 3
            n c     li       
        <int> <chr> <list>   
      1     1 e     <dbl [1]>
      2     1 e     <dbl [1]>
      3     1 f     <dbl [1]>
      4    NA h     <chr [1]>
    Code
      with_df(df[2:4, ] <- df[1:2, ])
    Error <tibble_error_assign_incompatible_size>
      Assigned data `df[1:2, ]` must be compatible with row subscript `2:4`.
      x 3 rows must be assigned.
      x Element 1 of assigned data has 2 rows.
      i Only vectors of size 1 are recycled.
    Code
      with_df2(df2[2:4, ] <- df2[1, ])
    Output
      # A tibble: 4 x 2
         tb$n $c    $li       m[,1]  [,2]  [,3]  [,4]
        <int> <chr> <list>    <dbl> <dbl> <dbl> <dbl>
      1     1 e     <dbl [1]>     1     0     0     0
      2     1 e     <dbl [1]>     1     0     0     0
      3     1 e     <dbl [1]>     1     0     0     0
      4     1 e     <dbl [1]>     1     0     0     0
    Code
      with_df2(df2[2:4, ] <- df2[2:3, ])
    Error <tibble_error_assign_incompatible_size>
      Assigned data `df2[2:3, ]` must be compatible with row subscript `2:4`.
      x 3 rows must be assigned.
      x Element 1 of assigned data has 2 rows.
      i Only vectors of size 1 are recycled.
    Code
      with_df(df[5, ] <- df[1, ])
    Output
      # A tibble: 5 x 3
            n c     li       
        <int> <chr> <list>   
      1     1 e     <dbl [1]>
      2    NA f     <int [2]>
      3     3 g     <int [3]>
      4    NA h     <chr [1]>
      5     1 e     <dbl [1]>
    Code
      with_df(df[5:7, ] <- df[1, ])
    Output
      # A tibble: 7 x 3
            n c     li       
        <int> <chr> <list>   
      1     1 e     <dbl [1]>
      2    NA f     <int [2]>
      3     3 g     <int [3]>
      4    NA h     <chr [1]>
      5     1 e     <dbl [1]>
      6     1 e     <dbl [1]>
      7     1 e     <dbl [1]>
    Code
      with_df(df[6, ] <- df[1, ])
    Error <vctrs_error_subscript_oob>
      Can't assign to rows beyond the end with non-consecutive locations.
      i Input has size 4.
      x Subscript `6` contains non-consecutive location 6.
    Code
      with_df(df[-5, ] <- df[1, ])
    Error <vctrs_error_subscript_oob>
      Can't negate rows that don't exist.
      x Location 5 doesn't exist.
      i There are only 4 rows.
    Code
      with_df(df[-(5:7), ] <- df[1, ])
    Error <vctrs_error_subscript_oob>
      Can't negate rows that don't exist.
      x Locations 5, 6, and 7 don't exist.
      i There are only 4 rows.
    Code
      with_df(df[-6, ] <- df[1, ])
    Error <vctrs_error_subscript_oob>
      Can't negate rows that don't exist.
      x Location 6 doesn't exist.
      i There are only 4 rows.
    Code
      with_df(df[as.character(1:3), ] <- df[1, ])
    Output
      # A tibble: 4 x 3
            n c     li       
        <int> <chr> <list>   
      1     1 e     <dbl [1]>
      2     1 e     <dbl [1]>
      3     1 e     <dbl [1]>
      4    NA h     <chr [1]>
    Code
      with_df(df[as.character(-(1:3)), ] <- df[1, ])
    Warning <lifecycle_warning_deprecated>
      The `i` argument of `[.tbl_df` must use valid row names as of tibble 3.0.0.
      Use `NA_integer_` as row index to obtain a row full of `NA` values.
    Error <tibble_error_assign_rows_non_na_only>
      Can't use NA as row index in a tibble for assignment.
    Code
      with_df(df[as.character(3:5), ] <- df[1, ])
    Warning <lifecycle_warning_deprecated>
      The `i` argument of `[.tbl_df` must use valid row names as of tibble 3.0.0.
      Use `NA_integer_` as row index to obtain a row full of `NA` values.
    Error <tibble_error_assign_rows_non_na_only>
      Can't use NA as row index in a tibble for assignment.
    Code
      with_df(df[as.character(-(3:5)), ] <- df[1, ])
    Warning <lifecycle_warning_deprecated>
      The `i` argument of `[.tbl_df` must use valid row names as of tibble 3.0.0.
      Use `NA_integer_` as row index to obtain a row full of `NA` values.
    Error <tibble_error_assign_rows_non_na_only>
      Can't use NA as row index in a tibble for assignment.
    Code
      with_df(df[NA_character_, ] <- df[1, ])
    Error <tibble_error_assign_rows_non_na_only>
      Can't use NA as row index in a tibble for assignment.
    Code
      with_df(df[2:3, 1] <- df[1:2, 2])
    Error <tibble_error_assign_incompatible_type>
      Assigned data `df[1:2, 2]` must be compatible with existing data.
      i Error occurred for column `n`.
      x Can't convert <character> to <integer>.
    Code
      with_df(df[2:3, 2] <- df[1:2, 3])
    Error <tibble_error_assign_incompatible_type>
      Assigned data `df[1:2, 3]` must be compatible with existing data.
      i Error occurred for column `c`.
      x Can't convert <list> to <character>.
    Code
      with_df(df[2:3, 3] <- df2[1:2, 1])
    Error <rlang_error>
      Internal error in `df_cast_opts()`: Data frame must have names.
    Code
      with_df2(df2[2:3, 1] <- df2[1:2, 2])
    Error <tibble_error_assign_incompatible_type>
      Assigned data `df2[1:2, 2]` must be compatible with existing data.
      i Error occurred for column `tb`.
      x Can't convert <double[,4]> to <tbl_df>.
    Code
      with_df2(df2[2:3, 2] <- df[1:2, 1])
    Output
      # A tibble: 4 x 2
         tb$n $c    $li       m[,1]  [,2]  [,3]  [,4]
        <int> <chr> <list>    <dbl> <dbl> <dbl> <dbl>
      1     1 e     <dbl [1]>     1     0     0     0
      2    NA f     <int [2]>     1     1     1     1
      3     3 g     <int [3]>    NA    NA    NA    NA
      4    NA h     <chr [1]>     0     0     0     1
    Code
      with_df({
        df$x <- NA
        df[2:3, "x"] <- 3:2
      })
    Error <tibble_error_assign_incompatible_type>
      Assigned data `3:2` must be compatible with existing data.
      i Error occurred for column `x`.
      x Can't convert from <integer> to <logical> due to loss of precision.
      * Locations: 1, 2.
    Code
      with_df({
        df$x <- NA_integer_
        df[2:3, "x"] <- 3:2
      })
    Output
      # A tibble: 4 x 4
            n c     li            x
        <int> <chr> <list>    <int>
      1     1 e     <dbl [1]>    NA
      2    NA f     <int [2]>     3
      3     3 g     <int [3]>     2
      4    NA h     <chr [1]>    NA
    Code
      with_df(df[2:3, "n"] <- 1)
    Output
      # A tibble: 4 x 3
            n c     li       
        <int> <chr> <list>   
      1     1 e     <dbl [1]>
      2     1 f     <int [2]>
      3     1 g     <int [3]>
      4    NA h     <chr [1]>
    Code
      with_df(df[2:3, "x"] <- 1)
    Output
      # A tibble: 4 x 4
            n c     li            x
        <int> <chr> <list>    <dbl>
      1     1 e     <dbl [1]>    NA
      2    NA f     <int [2]>     1
      3     3 g     <int [3]>     1
      4    NA h     <chr [1]>    NA
    Code
      with_df(df[2:3, "n"] <- NULL)
    Error <tibble_error_need_rhs_vector>
      `NULL` must be a vector, a bare list, a data frame or a matrix.
    Code
      with_df(df[5, "n"] <- list(0L))
    Output
      # A tibble: 5 x 3
            n c     li       
        <int> <chr> <list>   
      1     1 e     <dbl [1]>
      2    NA f     <int [2]>
      3     3 g     <int [3]>
      4    NA h     <chr [1]>
      5     0 <NA>  <NULL>   
    Code
      with_df(df[[1, 1]] <- 0)
    Output
      # A tibble: 4 x 3
            n c     li       
        <int> <chr> <list>   
      1     0 e     <dbl [1]>
      2    NA f     <int [2]>
      3     3 g     <int [3]>
      4    NA h     <chr [1]>
    Code
      with_df(df[1, ][[1]] <- 0)
    Output
      # A tibble: 4 x 3
            n c     li       
        <int> <chr> <list>   
      1     0 e     <dbl [1]>
      2    NA f     <int [2]>
      3     3 g     <int [3]>
      4    NA h     <chr [1]>
    Code
      with_df(df[[1, 3]] <- list(NULL))
    Output
      # A tibble: 4 x 3
            n c     li       
        <int> <chr> <list>   
      1     1 e     <NULL>   
      2    NA f     <int [2]>
      3     3 g     <int [3]>
      4    NA h     <chr [1]>
    Code
      with_df(df[1, ][[3]] <- list(NULL))
    Output
      # A tibble: 4 x 3
            n c     li       
        <int> <chr> <list>   
      1     1 e     <NULL>   
      2    NA f     <int [2]>
      3     3 g     <int [3]>
      4    NA h     <chr [1]>
    Code
      with_df2(df2[[1, 1]] <- df[1, ])
    Output
      # A tibble: 4 x 2
         tb$n $c    $li       m[,1]  [,2]  [,3]  [,4]
        <int> <chr> <list>    <dbl> <dbl> <dbl> <dbl>
      1     1 e     <dbl [1]>     1     0     0     0
      2    NA f     <int [2]>     0     1     0     0
      3     3 g     <int [3]>     0     0     1     0
      4    NA h     <chr [1]>     0     0     0     1
    Code
      with_df2(df2[1, ][[1]] <- df[1, ])
    Output
      # A tibble: 4 x 2
         tb$n $c    $li       m[,1]  [,2]  [,3]  [,4]
        <int> <chr> <list>    <dbl> <dbl> <dbl> <dbl>
      1     1 e     <dbl [1]>     1     0     0     0
      2    NA f     <int [2]>     0     1     0     0
      3     3 g     <int [3]>     0     0     1     0
      4    NA h     <chr [1]>     0     0     0     1
    Code
      with_df2(df2[[1, 2]] <- t(1:4))
    Output
      # A tibble: 4 x 2
         tb$n $c    $li       m[,1]  [,2]  [,3]  [,4]
        <int> <chr> <list>    <dbl> <dbl> <dbl> <dbl>
      1     1 e     <dbl [1]>     1     2     3     4
      2    NA f     <int [2]>     0     1     0     0
      3     3 g     <int [3]>     0     0     1     0
      4    NA h     <chr [1]>     0     0     0     1
    Code
      with_df2(df2[1, ][[2]] <- t(1:4))
    Output
      # A tibble: 4 x 2
         tb$n $c    $li       m[,1]  [,2]  [,3]  [,4]
        <int> <chr> <list>    <dbl> <dbl> <dbl> <dbl>
      1     1 e     <dbl [1]>     1     2     3     4
      2    NA f     <int [2]>     0     1     0     0
      3     3 g     <int [3]>     0     0     1     0
      4    NA h     <chr [1]>     0     0     0     1
    Code
      df[[1:2, 1]]
    Error <vctrs_error_subscript_type>
      Must extract row with a single valid subscript.
      x Subscript `1:2` has size 2 but must be size 1.
    Code
      with_df(df[[1:2, 1]] <- 0)
    Error <vctrs_error_subscript_type>
      Must assign to row with a single valid subscript.
      x Subscript `1:2` has size 2 but must be size 1.
    Code
      stopifnot(identical(df, new_df()))


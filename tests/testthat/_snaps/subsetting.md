# output test

    Code
      # # [.tbl_df is careful about names (#1245)
      foo <- tibble(x = 1:10, y = 1:10)
      foo[c("x", "y", "z")]
    Condition
      Error in `[.data.frame`:
      ! undefined columns selected
    Code
      foo[c("w", "x", "y", "z")]
    Condition
      Error in `[.data.frame`:
      ! undefined columns selected
    Code
      foo[as.matrix("x")]
    Output
      [1] NA
    Code
      foo[array("x", dim = c(1, 1, 1))]
    Output
      # A tibble: 10 x 1
             x
         <int>
       1     1
       2     2
       3     3
       4     4
       5     5
       6     6
       7     7
       8     8
       9     9
      10    10
    Code
      # # [.tbl_df is careful about column indexes (#83)
      foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
      foo[0.5]
    Output
      # A tibble: 10 x 0
    Code
      foo[1:5]
    Condition
      Error in `[.data.frame`:
      ! undefined columns selected
    Code
      foo[-1:1]
    Condition
      Error in `[.default`:
      ! only 0's may be mixed with negative subscripts
    Code
      foo[c(-1, 1)]
    Condition
      Error in `[.default`:
      ! only 0's may be mixed with negative subscripts
    Code
      foo[c(-1, NA)]
    Condition
      Error in `[.default`:
      ! only 0's may be mixed with negative subscripts
    Code
      foo[-4]
    Output
      # A tibble: 10 x 3
             x     y     z
         <int> <int> <int>
       1     1     1     1
       2     2     2     2
       3     3     3     3
       4     4     4     4
       5     5     5     5
       6     6     6     6
       7     7     7     7
       8     8     8     8
       9     9     9     9
      10    10    10    10
    Code
      foo[c(1:3, NA)]
    Condition
      Error in `[.data.frame`:
      ! undefined columns selected
    Code
      foo[as.matrix(1)]
    Output
      [1] 1
    Code
      foo[array(1, dim = c(1, 1, 1))]
    Output
      # A tibble: 10 x 1
             x
         <int>
       1     1
       2     2
       3     3
       4     4
       5     5
       6     6
       7     7
       8     8
       9     9
      10    10
    Code
      foo[mean]
    Condition
      Error in `[.default`:
      ! invalid subscript type 'closure'
    Code
      foo[foo]
    Condition
      Error in `[.default`:
      ! invalid subscript type 'list'
    Code
      # # [.tbl_df is careful about row indexes
      foo <- tibble(x = 1:3, y = 1:3, z = 1:3)
      foo[0.5, ]
    Output
      # A tibble: 0 x 3
      # ... with 3 variables: x <int>, y <int>, z <int>
    Code
      invisible(foo[1:5, ])
      foo[-1:1, ]
    Condition
      Error in `xj[i]`:
      ! only 0's may be mixed with negative subscripts
    Code
      foo[c(-1, 1), ]
    Condition
      Error in `xj[i]`:
      ! only 0's may be mixed with negative subscripts
    Code
      foo[c(-1, NA), ]
    Condition
      Error in `xj[i]`:
      ! only 0's may be mixed with negative subscripts
    Code
      invisible(foo[-4, ])
      foo[array(1, dim = c(1, 1, 1)), ]
    Output
      # A tibble: 1 x 3
            x     y     z
      * <int> <int> <int>
      1     1     1     1
    Code
      foo[mean, ]
    Condition
      Error in `xj[i]`:
      ! invalid subscript type 'closure'
    Code
      foo[foo, ]
    Condition
      Error in `xj[i]`:
      ! invalid subscript type 'list'
    Code
      # # [.tbl_df is careful about column flags (#83)
      foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
      foo[c(TRUE, TRUE)]
    Output
      # A tibble: 10 x 3
             x     y     z
         <int> <int> <int>
       1     1     1     1
       2     2     2     2
       3     3     3     3
       4     4     4     4
       5     5     5     5
       6     6     6     6
       7     7     7     7
       8     8     8     8
       9     9     9     9
      10    10    10    10
    Code
      foo[c(TRUE, TRUE, FALSE, FALSE)]
    Output
      # A tibble: 10 x 2
             x     y
         <int> <int>
       1     1     1
       2     2     2
       3     3     3
       4     4     4
       5     5     5
       6     6     6
       7     7     7
       8     8     8
       9     9     9
      10    10    10
    Code
      foo[c(TRUE, TRUE, NA)]
    Condition
      Error in `[.data.frame`:
      ! undefined columns selected
    Code
      foo[as.matrix(TRUE)]
    Output
       [1]  1  2  3  4  5  6  7  8  9 10  1  2  3  4  5  6  7  8  9 10  1  2  3  4  5
      [26]  6  7  8  9 10
    Code
      foo[array(TRUE, dim = c(1, 1, 1))]
    Output
      # A tibble: 10 x 3
             x     y     z
         <int> <int> <int>
       1     1     1     1
       2     2     2     2
       3     3     3     3
       4     4     4     4
       5     5     5     5
       6     6     6     6
       7     7     7     7
       8     8     8     8
       9     9     9     9
      10    10    10    10
    Code
      # # [.tbl_df is careful about row flags
      foo <- tibble(x = 1:3, y = 1:3, z = 1:3)
      foo[c(TRUE, TRUE), ]
    Output
      # A tibble: 3 x 3
            x     y     z
      * <int> <int> <int>
      1     1     1     1
      2     2     2     2
      3     3     3     3
    Code
      foo[c(TRUE, TRUE, FALSE, FALSE), ]
    Output
      # A tibble: 2 x 3
            x     y     z
      * <int> <int> <int>
      1     1     1     1
      2     2     2     2
    Code
      foo[array(TRUE, dim = c(1, 1, 1)), ]
    Output
      # A tibble: 3 x 3
            x     y     z
      * <int> <int> <int>
      1     1     1     1
      2     2     2     2
      3     3     3     3
    Code
      # # [.tbl_df rejects unknown column indexes (#83)
      foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
      foo[list(1:3)]
    Condition
      Error in `[.default`:
      ! invalid subscript type 'list'
    Code
      foo[as.list(1:3)]
    Condition
      Error in `[.default`:
      ! invalid subscript type 'list'
    Code
      foo[factor(1:3)]
    Output
      # A tibble: 10 x 3
             x     y     z
         <int> <int> <int>
       1     1     1     1
       2     2     2     2
       3     3     3     3
       4     4     4     4
       5     5     5     5
       6     6     6     6
       7     7     7     7
       8     8     8     8
       9     9     9     9
      10    10    10    10
    Code
      foo[Sys.Date()]
    Condition
      Error in `[.data.frame`:
      ! undefined columns selected
    Code
      # # [.tbl_df rejects unknown row indexes
      foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
      foo[list(1:3), ]
    Condition
      Error in `xj[i]`:
      ! invalid subscript type 'list'
    Code
      foo[as.list(1:3), ]
    Condition
      Error in `xj[i]`:
      ! invalid subscript type 'list'
    Code
      foo[factor(1:3), ]
    Output
      # A tibble: 3 x 3
            x     y     z
      * <int> <int> <int>
      1     1     1     1
      2     2     2     2
      3     3     3     3
    Code
      foo[Sys.Date(), ]
    Output
      # A tibble: 1 x 3
            x     y     z
      * <int> <int> <int>
      1    NA    NA    NA
    Code
      # # [.tbl_df and matrix subsetting
      foo <- tibble(a = 1:3, b = letters[1:3])
      foo[is.na(foo)]
    Output
      character(0)
    Code
      foo[!is.na(foo)]
    Output
      [1] "1" "2" "3" "a" "b" "c"
    Code
      foo[as.matrix("x")]
    Output
      [1] NA
    Code
      foo[array("x", dim = c(1, 1, 1))]
    Condition
      Error in `[.data.frame`:
      ! undefined columns selected
    Code
      # # [.tbl_df and OOB indexing
      foo <- tibble(a = 1:3, b = letters[1:3])
      invisible(foo[3:5, ])
      invisible(foo[-(3:5), ])
      invisible(foo["x", ])
      # # [.tbl_df and logical recycling
      foo <- tibble(a = 1:4, b = a)
      foo[c(TRUE, FALSE), ]
    Output
      # A tibble: 2 x 2
            a     b
      * <int> <int>
      1     1     1
      2     3     3
    Code
      # # [[.tbl_df rejects invalid column indexes
      foo <- tibble(x = 1:10, y = 1:10)
      foo[[]]
    Condition
      Error:
      ! argument "i" is missing, with no default
    Code
      foo[[, 1]]
    Condition
      Error in `[[.data.frame`:
      ! argument "..1" is missing, with no default
    Code
      foo[[1, ]]
    Condition
      Error in `[[.data.frame`:
      ! argument "..2" is missing, with no default
    Code
      foo[[, ]]
    Condition
      Error in `[[.data.frame`:
      ! argument "..2" is missing, with no default
    Code
      foo[[1:3]]
    Condition
      Error in `.subset2()`:
      ! recursive indexing failed at level 2
    Code
      foo[[letters[1:3]]]
    Condition
      Error in `.subset2()`:
      ! no such index at level 1
    Code
      foo[[TRUE]]
    Output
       [1]  1  2  3  4  5  6  7  8  9 10
    Code
      foo[[-1]]
    Output
       [1]  1  2  3  4  5  6  7  8  9 10
    Code
      foo[[1.5]]
    Output
       [1]  1  2  3  4  5  6  7  8  9 10
    Code
      foo[[3]]
    Condition
      Error in `.subset2()`:
      ! subscript out of bounds
    Code
      foo[[Inf]]
    Output
      NULL
    Code
      foo[[mean]]
    Condition
      Error in `.subset2()`:
      ! invalid subscript type 'closure'
    Code
      foo[[foo]]
    Condition
      Error in `.subset2()`:
      ! invalid subscript type 'list'
    Code
      # # [[.tbl_df throws error with NA index
      foo <- tibble(x = 1:10, y = 1:10)
      foo[[NA]]
    Output
      NULL
    Code
      # # $.tbl_df and partial matching/invalid columns
      foo <- tibble(data = 1:10)
      foo$d
    Output
       [1]  1  2  3  4  5  6  7  8  9 10
    Code
      foo$e
    Output
      NULL
    Code
      # # [<-.tbl_df rejects unknown column indexes (#83)
      foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
      foo[list(1:3)] <- 1
    Condition
      Error in `min()`:
      ! invalid 'type' (list) of argument
    Code
      foo[as.list(1:3)] <- 1
    Condition
      Error in `min()`:
      ! invalid 'type' (list) of argument
    Code
      foo[factor(1:3)] <- 1
    Condition
      Error in `Summary.factor()`:
      ! 'min' not meaningful for factors
    Code
      foo[Sys.Date()] <- 1
    Condition
      Error in `[<-.data.frame`:
      ! new columns would leave holes after existing columns
    Code
      # # [.tbl_df emits lifecycle warnings with one-column matrix indexes (#760)
      foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
      invisible(foo[matrix(1:2, ncol = 1), ])
      invisible(foo[matrix(rep(TRUE, 10), ncol = 1), ])
      # # [<-.tbl_df rejects unknown row indexes
      foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
      foo[list(1:3), ] <- 1
    Condition
      Error in `[<-.data.frame`:
      ! 'list' object cannot be coerced to type 'integer'
    Code
      foo[as.list(1:3), ] <- 1
    Condition
      Error in `max()`:
      ! invalid 'type' (list) of argument
    Code
      foo[factor(1:3), ] <- 1
    Condition
      Warning in `Ops.factor()`:
      '>=' not meaningful for factors
      Error in `Summary.factor()`:
      ! 'max' not meaningful for factors
    Code
      foo[Sys.Date(), ] <- 1
      # # [<-.tbl_df throws an error with duplicate indexes (#658)
      df <- tibble(x = 1:2, y = x)
      df[c(1, 1)] <- 3
    Condition
      Error in `[<-.data.frame`:
      ! duplicate subscripts for columns
    Code
      df[, c(1, 1)] <- 3
    Condition
      Error in `[<-.data.frame`:
      ! duplicate subscripts for columns
    Code
      df[c(1, 1), ] <- 3
      # # [<-.tbl_df throws an error with NA indexes
      df <- tibble(x = 1:2, y = x)
      df[NA] <- 3
    Condition
      Error in `[<-.data.frame`:
      ! missing values are not allowed in subscripted assignments of data frames
    Code
      df[NA, ] <- 3
    Condition
      Error in `[<-.data.frame`:
      ! missing values are not allowed in subscripted assignments of data frames
    Code
      # # [<-.tbl_df and logical indexes
      df <- tibble(x = 1:2, y = x)
      df[FALSE] <- 1
      df
    Output
      # A tibble: 2 x 2
            x     y
        <int> <int>
      1     1     1
      2     2     2
    Code
      df[, TRUE] <- 2
      df
    Output
      # A tibble: 2 x 2
            x     y
        <dbl> <dbl>
      1     2     2
      2     2     2
    Code
      # # [<-.tbl_df throws an error with bad RHS
      df <- tibble(x = 1:2, y = x)
      df[] <- mean
    Condition
      Error in `as.vector()`:
      ! cannot coerce type 'closure' to vector of type 'any'
    Code
      df[] <- lm(y ~ x, df)
    Condition
      Warning in `[<-.data.frame`:
      replacement element 7 has 5 rows to replace 2 rows
      Warning in `[<-.data.frame`:
      replacement element 10 has 3 rows to replace 2 rows
      Warning in `[<-.data.frame`:
      replacement element 11 has 3 rows to replace 2 rows
      Error in `terms.formula()`:
      ! invalid model formula in ExtractVars
    Code
      # # [<-.tbl_df throws an error with OOB assignment
      df <- tibble(x = 1:2, y = x)
      df[4:5] <- 3
    Condition
      Error in `[<-.data.frame`:
      ! new columns would leave holes after existing columns
    Code
      df[4:5, ] <- 3
      df[-4, ] <- 3
      df[-(4:5), ] <- 3
      # # [<-.tbl_df and recycling
      df <- tibble(x = 1:3, y = x, z = y)
      df[1:2] <- list(0, 0, 0)
    Condition
      Warning in `[<-.data.frame`:
      provided 3 variables to replace 2 variables
    Code
      df[] <- list(0, 0)
      df[1, ] <- 1:3
      df[1:2, ] <- 1:3
      df[, ] <- 1:2
    Condition
      Error in `[<-.data.frame`:
      ! replacement has 2 items, need 9
    Code
      df[1, ] <- list(a = 1:3, b = 1)
    Condition
      Warning in `[<-.data.frame`:
      replacement element 1 has 3 rows to replace 1 rows
    Code
      df[1, ] <- list(a = 1, b = 1:3)
    Condition
      Warning in `[<-.data.frame`:
      replacement element 2 has 3 rows to replace 1 rows
    Code
      df[1:2, ] <- list(a = 1:3, b = 1)
    Condition
      Warning in `[<-.data.frame`:
      replacement element 1 has 3 rows to replace 2 rows
    Code
      df[1:2, ] <- list(a = 1, b = 1:3)
    Condition
      Warning in `[<-.data.frame`:
      replacement element 2 has 3 rows to replace 2 rows
    Code
      df[1, 1:2] <- list(a = 1:3, b = 1)
    Condition
      Warning in `[<-.data.frame`:
      replacement element 1 has 3 rows to replace 1 rows
    Code
      df[1, 1:2] <- list(a = 1, b = 1:3)
    Condition
      Warning in `[<-.data.frame`:
      replacement element 2 has 3 rows to replace 1 rows
    Code
      df[1:2, 1:2] <- list(a = 1:3, b = 1)
    Condition
      Warning in `[<-.data.frame`:
      replacement element 1 has 3 rows to replace 2 rows
    Code
      df[1:2, 1:2] <- list(a = 1, b = 1:3)
    Condition
      Warning in `[<-.data.frame`:
      replacement element 2 has 3 rows to replace 2 rows
    Code
      df[1, ] <- list(a = 1:3, b = 1, c = 1:3)
    Condition
      Warning in `[<-.data.frame`:
      replacement element 1 has 3 rows to replace 1 rows
      Warning in `[<-.data.frame`:
      replacement element 3 has 3 rows to replace 1 rows
    Code
      df[1, ] <- list(a = 1, b = 1:3, c = 1:3)
    Condition
      Warning in `[<-.data.frame`:
      replacement element 2 has 3 rows to replace 1 rows
      Warning in `[<-.data.frame`:
      replacement element 3 has 3 rows to replace 1 rows
    Code
      df[1:2, ] <- list(a = 1:3, b = 1, c = 1:3)
    Condition
      Warning in `[<-.data.frame`:
      replacement element 1 has 3 rows to replace 2 rows
      Warning in `[<-.data.frame`:
      replacement element 3 has 3 rows to replace 2 rows
    Code
      df[1:2, ] <- list(a = 1, b = 1:3, c = 1:3)
    Condition
      Warning in `[<-.data.frame`:
      replacement element 2 has 3 rows to replace 2 rows
      Warning in `[<-.data.frame`:
      replacement element 3 has 3 rows to replace 2 rows
    Code
      # # [<-.tbl_df and coercion
      df <- tibble(x = 1:3, y = letters[1:3], z = as.list(1:3))
      df[1:3, 1:2] <- df[2:3]
      df[1:3, 1:2] <- df[1]
      df[1:3, 1:2] <- df[[1]]
      df[1:3, 1:3] <- df[3:1]
      df[1:3, 1:3] <- NULL
      # # [<-.tbl_df and overwriting NA
      df <- tibble(x = rep(NA, 3), z = matrix(NA, ncol = 2, dimnames = list(NULL, c(
        "a", "b"))))
      df[1, "x"] <- 5
      df[1, "z"] <- 5
      df
    Output
      # A tibble: 3 x 2
            x z[,"a"] [,"b"]
        <dbl>   <dbl>  <dbl>
      1     5       5      5
      2    NA      NA     NA
      3    NA      NA     NA
    Code
      # # [<-.tbl_df and overwriting with NA
      df <- tibble(a = TRUE, b = 1L, c = sqrt(2), d = 0+3i + 1, e = "e", f = raw(1),
      g = tibble(x = 1, y = 1), h = matrix(1:3, nrow = 1))
      df[FALSE, "a"] <- NA
      df[FALSE, "b"] <- NA
      df[FALSE, "c"] <- NA
      df[FALSE, "d"] <- NA
      df[FALSE, "e"] <- NA
      df[FALSE, "f"] <- NA
      df[FALSE, "g"] <- NA
      df[FALSE, "h"] <- NA
      df
    Output
      # A tibble: 1 x 8
        a         b     c d     e     f       g$x    $y h[,1]  [,2]  [,3]
        <lgl> <int> <dbl> <cpl> <chr> <raw> <dbl> <dbl> <int> <int> <int>
      1 TRUE      1  1.41 1+3i  e     00        1     1     1     2     3
    Code
      df[integer(), "a"] <- NA
      df[integer(), "b"] <- NA
      df[integer(), "c"] <- NA
      df[integer(), "d"] <- NA
      df[integer(), "e"] <- NA
      df[integer(), "f"] <- NA
      df[integer(), "g"] <- NA
      df[integer(), "h"] <- NA
      df
    Output
      # A tibble: 1 x 8
        a         b     c d     e     f       g$x    $y h[,1]  [,2]  [,3]
        <lgl> <int> <dbl> <cpl> <chr> <raw> <dbl> <dbl> <int> <int> <int>
      1 TRUE      1  1.41 1+3i  e     00        1     1     1     2     3
    Code
      df[1, "a"] <- NA
      df[1, "b"] <- NA
      df[1, "c"] <- NA
      df[1, "d"] <- NA
      df[1, "e"] <- NA
      df[1, "f"] <- NA
    Condition
      Error in `x[[jj]][iseq] <- vjj`:
      ! incompatible types (from logical to raw) in subassignment type fix
    Code
      df[1, "g"] <- NA
      df[1, "h"] <- NA
      df
    Output
      # A tibble: 1 x 8
        a         b     c d     e     f       g$x    $y h[,1]  [,2]  [,3]
        <lgl> <int> <dbl> <cpl> <chr> <raw> <dbl> <dbl> <int> <int> <int>
      1 NA       NA    NA NA    <NA>  00       NA    NA    NA    NA    NA
    Code
      # # [<-.tbl_df and matrix subsetting
      foo <- tibble(a = 1:3, b = letters[1:3])
      foo[!is.na(foo)] <- "bogus"
      foo[as.matrix("x")] <- NA
    Condition
      Error in `[<-.data.frame`:
      ! unsupported matrix index in replacement
    Code
      foo[array("x", dim = c(1, 1, 1))] <- NA
      foo[is.na(foo)] <- 1:3
      foo[is.na(foo)] <- lm(a ~ b, foo)
    Condition
      Warning in `storage.mode(v) <- "double"`:
      NAs introduced by coercion
      Error in `contrasts<-`:
      ! contrasts can be applied only to factors with 2 or more levels
    Code
      # # [[<-.tbl_df rejects invalid column indexes
      foo <- tibble(x = 1:10, y = 1:10)
      foo[[]] <- 1
    Condition
      Error in `x[[i]] <- value`:
      ! [[ ]] with missing subscript
    Code
      foo[[, 1]] <- 1
    Condition
      Error in `[[<-.data.frame`:
      ! only valid calls are x[[j]] <- value or x[[i,j]] <- value
    Code
      foo[[1, ]] <- 1
    Condition
      Error in `[[<-.data.frame`:
      ! only valid calls are x[[j]] <- value or x[[i,j]] <- value
    Code
      foo[[, ]] <- 1
    Condition
      Error in `[[<-.data.frame`:
      ! only valid calls are x[[j]] <- value or x[[i,j]] <- value
    Code
      foo[[1:3]] <- 1
    Condition
      Error in `[[<-`:
      ! recursive indexing failed at level 2
    Code
      foo[[letters[1:3]]] <- 1
    Condition
      Error in `[[<-`:
      ! no such index at level 1
    Code
      foo[[TRUE]] <- 1
      foo[[NA_integer_]] <- 1
    Condition
      Error in `x[[i]] <- value`:
      ! attempt to select more than one element in integerOneIndex
    Code
      foo[[mean]] <- 1
    Condition
      Error in `x[[i]] <- value`:
      ! invalid subscript type 'closure'
    Code
      foo[[foo]] <- 1
    Condition
      Error in `x[[i]] <- value`:
      ! invalid subscript type 'list'
    Code
      foo[[1:3, 1]] <- 1
    Condition
      Error in `[[<-.data.frame`:
      ! only a single element should be replaced
    Code
      foo[[TRUE, 1]] <- 1
    Condition
      Error in `[[<-.data.frame`:
      ! only a single element should be replaced
    Code
      foo[[mean, 1]] <- 1
    Condition
      Error in `i >= 0L`:
      ! comparison (5) is possible only for atomic and list types
    Code
      foo[[foo, 1]] <- 1
    Condition
      Error in `seq_len(nrows)[i]`:
      ! invalid subscript type 'list'
    Code
      # # [[<-.tbl_df throws an error with OOB assignment
      df <- tibble(x = 1:2, y = x)
      df[[4]] <- 3
      # # [[<-.tbl_df throws an error with bad RHS
      df <- tibble(x = 1:2, y = x)
      df[[1]] <- mean
    Condition
      Error in `rep()`:
      ! attempt to replicate an object of type 'closure'
    Code
      df[[1]] <- lm(y ~ x, df)
    Condition
      Error in `[[<-.data.frame`:
      ! replacement has 12 rows, data has 2
    Code
      # # [[<-.tbl_df recycles only values of length one
      df <- tibble(x = 1:3)
      df[["x"]] <- 8:9
    Condition
      Error in `[[<-.data.frame`:
      ! replacement has 2 rows, data has 3
    Code
      df[["w"]] <- 8:9
    Condition
      Error in `[[<-.data.frame`:
      ! replacement has 2 rows, data has 3
    Code
      df[["a"]] <- character()
    Condition
      Error in `[[<-.data.frame`:
      ! replacement has 0 rows, data has 3
    Code
      # # [<-.tbl_df throws an error with invalid values
      df <- tibble(x = 1:2, y = x)
      df[1] <- lm(y ~ x, df)
    Condition
      Warning in `[<-.data.frame`:
      replacement element 7 has 5 rows to replace 2 rows
      Warning in `[<-.data.frame`:
      replacement element 10 has 3 rows to replace 2 rows
      Warning in `[<-.data.frame`:
      replacement element 11 has 3 rows to replace 2 rows
      Error in `terms.formula()`:
      ! invalid model formula in ExtractVars
    Code
      df[1:2, 1] <- NULL
    Condition
      Error in `x[[jj]][iseq] <- vjj`:
      ! replacement has length zero
    Code
      # # $<- recycles only values of length one
      df <- tibble(x = 1:3)
      df$x <- 8:9
    Condition
      Error in `$<-.data.frame`:
      ! replacement has 2 rows, data has 3
    Code
      df$w <- 8:9
    Condition
      Error in `$<-.data.frame`:
      ! replacement has 2 rows, data has 3
    Code
      df$a <- character()
    Condition
      Error in `$<-.data.frame`:
      ! replacement has 0 rows, data has 3


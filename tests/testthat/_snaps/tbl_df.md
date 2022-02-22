# output test

    Code
      df <- tibble(a = 1, b = 2)
      names(df) <- NULL
    Condition
      Warning:
      The `value` argument of `names<-` can't be NULL as of tibble 3.0.0.
      `names` must not be `NULL`.
      Warning:
      The `value` argument of `names<-` must have the same length as `x` as of tibble 3.0.0.
      `names` must have length 2, not 0.
      Warning:
      The `value` argument of `names<-` can't be empty as of tibble 3.0.0.
      Columns 1 and 2 must be named.
    Code
      names(df) <- "c"
    Condition
      Warning:
      The `value` argument of `names<-` must have the same length as `x` as of tibble 3.0.0.
      `names` must have length 2, not 1.
      Warning:
      The `value` argument of `names<-` can't be empty as of tibble 3.0.0.
      Column 2 must be named.
    Code
      names(df) <- c("..1", "..2")


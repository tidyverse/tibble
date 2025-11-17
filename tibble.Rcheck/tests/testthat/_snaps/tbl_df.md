# output test

    Code
      df <- tibble(a = 1, b = 2)
      names(df) <- NULL
    Condition
      Warning:
      The `value` argument of `names<-()` can't be NULL as of tibble 3.0.0.
      Warning:
      The `value` argument of `names<-()` must have the same length as `x` as of tibble 3.0.0.
      Warning:
      The `value` argument of `names<-()` can't be empty as of tibble 3.0.0.
    Code
      names(df) <- "c"
    Condition
      Warning:
      The `value` argument of `names<-()` must have the same length as `x` as of tibble 3.0.0.
      Warning:
      The `value` argument of `names<-()` can't be empty as of tibble 3.0.0.
    Code
      names(df) <- c("..1", "..2")


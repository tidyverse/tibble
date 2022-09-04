# [<-.tbl_df supports subsetting with a logical matrix (#649)

    Code
      foo[m] <- 1
    Condition
      Error in `[<-.tbl_df`:
      ! Assigned data `1` must be compatible with existing data.
      i Error occurred for column `z`.
      Caused by error in `vec_assign()`:
      ! Can't convert <double> to <character>.


# wakefield

Version: 0.3.3

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > 
    > dat <- r_data_frame(12,
    +     name,
    +     r_series(likert, 10, relate = "+1_.5")
    + )
    > 
    > # Suggested use of tidyr or reshape2 package here instead
    > dat <- data.frame(
    +     ID = rep(dat[[1]], ncol(dat[-1])),
    +     stack(dat[-1])
    + )
    Error: The `names` must not be `NULL`.
    Execution halted
    ```


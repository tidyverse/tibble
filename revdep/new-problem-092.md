# philr

Version: 1.6.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘philr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: annotate_balance
    > ### Title: annotate_balance
    > ### Aliases: annotate_balance
    > 
    > ### ** Examples
    > 
    > tr <- named_rtree(10)
    > 
    > annotate_balance(tr, 'n4', size=7)
    Error in as.data.frame.default(x) : 
      cannot coerce class ‘"phylo"’ to a data.frame
    Calls: annotate_balance ... as_tibble -> as.data.frame -> as.data.frame.default
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
        expand
    
    The following object is masked from 'package:ape':
    
        rotate
    
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 218-230 (philr-intro.Rmd) 
    Error: processing vignette 'philr-intro.Rmd' failed with diagnostics:
    cannot coerce class '"phylo"' to a data.frame
    Execution halted
    ```


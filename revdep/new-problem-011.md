# descriptr

Version: 0.4.1

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ds_freq_cont(mtcarz, mpg, 4)
                                    Variable: mpg                                 
    |---------------------------------------------------------------------------|
    |      Bins       | Frequency | Cum Frequency |   Percent    | Cum Percent  |
    |---------------------------------------------------------------------------|
    |  10.4  -  16.3  |    10     |      10       |    31.25     |    31.25     |
    |---------------------------------------------------------------------------|
    |  16.3  -  22.1  |    13     |      23       |    40.62     |    71.88     |
    |---------------------------------------------------------------------------|
    |  22.1  -   28   |     5     |      28       |    15.62     |     87.5     |
    |---------------------------------------------------------------------------|
    |   28   -  33.9  |     4     |      32       |     12.5     |     100      |
    |---------------------------------------------------------------------------|
    |      Total      |    32     |       -       |    100.00    |      -       |
    |---------------------------------------------------------------------------|> 
    > # histogram
    > k <- ds_freq_cont(mtcarz, mpg, 4)
    > plot(k)
    Error: Columns 1, 2, 3, 4 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 135-137 (descriptive-stats.Rmd) 
    Error: processing vignette 'descriptive-stats.Rmd' failed with diagnostics:
    Columns 1, 2, 3, 4 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```


# mixpack

Version: 0.3.6

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      The vignette engine knitr::rmarkdown is not available, because the rmarkdown package is not installed. Please install it.
    Package 'mclust' version 5.4.1
    Type 'citation("mclust")' for citing this R package in publications.
    mixpack: a package for mixture components analysis
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 50-51 (mixture_components.Rmd) 
    Error: processing vignette 'mixture_components.Rmd' failed with diagnostics:
    Columns 1, 2, 3, 4, 5, … (and 1 more) must be named.
    Execution halted
    ```


# particles

Version: 0.2.1

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘particles-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: evolve
    > ### Title: Move the simulation forward one or more steps
    > ### Aliases: evolve
    > 
    > ### ** Examples
    > 
    > graph <- tidygraph::create_notable('folkman')
    > sim <- graph %>%
    +   simulate() %>%
    +   wield(link_force) %>%
    +   wield(manybody_force)
    Error in is.force(force) : Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Calls: %>% ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    
    Attaching package: 'particles'
    
    The following objects are masked from 'package:stats':
    
        filter, simulate
    
    
    Attaching package: 'tidygraph'
    
    The following object is masked from 'package:stats':
    
        filter
    
    Quitting from lines 61-71 (intro.Rmd) 
    Error: processing vignette 'intro.Rmd' failed with diagnostics:
    Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```


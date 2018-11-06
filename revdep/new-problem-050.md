# tidytree

Version: 0.1.9

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidytree-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ancestor
    > ### Title: ancestor
    > ### Aliases: ancestor ancestor.tbl_tree
    > 
    > ### ** Examples
    > 
    > library(ape)
    > tree <- rtree(4)
    > x <- as_data_frame(tree)
    Error in as.data.frame.default(x) : 
      cannot coerce class ‘"phylo"’ to a data.frame
    Calls: as_data_frame ... as_tibble -> as.data.frame -> as.data.frame.default
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 0 SKIPPED: 0 FAILED: 14
      1. Error: conversion to table is reversible (@test-access-related-nodes.R#27) 
      2. Error: child works for bifurcating trees (@test-access-related-nodes.R#35) 
      3. Error: child works for non-bifurcating trees (@test-access-related-nodes.R#44) 
      4. Error: offspring works on bifurcating trees (@test-access-related-nodes.R#52) 
      5. Error: offspring works on non-bifurcating trees (@test-access-related-nodes.R#58) 
      6. Error: parent works for bifurcating trees (@test-access-related-nodes.R#64) 
      7. Error: parent works for non-bifurcating trees (@test-access-related-nodes.R#70) 
      8. Error: ancestor works for bifurcating trees (@test-access-related-nodes.R#76) 
      9. Error: ancestor works for non-bifurcating trees (@test-access-related-nodes.R#82) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    
    Attaching package: 'tidytree'
    
    The following object is masked from 'package:stats':
    
        filter
    
    Quitting from lines 58-64 (tidytree.Rmd) 
    Error: processing vignette 'tidytree.Rmd' failed with diagnostics:
    cannot coerce class '"phylo"' to a data.frame
    Execution halted
    ```


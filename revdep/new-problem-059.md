# treeio

Version: 1.4.3

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      11: as_tibble(x, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/deprecated.R:42
      12: as_tibble.default(x, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      13: as_tibble(as.data.frame(x), ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:230
      14: as.data.frame(x) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:230
      15: as.data.frame.default(x)
      16: stop(gettextf("cannot coerce class %s to a data.frame", sQuote(deparse(class(x))[1L])), 
             domain = NA)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 91 SKIPPED: 0 FAILED: 2
      1. Error: (unknown) (@test-conversion.R#4) 
      2. Error: (unknown) (@test-treedata-accessor.R#34) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    
    Attaching package: 'tidytree'
    
    The following object is masked from 'package:stats':
    
        filter
    
    Quitting from lines 467-478 (Importer.Rmd) 
    Error: processing vignette 'Importer.Rmd' failed with diagnostics:
    cannot coerce class 'structure("treedata", package = "tidytree")' to a data.frame
    Execution halted
    ```


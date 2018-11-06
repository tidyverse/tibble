# metacoder

Version: 0.3.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
                 stop(call. = FALSE, paste0("The following taxon IDs do not exist:\n", limited_print(invalid_ids, 
                     type = "silent")))
             }
             return(result)
         }) at /tmp/RtmpCv6Hba/R.INSTALLbb9a7e4db9b8/taxa/R/taxonomy--class.R:1256
      13: FUN(X[[i]], ...)
      14: stop(call. = FALSE, paste0("The following taxon IDs do not exist:\n", limited_print(invalid_ids, 
             type = "silent"))) at /tmp/RtmpCv6Hba/R.INSTALLbb9a7e4db9b8/taxa/R/taxonomy--class.R:1261
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 94 SKIPPED: 1 FAILED: 1
      1. Error: Converting to phyloseq (@test--parsers_and_writers.R#204) 
      
      Error: testthat unit tests failed
      Execution halted
    ```


# rhierbaps

Version: 1.1.0

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Warning in block_exec(params) :
      failed to tidy R code in chunk <unnamed-chunk-5>
    reason: Error in loadNamespace(name) : there is no package called 'formatR'
    
    Warning in block_exec(params) :
      failed to tidy R code in chunk <unnamed-chunk-6>
    reason: Error in loadNamespace(name) : there is no package called 'formatR'
    
    Warning in block_exec(params) :
      failed to tidy R code in chunk <unnamed-chunk-7>
    reason: Error in loadNamespace(name) : there is no package called 'formatR'
    
    Read 1 item
    Warning in block_exec(params) :
      failed to tidy R code in chunk <unnamed-chunk-8>
    reason: Error in loadNamespace(name) : there is no package called 'formatR'
    
    Quitting from lines 106-110 (introduction.Rmd) 
    Error: processing vignette 'introduction.Rmd' failed with diagnostics:
    cannot coerce class '"phylo"' to a data.frame
    Execution halted
    ```


# ggtree

Version: 1.12.7

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggtree-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: facet_plot
    > ### Title: facet_plot
    > ### Aliases: facet_plot
    > 
    > ### ** Examples
    > 
    > tr <- rtree(10)
    > dd = data.frame(id=tr$tip.label, value=abs(rnorm(10)))
    > p <- ggtree(tr)
    Error in as.data.frame.default(x) : 
      cannot coerce class ‘"phylo"’ to a data.frame
    Calls: ggtree ... as_tibble -> as.data.frame -> as.data.frame.default
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      15: stop(gettextf("cannot coerce class %s to a data.frame", sQuote(deparse(class(x))[1L])), 
             domain = NA)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 0 SKIPPED: 0 FAILED: 7
      1. Error: collapse tree to polytomy (@test-conversion.R#7) 
      2. Error: geom_balance gives proper errors if called on non-binary node (@test-geom_balance.R#12) 
      3. Error: geom_cladelabel support parsing expression (@test-geom_cladelabel.R#5) 
      4. Error: groupOTU (@test-group.R#7) 
      5. Error: groupClade (@test-group.R#28) 
      6. Error: dummy layer to set x axis limits of Tree panel (@test-xlim_expand.R#7) 
      7. Error: dummy layer to set x axis limits of data panel (@test-xlim_expand.R#22) 
      
      Error: testthat unit tests failed
      Execution halted
    ```


# clustree

Version: 0.2.2

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘clustree-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: clustree
    > ### Title: Plot a clustering tree
    > ### Aliases: clustree clustree.matrix clustree.data.frame
    > ###   clustree.SingleCellExperiment clustree.seurat
    > 
    > ### ** Examples
    > 
    > data(iris_clusts)
    > clustree(iris_clusts, prefix = "K")
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 11 SKIPPED: 0 FAILED: 20
      1. Error: node_colour aesthetic works (@test-aesthetics.R#6) 
      2. Error: static node_colour works (@test-aesthetics.R#19) 
      3. Error: node_size aesthetic works (@test-aesthetics.R#30) 
      4. Error: static node_size works (@test-aesthetics.R#43) 
      5. Error: node_alpha aesthetic works (@test-aesthetics.R#52) 
      6. Error: static node_size works (@test-aesthetics.R#65) 
      7. Error: all static works (@test-aesthetics.R#76) 
      8. Error: layout argument works (@test-aesthetics.R#82) 
      9. Error: data.frame interface works (@test-clustree-overlay.R#23) 
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
    Quitting from lines 77-78 (clustree.Rmd) 
    Error: processing vignette 'clustree.Rmd' failed with diagnostics:
    Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```


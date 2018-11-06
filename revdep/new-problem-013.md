# diffdf

Version: 1.0.1

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘diffdf-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: diffdf
    > ### Title: diffdf
    > ### Aliases: diffdf
    > 
    > ### ** Examples
    > 
    > x <- subset( iris,  -Species)
    Warning in Ops.factor(Species) : ‘-’ not meaningful for factors
    > x[1,2] <- 5
    > COMPARE <- diffdf( iris, x)
    Error: The `names` must have length 6, not 2.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 398 SKIPPED: 0 FAILED: 17
      1. Error: Check comparision of equal objects (@test-core.R#113) 
      2. Error: Unequal objects raise warnings (@test-core.R#141) 
      3. Error: Unequal object, checking numbers correct (@test-core.R#186) 
      4. Error: Differing modes error (@test-core.R#198) 
      5. Error: Differing classes error (@test-core.R#210) 
      6. Error: Illegal columns error (@test-core.R#242) 
      7. Error: Additional columns error (@test-core.R#262) 
      8. Error: Additional rows error (@test-core.R#278) 
      9. Error: Objets with differing attributes produce the correct warning (@test-core.R#312) 
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
    Quitting from lines 29-50 (diffdf-basic.Rmd) 
    Error: processing vignette 'diffdf-basic.Rmd' failed with diagnostics:
    The `names` must have length 12, not 2.
    Execution halted
    ```


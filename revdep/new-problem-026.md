# naniar

Version: 0.4.0.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘naniar-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_label_shadow
    > ### Title: Add a column describing whether there is a shadow
    > ### Aliases: add_label_shadow
    > 
    > ### ** Examples
    > 
    > 
    > airquality %>%
    +   add_shadow(Ozone, Solar.R) %>%
    +   add_label_shadow()
    Error: Must pass a scalar integer as `nrow` argument to `new_tibble()`.
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Quitting from lines 78-87 (exploring-imputed-values.Rmd) 
    Error: processing vignette 'exploring-imputed-values.Rmd' failed with diagnostics:
    Must pass a scalar integer as `nrow` argument to `new_tibble()`.
    Execution halted
    ```


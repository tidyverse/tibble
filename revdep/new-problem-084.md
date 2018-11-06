# rrr

Version: 1.0.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rrr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: pairwise_plot
    > ### Title: Pairwise Plots
    > ### Aliases: pairwise_plot
    > 
    > ### ** Examples
    > 
    > data(pendigits)
    > digits_features <- pendigits[,1:34]
    > digits_class <- pendigits[,35]
    > pairwise_plot(digits_features, digits_class, type = "pca", pair_x = 1, pair_y = 3)
    Error: Columns 1, 2, 3, 4, 5, … (and 29 more) must be named.
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Quitting from lines 241-242 (rrr.Rmd) 
    Error: processing vignette 'rrr.Rmd' failed with diagnostics:
    Columns 1, 2, 3, 4, 5, … (and 20 more) must be named.
    Execution halted
    ```


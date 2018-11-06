# psychmeta

Version: 2.2.1

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The error most likely occurred in:
    
    > ### Name: create_ad_tibble
    > ### Title: Create a tibble of artifact distributions by construct
    > ### Aliases: create_ad_tibble create_ad_list
    > 
    > ### ** Examples
    > 
    > ## Examples to create Taylor series artifact distributions:
    > # Overall artifact distributions (not pairwise, not moderated)
    > create_ad_tibble(ad_type = "tsa",
    +                  n = n, rxx = rxxi, ryy = ryyi,
    +                  construct_x = x_name, construct_y = y_name,
    +                  sample_id = sample_id, moderators = moderator,
    +                  data = data_r_meas_multi,
    +                  control = control_psychmeta(pairwise_ads = FALSE,
    +                                              moderated_ads = FALSE))
    Tibble of artifact distributions 
    ---------------------------------------------------------------------- 
    # A tibble: 3 x 3
      construct_x analysis_type ad_x        
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Quitting from lines 478-486 (overview.Rmd) 
    Error: processing vignette 'overview.Rmd' failed with diagnostics:
    Columns 1, 2, 3 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```


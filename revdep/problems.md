# bcRP

<details>

* Version: 1.0.1
* GitHub: https://github.com/JulioCollazos64/bcRP
* Source code: https://github.com/cran/bcRP
* Date/Publication: 2025-07-22 12:10:12 UTC
* Number of recursive dependencies: 46

Run `revdepcheck::cloud_details(, "bcRP")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘bcRP-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_bcrp_data
    > ### Title: Perform an API request to BCRPData
    > ### Aliases: get_bcrp_data
    > 
    > ### ** Examples
    > 
    > codes <- c("PN00009MM", "PN00002MM", "PN01270PM", "PD39557DA")
    > # Will get you the most recent data for these codes
    > # as you have not provided the `from` and `to` arguments.
    > get_bcrp_data(codes = codes)
    # A tibble: 92 × 4
       name     values            series_name                                  code 
       <chr>    <chr>             <chr>                                        <chr>
     1 Dic.2023 -10753.996433     Cuentas monetarias de las sociedades creado… PN00…
     2 Ene.2024 -7372.69594999999 Cuentas monetarias de las sociedades creado… PN00…
     3 Feb.2024 -4352.91922600001 Cuentas monetarias de las sociedades creado… PN00…
     4 Mar.2024 -6059.647797      Cuentas monetarias de las sociedades creado… PN00…
     5 Abr.2024 -7011.29944       Cuentas monetarias de las sociedades creado… PN00…
     6 May.2024 -5719.920519      Cuentas monetarias de las sociedades creado… PN00…
     7 Jun.2024 -4412.965822      Cuentas monetarias de las sociedades creado… PN00…
     8 Jul.2024 3762.929587       Cuentas monetarias de las sociedades creado… PN00…
     9 Ago.2024 3643.75504        Cuentas monetarias de las sociedades creado… PN00…
    10 Sep.2024 7335.179755       Cuentas monetarias de las sociedades creado… PN00…
    # ℹ 82 more rows
    > 
    > # You can also provide the range of dates
    > # through the `from` and `to` arguments.
    > get_bcrp_data(codes = codes, from = "2015-01", to = "2020-01")
    Error in perform_req_strategy(requests = list_of_requests, strategy = request_strategy) : 
      Error(s) at: PD39557DA
    Calls: get_bcrp_data -> perform_req_strategy
    Execution halted
    ```

# myTAI

<details>

* Version: 2.3.4
* GitHub: https://github.com/drostlab/myTAI
* Source code: https://github.com/cran/myTAI
* Date/Publication: 2025-11-11 11:10:02 UTC
* Number of recursive dependencies: 249

Run `revdepcheck::cloud_details(, "myTAI")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘myTAI.Rmd’ using rmarkdown
    --- finished re-building ‘myTAI.Rmd’
    
    --- re-building ‘other-strata.Rmd’ using rmarkdown
    --- finished re-building ‘other-strata.Rmd’
    
    --- re-building ‘phylo-expression-object.Rmd’ using rmarkdown
    Performing log-normalization
    0%   10   20   30   40   50   60   70   80   90   100%
    [----|----|----|----|----|----|----|----|----|----|
    **************************************************|
    Calculating gene variances
    0%   10   20   30   40   50   60   70   80   90   100%
    [----|----|----|----|----|----|----|----|----|----|
    **************************************************|
    Calculating feature variances of standardized and clipped values
    0%   10   20   30   40   50   60   70   80   90   100%
    [----|----|----|----|----|----|----|----|----|----|
    **************************************************|
    
      |                                                                            
      |                                                                      |   0%
      |                                                                            
      |======================================================================| 100%
    0%   10   20   30   40   50   60   70   80   90   100%
    [----|----|----|----|----|----|----|----|----|----|
    **************************************************|
    --- finished re-building ‘phylo-expression-object.Rmd’
    
    --- re-building ‘phylostratigraphy.Rmd’ using rmarkdown
    --- finished re-building ‘phylostratigraphy.Rmd’
    
    --- re-building ‘tai-breaker.Rmd’ using rmarkdown
    --- finished re-building ‘tai-breaker.Rmd’
    
    --- re-building ‘tai-gallery.Rmd’ using rmarkdown
    --- finished re-building ‘tai-gallery.Rmd’
    
    --- re-building ‘tai-stats.Rmd’ using rmarkdown
    --- finished re-building ‘tai-stats.Rmd’
    
    --- re-building ‘tai-transform.Rmd’ using rmarkdown
    --- finished re-building ‘tai-transform.Rmd’
    
    --- re-building ‘taxonomy.Rmd’ using rmarkdown
    
    Quitting from taxonomy.Rmd:286-290 [unnamed-chunk-11]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    <error/rlang_error>
    Error in `names(output) <- c("childtaxa_id", "childtaxa_name", "childtaxa_rank")`:
    ! 'names' attribute [3] must be the same length as the vector [0]
    ---
    Backtrace:
        ▆
     1. └─global taxonomy(organism = "Arabidopsis", db = "ncbi", output = "children")
     2.   ├─base::as.data.frame(taxize::children(organism, db = db)[[1]])
     3.   ├─taxize::children(organism, db = db)
     4.   └─taxize:::children.default(organism, db = db)
     5.     └─taxize::ncbi_children(name = sci_id, ...)
     6.       └─taxize (local) single_search(name[[i]], ancestor[[i]], ...)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    Error: processing vignette 'taxonomy.Rmd' failed with diagnostics:
    'names' attribute [3] must be the same length as the vector [0]
    --- failed re-building ‘taxonomy.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘taxonomy.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 13.4Mb
      sub-directories of 1Mb or more:
        data   2.0Mb
        doc    6.1Mb
        libs   4.4Mb
    ```

# stevedata

<details>

* Version: 1.8.0
* GitHub: https://github.com/svmiller/stevedata
* Source code: https://github.com/cran/stevedata
* Date/Publication: 2025-11-12 10:20:02 UTC
* Number of recursive dependencies: 46

Run `revdepcheck::cloud_details(, "stevedata")` for more info

</details>

## Newly broken

*   checking installed package size ... NOTE
    ```
      installed size is  6.4Mb
      sub-directories of 1Mb or more:
        data   6.0Mb
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1035 marked UTF-8 strings
    ```


# bibliometrix

<details>

* Version: 4.1.1
* GitHub: https://github.com/massimoaria/bibliometrix
* Source code: https://github.com/cran/bibliometrix
* Date/Publication: 2023-02-09 20:40:07 UTC
* Number of recursive dependencies: 162

Run `revdepcheck::cloud_details(, "bibliometrix")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘bibliometrix-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: summary.bibliometrix
    > ### Title: Summarizing bibliometric analysis results
    > ### Aliases: summary.bibliometrix
    > 
    > ### ** Examples
    > 
    > data(scientometrics, package = "bibliometrixData")
    ...
        ▆
     1. ├─base::summary(results)
     2. ├─bibliometrix:::summary.bibliometrix(results)
     3. │ └─... %>% as.data.frame(.data, stringasfactor = FALSE)
     4. ├─base::as.data.frame(., .data, stringasfactor = FALSE)
     5. └─tibble:::as.data.frame.tbl_df(., .data, stringasfactor = FALSE)
     6.   └─tibble:::abort_character_rownames()
     7.     └─tibble:::tibble_abort("`row.names` must be a character vector.")
     8.       └─rlang::abort(x, class, ..., call = call, parent = parent, use_cli_format = TRUE)
    Execution halted
    ```

# ggdag

<details>

* Version: 0.2.7
* GitHub: https://github.com/malcolmbarrett/ggdag
* Source code: https://github.com/cran/ggdag
* Date/Publication: 2022-10-29 21:10:13 UTC
* Number of recursive dependencies: 101

Run `revdepcheck::cloud_details(, "ggdag")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggdag-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: Equivalent DAGs and Classes
    > ### Title: Generating Equivalent Models
    > ### Aliases: 'Equivalent DAGs and Classes' node_equivalent_dags
    > ###   ggdag_equivalent_dags node_equivalent_class ggdag_equivalent_class
    > 
    > ### ** Examples
    > 
    ...
     13. │     └─ggdag (local) .f(.x[[i]], ...)
     14. │       ├─base::as.data.frame(tidy_dagitty(.dagitty = .x))
     15. │       └─ggdag:::as.data.frame.tidy_dagitty(tidy_dagitty(.dagitty = .x))
     16. │         ├─base::as.data.frame(x$data, row.names, optional, ...)
     17. │         └─tibble:::as.data.frame.tbl_df(x$data, row.names, optional, ...)
     18. └─base::.handleSimpleError(...)
     19.   └─purrr (local) h(simpleError(msg, call))
     20.     └─cli::cli_abort(...)
     21.       └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      • quick_plots/ggdag-confounder-triangle-is-triangle.svg
      • relations/ggdag-ancestors-identifies-v-w1-and-z1.svg
      • relations/ggdag-descendants-identifies-y-x-and-z1.svg
      • relations/ggdag-parents-identifies-z2-x-w1-and-w2.svg
      • themes/theme-dag-gray-grid.svg
      • themes/theme-dag-gray.svg
      • themes/theme-dag-grid.svg
      Error: Test failures
      In addition: Warning message:
      In dplyr::left_join(tidy_dag, ., by = c(name = "v")) :
        Each row in `x` is expected to match at most 1 row in `y`.
      ℹ Row 1 of `x` matches multiple rows.
      ℹ If multiple matches are expected, set `multiple = "all"` to silence this
        warning.
      Execution halted
    ```

# ggESDA

<details>

* Version: 0.2.0
* GitHub: https://github.com/kiangkiangkiang/ggESDA
* Source code: https://github.com/cran/ggESDA
* Date/Publication: 2022-08-19 08:40:10 UTC
* Number of recursive dependencies: 208

Run `revdepcheck::cloud_details(, "ggESDA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggESDA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: Cardiological
    > ### Title: Cardiological data example
    > ### Aliases: Cardiological
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > data(Cardiological)
    > ggInterval_index(Cardiological, aes(x = Syst))
    Error in get(x, envir = ns, inherits = FALSE) : 
      object 'tbl_subset_col' not found
    Calls: ggInterval_index ... as.data.frame -> [ -> [.symbolic_tbl -> getFromNamespace -> get
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘ggESDA.Rmd’ using rmarkdown
    Quitting from lines 47-57 (ggESDA.Rmd) 
    Error: processing vignette 'ggESDA.Rmd' failed with diagnostics:
    object 'tbl_subset_col' not found
    --- failed re-building ‘ggESDA.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘ggESDA.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# PUMP

<details>

* Version: 1.0.1
* GitHub: https://github.com/MDRCNY/PUMP
* Source code: https://github.com/cran/PUMP
* Date/Publication: 2022-09-17 20:06:16 UTC
* Number of recursive dependencies: 129

Run `revdepcheck::cloud_details(, "PUMP")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘PUMP-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot.pumpresult
    > ### Title: Plot a pumpresult object (result function)
    > ### Aliases: plot.pumpresult
    > 
    > ### ** Examples
    > 
    > pp1 <- pump_power(d_m = "d2.2_m2rc", MTP = 'HO',
    ...
     1. ├─base::plot(pp1)
     2. ├─PUMP:::plot.pumpresult(pp1)
     3. │ └─plot.data %>% as.data.frame(plot.data) %>% ...
     4. ├─dplyr::filter(., !is.na(.data$power))
     5. ├─base::as.data.frame(., plot.data)
     6. └─tibble:::as.data.frame.tbl_df(., plot.data)
     7.   └─tibble:::abort_character_rownames()
     8.     └─tibble:::tibble_abort("`row.names` must be a character vector.")
     9.       └─rlang::abort(x, class, ..., call = call, parent = parent, use_cli_format = TRUE)
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘pump_demo.Rmd’ using rmarkdown
    Quitting from lines 570-580 (pump_demo.Rmd) 
    Error: processing vignette 'pump_demo.Rmd' failed with diagnostics:
    `row.names` must be a character vector.
    --- failed re-building ‘pump_demo.Rmd’
    
    --- re-building ‘pump_sample_demo.Rmd’ using rmarkdown
    --- finished re-building ‘pump_sample_demo.Rmd’
    
    --- re-building ‘pump_simulate.Rmd’ using rmarkdown
    --- finished re-building ‘pump_simulate.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘pump_demo.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# RSDA

<details>

* Version: 3.0.13
* GitHub: NA
* Source code: https://github.com/cran/RSDA
* Date/Publication: 2022-07-16 07:30:37 UTC
* Number of recursive dependencies: 151

Run `revdepcheck::cloud_details(, "RSDA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘RSDA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: abalone
    > ### Title: SODAS XML data file.
    > ### Aliases: abalone
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > data(abalone)
    > res <- sym.pca(abalone, 'centers')
    Error in get(x, envir = ns, inherits = FALSE) : 
      object 'tbl_subset_col' not found
    Calls: sym.pca ... %in% -> [ -> [.symbolic_tbl -> getFromNamespace -> get
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘introduction.Rmd’ using rmarkdown
    Quitting from lines 60-64 (introduction.Rmd) 
    Error: processing vignette 'introduction.Rmd' failed with diagnostics:
    object 'tbl_subset_col' not found
    --- failed re-building ‘introduction.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘introduction.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```


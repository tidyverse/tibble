# inspectdf

<details>

* Version: 0.0.11
* GitHub: https://github.com/alastairrushworth/inspectdf
* Source code: https://github.com/cran/inspectdf
* Date/Publication: 2021-04-02 12:00:02 UTC
* Number of recursive dependencies: 0

Run `cloud_details(, "inspectdf")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘inspectdf-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: inspect_cat
    > ### Title: Summary and comparison of the levels in categorical columns
    > ### Aliases: inspect_cat
    > 
    > ### ** Examples
    > 
    > # Load dplyr for starwars data & pipe
    ...
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > 
    > # Single dataframe summary
    > inspect_cat(starwars)
    Error: Repaired names have length 1 instead of length 2.
    Execution halted
    ```


# keyholder

Version: 0.1.2

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘keyholder-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: keys-set
    > ### Title: Set keys
    > ### Aliases: keys-set keys<- assign_keys key_by unkey
    > 
    > ### ** Examples
    > 
    > df <- dplyr::as_tibble(mtcars)
    > 
    > # Value is converted to tibble
    > keys(df) <- 1:nrow(df)
    Error: Columns 1, 2, 3, 4, 5, … (and 27 more) must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 302 SKIPPED: 0 FAILED: 18
      1. Error: has_keys works (@test-keys-get.R#39) 
      2. Failure: restore_keys.default works (@test-keys-manip.R#44) 
      3. Failure: restore_keys.default works (@test-keys-manip.R#54) 
      4. Failure: restore_keys.default handles .remove and .unkey arguments (@test-keys-manip.R#65) 
      5. Failure: restore_keys.default handles .remove and .unkey arguments (@test-keys-manip.R#72) 
      6. Failure: restore_keys.default handles .remove and .unkey arguments (@test-keys-manip.R#80) 
      7. Failure: restore_keys.default handles .remove and .unkey arguments (@test-keys-manip.R#85) 
      8. Error: `keys<-` converts value to tibble (@test-keys-set.R#19) 
      9. Failure: `keys<-` throws an error (@test-keys-set.R#33) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```


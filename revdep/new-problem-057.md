# phenopath

Version: 1.4.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘phenopath-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: clvm
    > ### Title: Fit a CLVM Model
    > ### Aliases: clvm
    > 
    > ### ** Examples
    > 
    > sim <- simulate_phenopath()
    Error: Columns 1, 2, 3 must be named.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(phenopath)
      > 
      > test_check("phenopath")
      Error: Columns 1, 2, 3 must be named.
      Execution halted
    ```


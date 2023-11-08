# NMdata

<details>

* Version: 0.1.2
* GitHub: https://github.com/philipdelff/NMdata
* Source code: https://github.com/cran/NMdata
* Date/Publication: 2023-10-19 07:10:09 UTC
* Number of recursive dependencies: 84

Run `revdepcheck::cloud_details(, "NMdata")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(NMdata)
      NMdata 0.1.2. Browse NMdata documentation at
      https://philipdelff.github.io/NMdata/
      > 
      > test_check("NMdata")
    ...
      Attributes: < Component 2: names for current but not for target >
      ...
      Backtrace:
          ▆
       1. └─testthat::expect_equal_to_reference(res1, fileRef, version = 2) at test_NMscanData.R:449:4
       2.   └─testthat::expect_known_value(..., update = update)
      
      [ FAIL 1 | WARN 0 | SKIP 1 | PASS 255 ]
      Error: Test failures
      Execution halted
    ```


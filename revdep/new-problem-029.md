# nullabor

Version: 0.3.5

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Aliases: null_ts
    > 
    > ### ** Examples
    > 
    > require(forecast)
    Loading required package: forecast
    > require(tidyverse)
    Loading required package: tidyverse
    ── Attaching packages ─────────────────────────────────────── tidyverse 1.2.1 ──
    ✔ ggplot2 3.1.0           ✔ purrr   0.2.5      
    ✔ tibble  1.4.99.9005     ✔ dplyr   0.7.7      
    ✔ tidyr   0.8.2           ✔ stringr 1.3.1      
    ✔ readr   1.1.1           ✔ forcats 0.3.0      
    ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ✖ dplyr::filter() masks stats::filter()
    ✖ dplyr::lag()    masks stats::lag()
    > data(aud)
    > l <- lineup(null_ts("rate", auto.arima), aud)
    Error: Column 1 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```


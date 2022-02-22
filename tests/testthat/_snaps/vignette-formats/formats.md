---
title: "Column formats"
output: rmarkdown::html_vignette
always_allow_html: true
vignette: >
  %\VignetteIndexEntry{Column formats}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---




```r
library(tibble)
```

## Overview

This vignette shows how to decorate columns for custom formatting.
We use the formattable package for demonstration because it already contains useful vector classes that apply a custom formatting to numbers.


```r
library(formattable)

tbl <- tibble(x = digits(9:11, 3))
tbl
#> # A tibble: 3 x 1
#>   x         
#>   <formttbl>
#> 1 9.000     
#> 2 10.000    
#> 3 11.000
```



The `x` column in the tibble above is a regular number with a formatting method.
It always will be shown with three digits after the decimal point.
This also applies to columns derived from `x`.


```r
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:tibble':
#> 
#>     collapse, dim_desc
#> The following object is masked from 'package:testthat':
#> 
#>     matches
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
tbl2 <- 
  tbl %>%
  mutate(
    y = x + 1, 
    z = x * x, 
    v = y + z,
    lag = lag(x, default = x[[1]]),
    sin = sin(x),
    mean = mean(v),
    var = var(x)
  )

tbl2
#> # A tibble: 3 x 8
#>   x          y          z          v          lag        sin       mean      var
#>   <formttbl> <formttbl> <formttbl> <formttbl> <formttbl> <formttb> <formt> <dbl>
#> 1 9.000      10.000     81.000     91.000     9.000      0.412     111.667     1
#> 2 10.000     11.000     100.000    111.000    9.000      -0.544    111.667     1
#> 3 11.000     12.000     121.000    133.000    10.000     -1.000    111.667     1
```

Summaries also maintain the formatting.


```r
tbl2 %>% 
  group_by(lag) %>% 
  summarize(z = mean(z)) %>% 
  ungroup()
#> # A tibble: 2 x 2
#>   lag        z         
#>   <formttbl> <formttbl>
#> 1 9.000      90.500    
#> 2 10.000     121.000
```

Same for pivoting operations.



```r
library(tidyr)
#> 
#> Attaching package: 'tidyr'
#> The following object is masked from 'package:testthat':
#> 
#>     matches

stocks <- 
  expand_grid(id = factor(1:4), year = 2018:2022) %>% 
  mutate(stock = currency(runif(20) * 10000))

stocks %>% 
  pivot_wider(id, names_from = year, values_from = stock)
#> # A tibble: 4 x 6
#>   id    `2018`     `2019`     `2020`     `2021`     `2022`    
#>   <fct> <formttbl> <formttbl> <formttbl> <formttbl> <formttbl>
#> 1 1     $4,197.73  $7,414.63  $5,507.74  $9,256.42  $6,599.49 
#> 2 2     $4,393.70  $9,315.85  $1,076.86  $9,781.00  $8,681.69 
#> 3 3     $4,058.69  $460.28    $3,214.04  $927.91    $453.61   
#> 4 4     $6,247.89  $6,507.82  $3,578.43  $198.98    $4,518.97
```

For ggplot2 we need to do [some work](https://github.com/tidyverse/ggplot2/pull/4065) to show apply the formatting to the scales.


```r
library(ggplot2)

# Needs https://github.com/tidyverse/ggplot2/pull/4065 or similar
stocks %>% 
  ggplot(aes(x = year, y = stock, color = id)) +
  geom_line()
```

![](${TEMP}/formats_files/figure-markdown_strict/unnamed-chunk-7-1.png)

It pays off to specify formatting very early in the process.
The diagram below shows the principal stages of data analysis and exploration from "R for data science".

![](${TEMP}/formats_files/figure-markdown_strict/unnamed-chunk-8-1.png)

The subsequent diagram adds data formats, communication options, and explicit data formatting.
The original r4ds transitions are highlighted in bold.
There are two principal options where to apply formatting for results: right before communicating them, or right after importing.

![](${TEMP}/formats_files/figure-markdown_strict/unnamed-chunk-9-1.png)

Applying formatting early in the process gives the added benefit of showing the data in a useful format during the "Tidy", "Transform", and "Visualize" stages.
For this to be useful, we need to ensure that the formatting options applied early:

- give a good user experience for analysis
    - are easy to set up
    - keep sticky in the process of data analysis and exploration
    - support the analyst in asking the right questions about the data
    - convey the critical information at a glance, with support to go into greater detail easier
- look good for communication
    - are applied in the various communication options
    - support everything necessary to present the data in the desired way

Ensuring stickiness is difficult, and is insufficient for a dbplyr workflow where parts of the "Tidy", "Transform" or even "Visualize" stages are run on the database.
Often it's possible to derive a rule-based approach for formatting.


```r
tbl3 <- 
  tibble(id = letters[1:3], x = 9:11) %>% 
  mutate(
    y = x + 1, 
    z = x * x, 
    v = y + z,
    lag = lag(x, default = x[[1]]),
    sin = sin(x),
    mean = mean(v),
    var = var(x)
  )

tbl3
#> # A tibble: 3 x 9
#>   id        x     y     z     v   lag    sin  mean   var
#>   <chr> <int> <dbl> <int> <dbl> <int>  <dbl> <dbl> <dbl>
#> 1 a         9    10    81    91     9  0.412  112.     1
#> 2 b        10    11   100   111     9 -0.544  112.     1
#> 3 c        11    12   121   133    10 -1.00   112.     1

tbl3 %>% 
  mutate(
    across(where(is.numeric), digits, 3),
    across(where(~ is.numeric(.x) && mean(.x) > 50), digits, 1)
  )
#> # A tibble: 3 x 9
#>   id    x          y          z          v          lag       sin    mean  var  
#>   <chr> <formttbl> <formttbl> <formttbl> <formttbl> <formttb> <form> <for> <for>
#> 1 a     9.000      10.000     81.0       91.0       9.000     0.412  111.7 1.000
#> 2 b     10.000     11.000     100.0      111.0      9.000     -0.544 111.7 1.000
#> 3 c     11.000     12.000     121.0      133.0      10.000    -1.000 111.7 1.000
```

These rules can be stored in `quos()`:


```r
rules <- quos(
  across(where(is.numeric), digits, 3),
  across(where(~ is.numeric(.x) && mean(.x) > 50), digits, 1)
)

tbl3 %>% 
  mutate(!!!rules)
#> # A tibble: 3 x 9
#>   id    x          y          z          v          lag       sin    mean  var  
#>   <chr> <formttbl> <formttbl> <formttbl> <formttbl> <formttb> <form> <for> <for>
#> 1 a     9.000      10.000     81.0       91.0       9.000     0.412  111.7 1.000
#> 2 b     10.000     11.000     100.0      111.0      9.000     -0.544 111.7 1.000
#> 3 c     11.000     12.000     121.0      133.0      10.000    -1.000 111.7 1.000
```

This poses a few drawbacks:

- The syntax is repetitive and not very intuitive
- Rules that match multiple columns must be given in reverse order due to the way `mutate()` works, and are executed multiple times

What would a good API for rule-based formatting look like?

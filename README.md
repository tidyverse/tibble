
<!-- README.md is generated from README.Rmd. Please edit that file -->
tibble
======

[![Build Status](https://travis-ci.org/tidyverse/tibble.svg?branch=master)](https://travis-ci.org/tidyverse/tibble) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/tidyverse/tibble?branch=master&svg=true)](https://ci.appveyor.com/project/tidyverse/tibble) [![Coverage Status](https://img.shields.io/codecov/c/github/tidyverse/tibble/master.svg)](https://codecov.io/github/tidyverse/tibble?branch=master) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/tibble)](https://cran.r-project.org/package=tibble)

tibble implements a modern reimagining of the data.frame, keeping what time has proven to be effective, and throwing out what is not. It extracts these basic ideas out of [dplyr](https://cran.r-project.org/package=dplyr), which is now more clearly focused on data manipulation. tibble provides a lighter-weight package for the basic care and feeding of `tbl_df`'s, aka "tibble diffs" or just "tibbles". Tibbles are data.frames with nicer behavior around printing, subsetting, and factor handling.

Creating tibbles
----------------

You can create a tibble from an existing object with `as_tibble()`:

``` r
library(tibble)
as_tibble(iris)
#> # A tibble: 150 × 5
#>    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#>           <dbl>       <dbl>        <dbl>       <dbl>  <fctr>
#> 1           5.1         3.5          1.4         0.2  setosa
#> 2           4.9         3.0          1.4         0.2  setosa
#> 3           4.7         3.2          1.3         0.2  setosa
#> 4           4.6         3.1          1.5         0.2  setosa
#> 5           5.0         3.6          1.4         0.2  setosa
#> 6           5.4         3.9          1.7         0.4  setosa
#> 7           4.6         3.4          1.4         0.3  setosa
#> 8           5.0         3.4          1.5         0.2  setosa
#> 9           4.4         2.9          1.4         0.2  setosa
#> 10          4.9         3.1          1.5         0.1  setosa
#> # ... with 140 more rows
```

This will work for reasonable inputs that are already data.frame, list, matrix, or table.

You can also create a new tibble from vectors that represent the columns with `tibble()`:

``` r
tibble(x = 1:5, y = 1, z = x ^ 2 + y)
#> # A tibble: 5 × 3
#>       x     y     z
#>   <int> <dbl> <dbl>
#> 1     1     1     2
#> 2     2     1     5
#> 3     3     1    10
#> 4     4     1    17
#> 5     5     1    26
```

`tibble()` does much less than `data.frame()`: it never changes the type of the inputs (e.g. it never converts strings to factors!), it never changes the names of variables, and it never creates `row.names()`. You can read more about these features in the vignette, `vignette("tibble")`.

You can define a tibble row-by-row with `tribble()`:

``` r
tribble(
  ~x, ~y,  ~z,
  "a", 2,  3.6,
  "b", 1,  8.5
)
#> # A tibble: 2 × 3
#>       x     y     z
#>   <chr> <dbl> <dbl>
#> 1     a     2   3.6
#> 2     b     1   8.5
```

You can see why this variant of the data.frame is called a "tibble diff" from its class:

``` r
class(as_tibble(iris))
#> [1] "tbl_df"     "tbl"        "data.frame"
```

Tibbles vs data frames
----------------------

There are two main differences in the usage of a data frame vs a tibble: printing, and subsetting.

Tibbles have a refined print method that shows only the first 10 rows, and all the columns that fit on screen. This makes it much easier to work with large data. In addition to its name, each column reports its type, a nice feature borrowed from `str()`:

``` r
library(nycflights13)
flights
#> # A tibble: 336,776 × 19
#>     year month   day dep_time sched_dep_time dep_delay arr_time
#>    <int> <int> <int>    <int>          <int>     <dbl>    <int>
#> 1   2013     1     1      517            515         2      830
#> 2   2013     1     1      533            529         4      850
#> 3   2013     1     1      542            540         2      923
#> 4   2013     1     1      544            545        -1     1004
#> 5   2013     1     1      554            600        -6      812
#> 6   2013     1     1      554            558        -4      740
#> 7   2013     1     1      555            600        -5      913
#> 8   2013     1     1      557            600        -3      709
#> 9   2013     1     1      557            600        -3      838
#> 10  2013     1     1      558            600        -2      753
#> # ... with 336,766 more rows, and 12 more variables: sched_arr_time <int>,
#> #   arr_delay <dbl>, carrier <chr>, flight <int>, tailnum <chr>,
#> #   origin <chr>, dest <chr>, air_time <dbl>, distance <dbl>, hour <dbl>,
#> #   minute <dbl>, time_hour <dttm>
```

Tibbles are strict about subsetting. If you try to access a variable that does not exist via `$`, you'll get a warning:

``` r
flights$yea
#> Warning: Unknown column 'yea'
#> NULL
```

Tibbles also clearly delineate `[` and `[[`: `[` always returns another tibble, `[[` always returns a vector. No more `drop = FALSE`!

``` r
class(iris[ , 1])
#> [1] "numeric"
class(iris[ , 1, drop = FALSE])
#> [1] "data.frame"
class(as_tibble(iris)[ , 1])
#> [1] "tbl_df"     "tbl"        "data.frame"
```

Installation
------------

tibble is on CRAN, install using:

``` r
install.packages("tibble")
```

You can try out the dev version with:

``` r
# install.packages("devtools")
devtools::install_github("tidyverse/tibble")
```

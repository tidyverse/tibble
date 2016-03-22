
<!-- README.md is generated from README.Rmd. Please edit that file -->
tibble
======

[![Build Status](https://travis-ci.org/hadley/tibble.svg?branch=master)](https://travis-ci.org/hadley/tibble) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/hadley/tibble?branch=master&svg=true)](https://ci.appveyor.com/project/hadley/tibble) [![Coverage Status](https://img.shields.io/codecov/c/github/hadley/tibble/master.svg)](https://codecov.io/github/hadley/tibble?branch=master) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/tibble)](https://cran.r-project.org/package=tibble)

tibble implements a modern reimagining of the data.frame, keeping what time has proven to be effective, and throwing out what is not. It extracts these basic ideas out of [dplyr](https://cran.r-project.org/package=dplyr), which is now more clearly focused on data manipulation. tibble provides a lighter-weight package for the basic care and feeding of `tbl_df`'s, aka "tibble diffs" or just "tibbles". Tibbles are data.frames with nicer behavior around printing, subsetting, and factor handling.

Creating tibbles
----------------

You can create a tibble from an existing object with `as_data_frame()`:

``` r
library(tibble)
as_data_frame(iris)
#> Source: local data frame [150 x 5]
#> 
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
#> ..          ...         ...          ...         ...     ...
```

This will work for reasonable inputs that are already data.frame, list, matrix, or table.

You can also create a new tibble from vectors that represent the columns with `data_frame()`:

``` r
data_frame(x = 1:5, y = 1, z = x ^ 2 + y)
#> Source: local data frame [5 x 3]
#> 
#>       x     y     z
#>   <int> <dbl> <dbl>
#> 1     1     1     2
#> 2     2     1     5
#> 3     3     1    10
#> 4     4     1    17
#> 5     5     1    26
```

`data_frame()` does much less than `data.frame()`: it never changes the type of the inputs (e.g. it never converts strings to factors!), it never changes the names of variables, and it never creates `row.names()`. You can read more about these features in the vignette, `vignette("tibble")`.

You can define a tibble row-by-row with `frame_data()`:

``` r
frame_data(
  ~x, ~y,  ~z,
  "a", 2,  3.6,
  "b", 1,  8.5
)
#> Source: local data frame [2 x 3]
#> 
#>       x     y     z
#>   <chr> <dbl> <dbl>
#> 1     a     2   3.6
#> 2     b     1   8.5
```

You can see why this variant of the data.frame is called a "tibble diff" from its class:

``` r
class(as_data_frame(iris))
#> [1] "tbl_df"     "tbl"        "data.frame"
```

Tibbles vs data frames
----------------------

There are two main differences in the usage of a data frame vs a tibble: printing, and subsetting.

Tibbles have a refined print method that shows only the first 10 rows, and all the columns that fit on screen. This makes it much easier to work with large data. In addition to its name, each column reports its type, a nice feature borrowed from `str()`:

``` r
library(nycflights13)
flights
#> Source: local data frame [336,776 x 16]
#> 
#>     year month   day dep_time dep_delay arr_time arr_delay carrier tailnum
#>    <int> <int> <int>    <int>     <dbl>    <int>     <dbl>   <chr>   <chr>
#> 1   2013     1     1      517         2      830        11      UA  N14228
#> 2   2013     1     1      533         4      850        20      UA  N24211
#> 3   2013     1     1      542         2      923        33      AA  N619AA
#> 4   2013     1     1      544        -1     1004       -18      B6  N804JB
#> 5   2013     1     1      554        -6      812       -25      DL  N668DN
#> 6   2013     1     1      554        -4      740        12      UA  N39463
#> 7   2013     1     1      555        -5      913        19      B6  N516JB
#> 8   2013     1     1      557        -3      709       -14      EV  N829AS
#> 9   2013     1     1      557        -3      838        -8      B6  N593JB
#> 10  2013     1     1      558        -2      753         8      AA  N3ALAA
#> ..   ...   ...   ...      ...       ...      ...       ...     ...     ...
#> Variables not shown: flight <int>, origin <chr>, dest <chr>, air_time
#>   <dbl>, distance <dbl>, hour <dbl>, minute <dbl>.
```

Tibbles are strict about subsetting. If you try to access a variable that does not exist, you'll get an error:

``` r
flights$yea
#> Error: Unknown column 'yea'
```

Tibbles also clearly delineate `[` and `[[`: `[` always returns another tibble, `[[` always returns a vector. No more `drop = FALSE`!

``` r
class(iris[ , 1])
#> [1] "numeric"
class(iris[ , 1, drop = FALSE])
#> [1] "data.frame"
class(as_data_frame(iris)[ , 1])
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
devtools::install_github("hadley/tibble")
```

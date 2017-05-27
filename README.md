
<!-- README.md is generated from README.Rmd. Please edit that file -->
tibble <img src="man/figures/logo.png" align="right" />
=======================================================

[![Build Status](https://travis-ci.org/tidyverse/tibble.svg?branch=master)](https://travis-ci.org/tidyverse/tibble) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/tidyverse/tibble?branch=master&svg=true)](https://ci.appveyor.com/project/tidyverse/tibble) [![codecov](https://codecov.io/gh/krlmlr/bindrcpp/branch/master/graph/badge.svg)](https://codecov.io/gh/krlmlr/bindrcpp) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/tibble)](https://cran.r-project.org/package=tibble)

Overview
--------

A **tibble**, or `tbl_df`, is a modern reimagining of the data.frame, keeping what time has proven to be effective, and throwing out what is not. Tibbles are data.frames that are lazy and surly: they do less (i.e. they don't change variable names or types, and don't do partial matching) and complain more (e.g. when a variable does not exist). This forces you to confront problems earlier, typically leading to cleaner, more expressive code. Tibbles also have an enhanced `print method()` which makes them easier to use with large datasets containing complex objects.

If you are new to tibbles, the best place to start is the [tibbles](http://r4ds.had.co.nz/tibbles.html) in R for data science.

Installation
------------

``` r
# The easiest way to get tibble is to install the whole tidyverse:
install.packages("tidyverse")

# Alternatively, install just tibble:
install.packages("tibble")

# Or the the development version from GitHub:
# install.packages("devtools")
devtools::install_github("tidyverse/tibble")
```

Usage
-----

Create a tibble from an existing object with `as_tibble()`:

``` r
library(tibble)
as_tibble(iris)
#> # A tibble: 150 x 5
#>    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#>           <dbl>       <dbl>        <dbl>       <dbl>  <fctr>
#>  1          5.1         3.5          1.4         0.2  setosa
#>  2          4.9         3.0          1.4         0.2  setosa
#>  3          4.7         3.2          1.3         0.2  setosa
#>  4          4.6         3.1          1.5         0.2  setosa
#>  5          5.0         3.6          1.4         0.2  setosa
#>  6          5.4         3.9          1.7         0.4  setosa
#>  7          4.6         3.4          1.4         0.3  setosa
#>  8          5.0         3.4          1.5         0.2  setosa
#>  9          4.4         2.9          1.4         0.2  setosa
#> 10          4.9         3.1          1.5         0.1  setosa
#> # ... with 140 more rows
```

This will work for reasonable inputs that are already data.frames, lists, matrices, or tables.

You can also create a new tibble from column vectors with `tibble()`:

``` r
tibble(x = 1:5, y = 1, z = x ^ 2 + y)
#> # A tibble: 5 x 3
#>       x     y     z
#>   <int> <dbl> <dbl>
#> 1     1     1     2
#> 2     2     1     5
#> 3     3     1    10
#> 4     4     1    17
#> 5     5     1    26
```

`tibble()` does much less than `data.frame()`: it never changes the type of the inputs (e.g. it never converts strings to factors!), it never changes the names of variables, it only recycles inputs of length 1, and it never creates `row.names()`. You can read more about these features in the vignette, `vignette("tibble")`.

You can define a tibble row-by-row with `tribble()`:

``` r
tribble(
  ~x, ~y,  ~z,
  "a", 2,  3.6,
  "b", 1,  8.5
)
#> # A tibble: 2 x 3
#>       x     y     z
#>   <chr> <dbl> <dbl>
#> 1     a     2   3.6
#> 2     b     1   8.5
```

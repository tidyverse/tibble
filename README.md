
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tibble <img src="man/figures/logo.png" align="right" alt="Hexagonal logo for the R package ‘tibble’, styled with a sci-fi theme. The word ‘TIBBLE’ appears at the top in a futuristic font, and below it is a stylized table with colored bars resembling columns and rows, set against a starry space background." />

<!-- badges: start -->

[![R-CMD-check](https://github.com/tidyverse/tibble/workflows/rcc/badge.svg)](https://github.com/tidyverse/tibble/actions)
[![Codecov test
coverage](https://codecov.io/gh/tidyverse/tibble/branch/main/graph/badge.svg)](https://app.codecov.io/gh/tidyverse/tibble?branch=main)
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/tibble)](https://cran.r-project.org/package=tibble)
[![Life
cycle](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html)
<!-- badges: end -->

## Overview

A **tibble**, or `tbl_df`, is a modern reimagining of the data.frame,
keeping what time has proven to be effective, and throwing out what is
not. Tibbles are data.frames that are lazy and surly: they do less
(i.e. they don’t change variable names or types, and don’t do partial
matching) and complain more (e.g. when a variable does not exist). This
forces you to confront problems earlier, typically leading to cleaner,
more expressive code. Tibbles also have an enhanced `print()` method
which makes them easier to use with large datasets containing complex
objects.

If you are new to tibbles, the best place to start is the [tibbles
chapter](https://r4ds.had.co.nz/tibbles.html) in *R for data science*.

## Installation

``` r
# The easiest way to get tibble is to install the whole tidyverse:
install.packages("tidyverse")

# Alternatively, install just tibble:
install.packages("tibble")

# Or the the development version from GitHub:
# install.packages("pak")
pak::pak("tidyverse/tibble")
```

## Usage

``` r
library(tibble)
```

Create a tibble from an existing object with `as_tibble()`:

``` r
data <- data.frame(a = 1:3, b = letters[1:3], c = Sys.Date() - 1:3)
data
#>   a b          c
#> 1 1 a 2025-06-18
#> 2 2 b 2025-06-17
#> 3 3 c 2025-06-16

as_tibble(data)
#> # A tibble: 3 × 3
#>       a b     c         
#>   <int> <chr> <date>    
#> 1     1 a     2025-06-18
#> 2     2 b     2025-06-17
#> 3     3 c     2025-06-16
```

This will work for reasonable inputs that are already data.frames,
lists, matrices, or tables.

You can also create a new tibble from column vectors with `tibble()`:

``` r
tibble(x = 1:5, y = 1, z = x^2 + y)
#> # A tibble: 5 × 3
#>       x     y     z
#>   <int> <dbl> <dbl>
#> 1     1     1     2
#> 2     2     1     5
#> 3     3     1    10
#> 4     4     1    17
#> 5     5     1    26
```

`tibble()` does much less than `data.frame()`: it never changes the type
of the inputs (e.g. it keeps list columns as is), it never changes the
names of variables, it only recycles inputs of length 1, and it never
creates `row.names()`. You can read more about these features in
[`vignette("tibble")`](https://tibble.tidyverse.org/articles/tibble.html).

You can define a tibble row-by-row with `tribble()`:

``` r
tribble(
  ~x, ~y,  ~z,
  "a", 2,  3.6,
  "b", 1,  8.5
)
#> # A tibble: 2 × 3
#>   x         y     z
#>   <chr> <dbl> <dbl>
#> 1 a         2   3.6
#> 2 b         1   8.5
```

## Related work

The tibble print method draws inspiration from
[data.table](https://rdatatable.gitlab.io/data.table), and
[frame](https://github.com/patperry/r-frame). Like
`data.table::data.table()`, `tibble()` doesn’t change column names and
doesn’t use rownames.

------------------------------------------------------------------------

## Code of Conduct

Please note that the tibble project is released with a [Contributor Code
of Conduct](https://tibble.tidyverse.org/CODE_OF_CONDUCT.html). By
contributing to this project, you agree to abide by its terms.

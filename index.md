# tibble

## Overview

A **tibble**, or `tbl_df`, is a modern reimagining of the data.frame,
keeping what time has proven to be effective, and throwing out what is
not. Tibbles are data.frames that are lazy and surly: they do less
(i.e. they don’t change variable names or types, and don’t do partial
matching) and complain more (e.g. when a variable does not exist). This
forces you to confront problems earlier, typically leading to cleaner,
more expressive code. Tibbles also have an enhanced
[`print()`](https://rdrr.io/r/base/print.html) method which makes them
easier to use with large datasets containing complex objects.

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

Create a tibble from an existing object with
[`as_tibble()`](https://tibble.tidyverse.org/reference/as_tibble.md):

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

You can also create a new tibble from column vectors with
[`tibble()`](https://tibble.tidyverse.org/reference/tibble.md):

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

[`tibble()`](https://tibble.tidyverse.org/reference/tibble.md) does much
less than [`data.frame()`](https://rdrr.io/r/base/data.frame.html): it
never changes the type of the inputs (e.g. it keeps list columns as is),
it never changes the names of variables, it only recycles inputs of
length 1, and it never creates
[`row.names()`](https://rdrr.io/r/base/row.names.html). You can read
more about these features in
[`vignette("tibble")`](https://tibble.tidyverse.org/articles/tibble.md).

You can define a tibble row-by-row with
[`tribble()`](https://tibble.tidyverse.org/reference/tribble.md):

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
`data.table::data.table()`,
[`tibble()`](https://tibble.tidyverse.org/reference/tibble.md) doesn’t
change column names and doesn’t use rownames.

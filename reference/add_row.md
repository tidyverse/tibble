# Add rows to a data frame

This is a convenient way to add one or more rows of data to an existing
data frame. See
[`tribble()`](https://tibble.tidyverse.org/reference/tribble.md) for an
easy way to create an complete data frame row-by-row. Use
[`tibble_row()`](https://tibble.tidyverse.org/reference/tibble.md) to
ensure that the new data has only one row.

`add_case()` is an alias of `add_row()`.

## Usage

``` r
add_row(.data, ..., .before = NULL, .after = NULL)
```

## Arguments

- .data:

  Data frame to append to.

- ...:

  \<[`dynamic-dots`](https://rlang.r-lib.org/reference/dyn-dots.html)\>
  Name-value pairs, passed on to
  [`tibble()`](https://tibble.tidyverse.org/reference/tibble.md). Values
  can be defined only for columns that already exist in `.data` and
  unset columns will get an `NA` value.

- .before, .after:

  One-based row index where to add the new rows, default: after last
  row.

## See also

Other addition:
[`add_column()`](https://tibble.tidyverse.org/reference/add_column.md)

## Examples

``` r
# add_row ---------------------------------
df <- tibble(x = 1:3, y = 3:1)

df %>% add_row(x = 4, y = 0)
#> # A tibble: 4 × 2
#>       x     y
#>   <dbl> <dbl>
#> 1     1     3
#> 2     2     2
#> 3     3     1
#> 4     4     0

# You can specify where to add the new rows
df %>% add_row(x = 4, y = 0, .before = 2)
#> # A tibble: 4 × 2
#>       x     y
#>   <dbl> <dbl>
#> 1     1     3
#> 2     4     0
#> 3     2     2
#> 4     3     1

# You can supply vectors, to add multiple rows (this isn't
# recommended because it's a bit hard to read)
df %>% add_row(x = 4:5, y = 0:-1)
#> # A tibble: 5 × 2
#>       x     y
#>   <int> <int>
#> 1     1     3
#> 2     2     2
#> 3     3     1
#> 4     4     0
#> 5     5    -1

# Use tibble_row() to add one row only
df %>% add_row(tibble_row(x = 4, y = 0))
#> # A tibble: 4 × 2
#>       x     y
#>   <dbl> <dbl>
#> 1     1     3
#> 2     2     2
#> 3     3     1
#> 4     4     0
try(df %>% add_row(tibble_row(x = 4:5, y = 0:-1)))
#> Error in tibble_quos(xs, .rows = 1, .name_repair = .name_repair, single_row = TRUE) : 
#>   All vectors must be size one, use `list()` to wrap.
#> ✖ Column `x` is of size 2.

# Absent variables get missing values
df %>% add_row(x = 4)
#> # A tibble: 4 × 2
#>       x     y
#>   <dbl> <int>
#> 1     1     3
#> 2     2     2
#> 3     3     1
#> 4     4    NA

# You can't create new variables
try(df %>% add_row(z = 10))
#> Error in add_row(., z = 10) : New rows can't add columns.
#> ✖ Can't find column `z` in `.data`.
```

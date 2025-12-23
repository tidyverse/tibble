# Add columns to a data frame

This is a convenient way to add one or more columns to an existing data
frame.

## Usage

``` r
add_column(
  .data,
  ...,
  .before = NULL,
  .after = NULL,
  .name_repair = c("check_unique", "unique", "universal", "minimal", "unique_quiet",
    "universal_quiet")
)
```

## Arguments

- .data:

  Data frame to append to.

- ...:

  \<[`dynamic-dots`](https://rlang.r-lib.org/reference/dyn-dots.html)\>
  Name-value pairs, passed on to
  [`tibble()`](https://tibble.tidyverse.org/reference/tibble.md). All
  values must have the same size of `.data` or size 1.

- .before, .after:

  One-based column index or column name where to add the new columns,
  default: after last column.

- .name_repair:

  Treatment of problematic column names:

  - `"minimal"`: No name repair or checks, beyond basic existence,

  - `"unique"`: Make sure names are unique and not empty,

  - `"check_unique"`: (default value), no name repair, but check they
    are `unique`,

  - `"universal"`: Make the names `unique` and syntactic

  - `"unique_quiet"`: Same as `"unique"`, but "quiet"

  - `"universal_quiet"`: Same as `"universal"`, but "quiet"

  - a function: apply custom name repair (e.g.,
    `.name_repair = make.names` for names in the style of base R).

  - A purrr-style anonymous function, see
    [`rlang::as_function()`](https://rlang.r-lib.org/reference/as_function.html)

  This argument is passed on as `repair` to
  [`vctrs::vec_as_names()`](https://vctrs.r-lib.org/reference/vec_as_names.html).
  See there for more details on these terms and the strategies used to
  enforce them.

## See also

Other addition:
[`add_row()`](https://tibble.tidyverse.org/reference/add_row.md)

## Examples

``` r
# add_column ---------------------------------
df <- tibble(x = 1:3, y = 3:1)

df %>% add_column(z = -1:1, w = 0)
#> # A tibble: 3 × 4
#>       x     y     z     w
#>   <int> <int> <int> <dbl>
#> 1     1     3    -1     0
#> 2     2     2     0     0
#> 3     3     1     1     0
df %>% add_column(z = -1:1, .before = "y")
#> # A tibble: 3 × 3
#>       x     z     y
#>   <int> <int> <int>
#> 1     1    -1     3
#> 2     2     0     2
#> 3     3     1     1

# You can't overwrite existing columns
try(df %>% add_column(x = 4:6))
#> Error in add_column(., x = 4:6) : 
#>   Column name `x` must not be duplicated.
#> Use `.name_repair` to specify repair.
#> Caused by error in `repaired_names()` at tibble/R/names.R:38:3:
#> ! Names must be unique.
#> ✖ These names are duplicated:
#>   * "x" at locations 1 and 3.

# You can't create new observations
try(df %>% add_column(z = 1:5))
#> Error in add_column(., z = 1:5) : 
#>   New columns must be compatible with `.data`.
#> ✖ New column has 5 rows.
#> ℹ `.data` has 3 rows.
```

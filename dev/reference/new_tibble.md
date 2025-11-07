# Tibble constructor and validator

Creates or validates a subclass of a tibble. These function is mostly
useful for package authors that implement subclasses of a tibble, like
sf or tsibble.

`new_tibble()` creates a new object as a subclass of `tbl_df`, `tbl` and
`data.frame`. This function is optimized for performance, checks are
reduced to a minimum. See
[`vctrs::new_data_frame()`](https://vctrs.r-lib.org/reference/new_data_frame.html)
for details.

`validate_tibble()` checks a tibble for internal consistency. Correct
behavior can be guaranteed only if this function runs without raising an
error.

## Usage

``` r
new_tibble(x, ..., nrow = NULL, class = NULL, subclass = NULL)

validate_tibble(x)
```

## Arguments

- x:

  A tibble-like object.

- ...:

  Name-value pairs of additional attributes.

- nrow:

  The number of rows, inferred from `x` if omitted.

- class:

  Subclasses to assign to the new object, default: none.

- subclass:

  Deprecated, retained for compatibility. Please use the `class`
  argument.

## Construction

For `new_tibble()`, `x` must be a list. The `nrow` argument may be
omitted as of tibble 3.1.4. If present, every element of the list `x`
should have
[`vctrs::vec_size()`](https://vctrs.r-lib.org/reference/vec_size.html)
equal to this value. (But this is not checked by the constructor). This
takes the place of the "row.names" attribute in a data frame. `x` must
have names (or be empty), but the names are not checked for correctness.

## Validation

`validate_tibble()` checks for "minimal" names and that all columns are
vectors, data frames or matrices. It also makes sure that all columns
have the same length, and that
[`vctrs::vec_size()`](https://vctrs.r-lib.org/reference/vec_size.html)
is consistent with the data.

## See also

[`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md) and
[`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
for ways to construct a tibble with recycling of scalars and automatic
name repair, and
[`vctrs::df_list()`](https://vctrs.r-lib.org/reference/df_list.html) and
[`vctrs::new_data_frame()`](https://vctrs.r-lib.org/reference/new_data_frame.html)
for lower-level implementations.

## Examples

``` r
# The nrow argument can be omitted:
new_tibble(list(a = 1:3, b = 4:6))
#> # A tibble: 3 × 2
#>       a     b
#>   <int> <int>
#> 1     1     4
#> 2     2     5
#> 3     3     6

# Existing row.names attributes are ignored:
try(validate_tibble(new_tibble(trees, nrow = 3)))
#> Error in validate_nrow(names(x), col_lengths(x), vec_size(x)) : 
#>   Tibble columns must have compatible sizes.
#> • Size 3: Requested with `nrow` argument.
#> • Size 31: Columns `Girth`, `Height`, and `Volume`.
#> ℹ Only values of size one are recycled.

# The length of all columns must be compatible with the nrow argument:
try(validate_tibble(new_tibble(list(a = 1:3, b = 4:6), nrow = 2)))
#> Error in validate_nrow(names(x), col_lengths(x), vec_size(x)) : 
#>   Tibble columns must have compatible sizes.
#> • Size 2: Requested with `nrow` argument.
#> • Size 3: Columns `a` and `b`.
#> ℹ Only values of size one are recycled.
```

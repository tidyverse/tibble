# Test if the object is a tibble

This function returns `TRUE` for tibbles or subclasses thereof, and
`FALSE` for all other objects, including regular data frames.

## Usage

``` r
is_tibble(x)
```

## Arguments

- x:

  An object

## Value

`TRUE` if the object inherits from the `tbl_df` class.

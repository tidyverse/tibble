# Legacy printing

**\[deprecated\]** As of tibble 3.1.0, printing is handled entirely by
the pillar package. Do not use this function. If you implement a package
that extend tibble, the printed output can be customized in various
ways. See
[`vignette("extending", package = "pillar")`](https://pillar.r-lib.org/articles/extending.html)
for details.

## Usage

``` r
trunc_mat(x, n = NULL, width = NULL, n_extra = NULL)
```

## Arguments

- x:

  Object to format or print.

- n:

  Number of rows to show. If `NULL`, the default, will print all rows if
  less than option `tibble.print_max`. Otherwise, will print
  `tibble.print_min` rows.

- width:

  Width of text output to generate. This defaults to `NULL`, which means
  use `getOption("tibble.width")` or (if also `NULL`)
  `getOption("width")`; the latter displays only the columns that fit on
  one screen. You can also set `options(tibble.width = Inf)` to override
  this default and always print all columns, this may be slow for very
  wide tibbles.

- n_extra:

  Number of extra columns to print abbreviated information for, if the
  width is too small for the entire tibble. If `NULL`, the default, will
  print information about at most `tibble.max_extra_cols` extra columns.

## Value

An object with a [`print()`](https://rdrr.io/r/base/print.html) method
that will print the input similarly to a tibble. The internal data
format is an implementation detail, do not rely on it.

# View an object

**\[experimental\]**

Calls [`utils::View()`](https://rdrr.io/r/utils/View.html) on the input
and returns it, invisibly. If the input is not a data frame, it is
processed using a variant of `as.data.frame(head(x, n))`. A message is
printed if the number of rows exceeds `n`. This function has no effect
in non[interactive](https://rdrr.io/r/base/interactive.html) sessions.

## Usage

``` r
view(x, title = NULL, ..., n = NULL)
```

## Arguments

- x:

  The object to display.

- title:

  The title to use for the display, by default the deparsed expression
  is used.

- ...:

  Unused, must be empty.

- n:

  Maximum number of rows to display. Only used if `x` is not a data
  frame. Uses the `view_max`
  [option](https://tibble.tidyverse.org/dev/reference/tibble_options.md)
  by default.

## Details

The RStudio IDE overrides
[`utils::View()`](https://rdrr.io/r/utils/View.html), this is picked up
correctly.

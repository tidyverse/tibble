# Package options

Options that affect interactive display. See
[pillar::pillar_options](https://pillar.r-lib.org/reference/pillar_options.html)
for options that affect display on the console, and
[`cli::num_ansi_colors()`](https://cli.r-lib.org/reference/num_ansi_colors.html)
for enabling and disabling colored output via ANSI sequences like
`[3m[38;5;246m[39m[23m`.

## Usage

``` r
tibble_options
```

## Details

These options can be set via
[`options()`](https://rdrr.io/r/base/options.html) and queried via
[`getOption()`](https://rdrr.io/r/base/options.html). For this, add a
`tibble.` prefix (the package name and a dot) to the option name.
Example: for an option `foo`, use `options(tibble.foo = value)` to set
it and `getOption("tibble.foo")` to retrieve the current value. An
option value of `NULL` means that the default is used.

## Options for the tibble package

- `view_max`: Maximum number of rows shown by
  [`view()`](https://tibble.tidyverse.org/dev/reference/view.md) if the
  input is not a data frame, passed on to
  [`head()`](https://rdrr.io/r/utils/head.html). Default: `1000`.

## Examples

``` r
# Default setting:
getOption("tibble.view_max")
#> NULL

# Change for the duration of the session:
old <- options(tibble.view_max = 100)

# view() would show only 100 rows e.g. for a lazy data frame

# Change back to the original value:
options(old)

# Local scope:
local({
  rlang::local_options(tibble.view_max = 100)
  # view() would show only 100 rows e.g. for a lazy data frame
})
# view() would show the default 1000 rows e.g. for a lazy data frame
```

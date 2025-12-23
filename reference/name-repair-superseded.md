# Superseded functions for name repair

**\[superseded\]**

`tidy_names()`, `set_tidy_names()`, and `repair_names()` were early
efforts to facilitate *post hoc* name repair in tibble, given that
[`tibble()`](https://tibble.tidyverse.org/reference/tibble.md) and
[`as_tibble()`](https://tibble.tidyverse.org/reference/as_tibble.md) did
not do this.

From tibble v2.0.0, the `.name_repair` argument gives direct access to
three specific levels of name repair: `minimal`, `unique`, and
`universal`. See
[`vctrs::vec_as_names()`](https://vctrs.r-lib.org/reference/vec_as_names.html)
for the implementation of the underlying logic.

## Usage

``` r
tidy_names(name, syntactic = FALSE, quiet = FALSE)

set_tidy_names(x, syntactic = FALSE, quiet = FALSE)

repair_names(x, prefix = "V", sep = "")
```

## Arguments

- name:

  A `names` attribute, usually a character vector.

- syntactic:

  Should names be made syntactically valid? If `FALSE`, uses same logic
  as `.name_repair = "unique"`. If `TRUE`, uses same logic as
  `.name_repair = "universal"`.

- quiet:

  Whether to suppress messages about name repair.

- x:

  A vector.

- prefix:

  A string, the prefix to use for new column names.

- sep:

  A string inserted between the column name and de-duplicating number.

## Value

`x` with repaired names or a repaired version of `name`.

## Life cycle

These functions are superseded. The `repair_names()` logic will also
remain available in
[`vctrs::vec_as_names_legacy()`](https://vctrs.r-lib.org/reference/vec_as_names_legacy.html).

    tibble(..., `.name_repair = "unique"`)
    ## is preferred to
    df <- tibble(...)
    set_tidy_names(df, syntactic = FALSE)

    tibble(..., `.name_repair = "universal"`)
    ## is preferred to
    df <- tibble(...)
    set_tidy_names(df, syntactic = TRUE)

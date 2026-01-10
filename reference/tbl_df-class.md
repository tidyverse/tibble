# `tbl_df` class

The `tbl_df` class is a subclass of
[`data.frame`](https://rdrr.io/r/base/data.frame.html), created in order
to have different default behaviour. The colloquial term "tibble" refers
to a data frame that has the `tbl_df` class. Tibble is the central data
structure for the set of packages known as the
[tidyverse](https://tidyverse.org/packages/), including
[dplyr](https://dplyr.tidyverse.org/),
[ggplot2](https://ggplot2.tidyverse.org/),
[tidyr](https://tidyr.tidyverse.org/), and
[readr](https://readr.tidyverse.org/).

The general ethos is that tibbles are lazy and surly: they do less and
complain more than base
[data.frame](https://rdrr.io/r/base/data.frame.html)s. This forces
problems to be tackled earlier and more explicitly, typically leading to
code that is more expressive and robust.

## Properties of `tbl_df`

Objects of class `tbl_df` have:

- A `class` attribute of `c("tbl_df", "tbl", "data.frame")`.

- A base type of `"list"`, where each element of the list has the same
  [`vctrs::vec_size()`](https://vctrs.r-lib.org/reference/vec_size.html).

- A `names` attribute that is a character vector the same length as the
  underlying list.

- A `row.names` attribute, included for compatibility with
  [data.frame](https://rdrr.io/r/base/data.frame.html). This attribute
  is only consulted to query the number of rows, any row names that
  might be stored there are ignored by most tibble methods.

## Behavior of `tbl_df`

How default behaviour of tibbles differs from that of
[data.frame](https://rdrr.io/r/base/data.frame.html)s, during creation
and access:

- Column data is not coerced. A character vector is not turned into a
  factor. List-columns are expressly anticipated and do not require
  special tricks. Internal names are never stripped from column data.
  Read more in
  [`tibble()`](https://tibble.tidyverse.org/reference/tibble.md).

- Recycling only happens for a length 1 input. Read more in
  [`vctrs::vec_recycle()`](https://vctrs.r-lib.org/reference/vec_recycle.html).

- Column names are not munged, although missing names are
  auto-populated. Empty and duplicated column names are strongly
  discouraged, but the user must indicate how to resolve. Read more in
  [`vctrs::vec_as_names()`](https://vctrs.r-lib.org/reference/vec_as_names.html).

- Row names are not added and are strongly discouraged, in favor of
  storing that info as a column. Read about in
  [rownames](https://tibble.tidyverse.org/reference/rownames.md).

- `df[, j]` returns a tibble; it does not automatically extract the
  column inside. `df[, j, drop = FALSE]` is the default. Read more in
  [subsetting](https://tibble.tidyverse.org/reference/subsetting.md).

- There is no partial matching when `$` is used to index by name.
  `df$name` for a nonexistent name generates a warning. Read more in
  [subsetting](https://tibble.tidyverse.org/reference/subsetting.md).

See
[`vignette("invariants")`](https://tibble.tidyverse.org/articles/invariants.md)
for a detailed description of the behavior.

Furthermore, printing and inspection are a very high priority. The goal
is to convey as much information as possible, in a concise way, even for
large and complex tibbles. Read more in
[formatting](https://tibble.tidyverse.org/reference/formatting.md).

## See also

[`tibble()`](https://tibble.tidyverse.org/reference/tibble.md),
[`as_tibble()`](https://tibble.tidyverse.org/reference/as_tibble.md),
[`tribble()`](https://tibble.tidyverse.org/reference/tribble.md),
[`print.tbl()`](https://tibble.tidyverse.org/reference/formatting.md),
[`glimpse()`](https://pillar.r-lib.org/reference/glimpse.html)

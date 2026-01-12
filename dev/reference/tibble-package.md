# tibble: Simple Data Frames

Provides a 'tbl_df' class (the 'tibble') with stricter checking and
better formatting than the traditional data frame.

## Details

**\[stable\]**

The tibble package provides utilities for handling **tibbles**, where
"tibble" is a colloquial term for the S3
[`tbl_df`](https://tibble.tidyverse.org/dev/reference/tbl_df-class.md)
class. The
[`tbl_df`](https://tibble.tidyverse.org/dev/reference/tbl_df-class.md)
class is a special case of the base
[`data.frame`](https://rdrr.io/r/base/data.frame.html) class, developed
in response to lessons learned over many years of data analysis with
data frames.

Tibble is the central data structure for the set of packages known as
the [tidyverse](https://tidyverse.org/packages/), including
[dplyr](https://dplyr.tidyverse.org/),
[ggplot2](https://ggplot2.tidyverse.org/),
[tidyr](https://tidyr.tidyverse.org/), and
[readr](https://readr.tidyverse.org/).

General resources:

- Website for the tibble package: <https://tibble.tidyverse.org>

- [Vectors chapter](https://adv-r.hadley.nz/vectors-chap.html) in
  *Advanced R* (2nd edition), specifically the [Data frames and tibbles
  section](https://adv-r.hadley.nz/vectors-chap.html#tibble)

Resources on specific topics:

- Create a tibble:
  [`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md),
  [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md),
  [`tribble()`](https://tibble.tidyverse.org/dev/reference/tribble.md),
  [`enframe()`](https://tibble.tidyverse.org/dev/reference/enframe.md)

- Inspect a tibble:
  [`print.tbl()`](https://tibble.tidyverse.org/dev/reference/formatting.md),
  [`glimpse()`](https://pillar.r-lib.org/reference/glimpse.html)

- Details on the S3 `tbl_df` class:
  [`tbl_df`](https://tibble.tidyverse.org/dev/reference/tbl_df-class.md)

- Package options:
  [tibble_options](https://tibble.tidyverse.org/dev/reference/tibble_options.md)

## See also

Useful links:

- <https://tibble.tidyverse.org/>

- <https://github.com/tidyverse/tibble>

- Report bugs at <https://github.com/tidyverse/tibble/issues>

## Author

**Maintainer**: Kirill Müller <kirill@cynkra.com>
([ORCID](https://orcid.org/0000-0002-1416-3412))

Authors:

- Hadley Wickham <hadley@rstudio.com>

Other contributors:

- Romain Francois <romain@r-enthusiasts.com> \[contributor\]

- Jennifer Bryan <jenny@rstudio.com> \[contributor\]

- Posit Software, PBC ([ROR](https://ror.org/03wc8by49)) \[copyright
  holder, funder\]

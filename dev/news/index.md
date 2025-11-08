# Changelog

## tibble 3.3.0.9007

### Continuous integration

- Sync ([\#1668](https://github.com/tidyverse/tibble/issues/1668)).

## tibble 3.3.0.9006

### Continuous integration

- Use reviewdog for external PRs
  ([\#1663](https://github.com/tidyverse/tibble/issues/1663)).

## tibble 3.3.0.9005

### Chore

- Auto-update from GitHub Actions.

  Run: <https://github.com/tidyverse/tibble/actions/runs/17451419215>

## tibble 3.3.0.9004

### Continuous integration

- Cleanup and fix macOS
  ([\#1661](https://github.com/tidyverse/tibble/issues/1661)).

## tibble 3.3.0.9003

### Chore

- Auto-update from GitHub Actions.

  Run: <https://github.com/tidyverse/tibble/actions/runs/16661919871>

### Continuous integration

- Format with air, check detritus, better handling of `extra-packages`
  ([\#1660](https://github.com/tidyverse/tibble/issues/1660)).

## tibble 3.3.0.9002

### Testing

- Suppress [`message()`](https://rdrr.io/r/base/message.html) output in
  some as_tibble tests
  ([@MichaelChirico](https://github.com/MichaelChirico),
  [\#1647](https://github.com/tidyverse/tibble/issues/1647)).

- Snapshot updates for rcc-full
  ({“os”:“ubuntu-22.04”,“r”:“devel”,“http-user-agent”:“release”})
  ([\#1649](https://github.com/tidyverse/tibble/issues/1649)).

## tibble 3.3.0.9001

### Chore

- Cynkra’s Spring Cleaning
  ([@Layalchristine24](https://github.com/Layalchristine24),
  [\#1643](https://github.com/tidyverse/tibble/issues/1643),
  [\#1644](https://github.com/tidyverse/tibble/issues/1644)).

## tibble 3.3.0.9000

### Chore

- Auto-update from GitHub Actions.

  Run: <https://github.com/tidyverse/tibble/actions/runs/15506522924>

- Use Quarto-style formatting in vignettes.

- Auto-update from GitHub Actions.

  Run: <https://github.com/tidyverse/tibble/actions/runs/15506365201>

- Upkeep ([\#1641](https://github.com/tidyverse/tibble/issues/1641)).

### Documentation

- Posit as copyright holder.

## tibble 3.3.0

CRAN release: 2025-06-08

### Bug fixes

- Subset tibble with `"0"` for row index
  ([@eitsupi](https://github.com/eitsupi),
  [\#1636](https://github.com/tidyverse/tibble/issues/1636),
  [\#1637](https://github.com/tidyverse/tibble/issues/1637)).

- [`new_tibble()`](https://tibble.tidyverse.org/dev/reference/new_tibble.md)
  and
  [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  support attributes named `"n"` and `"x"`
  ([\#1573](https://github.com/tidyverse/tibble/issues/1573),
  [\#1574](https://github.com/tidyverse/tibble/issues/1574)).

### Features

- Support new vctrs `.name_repair` options: `unique_quiet`,
  `universal_quiet` ([@andreranza](https://github.com/andreranza),
  [\#1549](https://github.com/tidyverse/tibble/issues/1549),
  [\#1625](https://github.com/tidyverse/tibble/issues/1625)).

- Rework [`view()`](https://tibble.tidyverse.org/dev/reference/view.md)
  to better work with RStudio and Positron
  ([@DavisVaughan](https://github.com/DavisVaughan),
  [\#1551](https://github.com/tidyverse/tibble/issues/1551),
  [\#1603](https://github.com/tidyverse/tibble/issues/1603)).

- [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  calls [`as.data.frame()`](https://rdrr.io/r/base/as.data.frame.html)
  for objects that are not subclasses of `"tbl_df"`
  ([@TimTaylor](https://github.com/TimTaylor),
  [\#1556](https://github.com/tidyverse/tibble/issues/1556),
  [\#1557](https://github.com/tidyverse/tibble/issues/1557)).

### Documentation

- Update comparison between tibble and data.frame
  ([@olivroy](https://github.com/olivroy),
  [\#1567](https://github.com/tidyverse/tibble/issues/1567)).

- Use pak for installing dev version in README
  ([@luisDVA](https://github.com/luisDVA),
  [\#1600](https://github.com/tidyverse/tibble/issues/1600)).

- Document that `...` must be empty in
  [`print.tbl_df()`](https://tibble.tidyverse.org/dev/reference/formatting.md).

- Request to not edit `NEWS.md`.

- Fix rendering if suggested packages are missing.

- Alt text ([@maelle](https://github.com/maelle),
  [\#1528](https://github.com/tidyverse/tibble/issues/1528),
  [\#1539](https://github.com/tidyverse/tibble/issues/1539)).

### Testing

- Skip tests if packages are missing.

- Override `::` to avoid failures in tests without suggested packages.

## tibble 3.2.1

CRAN release: 2023-03-20

### Internal

- Use symbol instead of string in
  [`.Call()`](https://rdrr.io/r/base/CallExternal.html).

## tibble 3.2.0

CRAN release: 2023-03-08

### Features

- Accurate location of the source of an error in error messages
  ([\#1379](https://github.com/tidyverse/tibble/issues/1379),
  [\#1065](https://github.com/tidyverse/tibble/issues/1065),
  [\#1508](https://github.com/tidyverse/tibble/issues/1508)).

- [`as_data_frame()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)
  now also refers to
  [`as.data.frame()`](https://rdrr.io/r/base/as.data.frame.html) in its
  deprecation message
  ([\#1149](https://github.com/tidyverse/tibble/issues/1149),
  [\#1506](https://github.com/tidyverse/tibble/issues/1506)).

### Breaking changes

- Deprecated functions and arguments where we could not detect usage by
  other CRAN packages
  ([\#1515](https://github.com/tidyverse/tibble/issues/1515)):

  - [`data_frame_()`](https://tibble.tidyverse.org/dev/reference/deprecated.md),
    [`lst_()`](https://tibble.tidyverse.org/dev/reference/deprecated.md),
    [`frame_data()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)

  - `as_tibble(validate = )`, `as_tibble(NULL)`,
    `new_tibble(subclass = )`

  - [`add_row()`](https://tibble.tidyverse.org/dev/reference/add_row.md)
    and
    [`add_column()`](https://tibble.tidyverse.org/dev/reference/add_column.md)
    for non-data-frame input

  - [`add_column()`](https://tibble.tidyverse.org/dev/reference/add_column.md)
    for input with non-unique names

  - corner cases for `tbl[[x]]`

- Breaking change: Remove `knit_print.trunc_mat()` method
  ([\#1516](https://github.com/tidyverse/tibble/issues/1516)).

- Forward
  [`trunc_mat()`](https://tibble.tidyverse.org/dev/reference/trunc_mat.md)
  to new-style pillar methods
  ([\#1517](https://github.com/tidyverse/tibble/issues/1517)).

### Bug fixes

- Allow `glue()` and other classed characters for subassignment
  ([\#1150](https://github.com/tidyverse/tibble/issues/1150),
  [\#1503](https://github.com/tidyverse/tibble/issues/1503)).

### Performance

- Reduce overhead of single-column subset assignment
  ([\#1363](https://github.com/tidyverse/tibble/issues/1363)).

### Documentation

- New
  [`vignette("extending")`](https://tibble.tidyverse.org/dev/articles/extending.md)
  ([\#275](https://github.com/tidyverse/tibble/issues/275),
  [\#1512](https://github.com/tidyverse/tibble/issues/1512)).

- Minor updates
  ([\#1151](https://github.com/tidyverse/tibble/issues/1151),
  [\#1070](https://github.com/tidyverse/tibble/issues/1070),
  [\#1512](https://github.com/tidyverse/tibble/issues/1512),
  [\#1485](https://github.com/tidyverse/tibble/issues/1485)).

- Update example for `nrow` argument to
  [`new_tibble()`](https://tibble.tidyverse.org/dev/reference/new_tibble.md)
  ([@heavywatal](https://github.com/heavywatal),
  [\#1394](https://github.com/tidyverse/tibble/issues/1394)).

- Fix display of mermaid diagrams in
  [`vignette("formats")`](https://tibble.tidyverse.org/dev/articles/formats.md)
  ([@maelle](https://github.com/maelle),
  [\#1497](https://github.com/tidyverse/tibble/issues/1497),
  [\#1498](https://github.com/tidyverse/tibble/issues/1498)).

- Remove ANSI escapes from invariants article on pkgdown
  ([\#1374](https://github.com/tidyverse/tibble/issues/1374)).

### Internal

- Require vctrs \>= 0.4.1 and pillar \>= 1.8.1

- Use cli for formatting conditions
  ([\#1387](https://github.com/tidyverse/tibble/issues/1387)).

- Use `vec_as_location(missing = "error")` for better error messages
  ([\#741](https://github.com/tidyverse/tibble/issues/741),
  [\#1511](https://github.com/tidyverse/tibble/issues/1511)).

- Remove compatibility code for RSDA package which is broken anyway due
  to other changes
  ([\#923](https://github.com/tidyverse/tibble/issues/923),
  [\#1509](https://github.com/tidyverse/tibble/issues/1509)).

- Skip tests if suggested packages not available
  ([\#1246](https://github.com/tidyverse/tibble/issues/1246),
  [@MichaelChirico](https://github.com/MichaelChirico)).

- Remove obsolete tests
  ([\#1513](https://github.com/tidyverse/tibble/issues/1513)).

## tibble 3.1.8

CRAN release: 2022-07-22

### Documentation

- Better reporting for error calls from
  [`vec_as_location()`](https://vctrs.r-lib.org/reference/vec_as_location.html)
  ([\#1237](https://github.com/tidyverse/tibble/issues/1237)).

- Mention [`median()`](https://rdrr.io/r/stats/median.html) in Recovery
  section of
  [`vignette("numbers")`](https://tibble.tidyverse.org/dev/articles/numbers.md)
  ([\#1197](https://github.com/tidyverse/tibble/issues/1197)).

## tibble 3.1.7

CRAN release: 2022-05-03

### Breaking change

- [`trunc_mat()`](https://tibble.tidyverse.org/dev/reference/trunc_mat.md)
  now returns a value with a different structure. This is considered an
  implementation detail that can change in the future, do not rely on
  it. The only guarantee is that calling
  [`print()`](https://rdrr.io/r/base/print.html) will display the input
  like a tibble
  ([\#1059](https://github.com/tidyverse/tibble/issues/1059)).

### Documentation

- Avoid listing
  [`dim_desc()`](https://dplyr.tidyverse.org/reference/dim_desc.html) in
  reexports.
- Add more examples for data frame and matrix columns
  ([\#978](https://github.com/tidyverse/tibble/issues/978),
  [\#1012](https://github.com/tidyverse/tibble/issues/1012)).

### Internal

- Require rlang 1.0.1 and pillar 1.7.0
  ([\#1063](https://github.com/tidyverse/tibble/issues/1063)).
- Prefer `class` over `.subclass` in
  [`rlang::error_cnd()`](https://rlang.r-lib.org/reference/cnd.html)
  ([\#1015](https://github.com/tidyverse/tibble/issues/1015),
  [\#1060](https://github.com/tidyverse/tibble/issues/1060)).

## tibble 3.1.6

CRAN release: 2021-11-07

- [`set_num_opts()`](https://tibble.tidyverse.org/dev/reference/num.md)
  and
  [`set_char_opts()`](https://tibble.tidyverse.org/dev/reference/char.md)
  are reexported from pillar
  ([\#959](https://github.com/tidyverse/tibble/issues/959)).
- [`view()`](https://tibble.tidyverse.org/dev/reference/view.md) uses
  `rlang::expr_deparse(width = Inf)` to avoid errors with long `|>`
  pipes ([\#957](https://github.com/tidyverse/tibble/issues/957)).
- [`new_tibble()`](https://tibble.tidyverse.org/dev/reference/new_tibble.md)
  checks that the `nrow` argument is nonnegative and less than 2^31
  ([\#916](https://github.com/tidyverse/tibble/issues/916)).
- `tbl_sum.tbl_df()` has an ellipsis in its formals for extensibility.

## tibble 3.1.5

CRAN release: 2021-09-30

- Avoid necessity to set `"tibble.view_max"` option for lazy tables
  ([\#954](https://github.com/tidyverse/tibble/issues/954)).
- Avoid blanket import for lifecycle package for compatibility with
  upcoming rlang
  ([\#955](https://github.com/tidyverse/tibble/issues/955),
  [@romainfrancois](https://github.com/romainfrancois)).

## tibble 3.1.4

CRAN release: 2021-08-25

### Features

- `as.data.frame.tbl_df()` strips inner column names
  ([\#837](https://github.com/tidyverse/tibble/issues/837)).
- [`new_tibble()`](https://tibble.tidyverse.org/dev/reference/new_tibble.md)
  allows omitting the `nrow` argument again
  ([\#781](https://github.com/tidyverse/tibble/issues/781)).

### Documentation

- Move
  [`vignette("digits")`](https://tibble.tidyverse.org/dev/articles/digits.md),
  [`vignette("numbers")`](https://tibble.tidyverse.org/dev/articles/numbers.md),
  [`?num`](https://tibble.tidyverse.org/dev/reference/num.md) and
  [`?char`](https://tibble.tidyverse.org/dev/reference/char.md) from the
  pillar package here
  ([\#913](https://github.com/tidyverse/tibble/issues/913)).
- Replace `iris` by `trees`
  ([\#943](https://github.com/tidyverse/tibble/issues/943)).
- Various documentation improvements.
- New
  [`?tibble_options`](https://tibble.tidyverse.org/dev/reference/tibble_options.md)
  help page ([\#912](https://github.com/tidyverse/tibble/issues/912)).

### Performance

- `x[i, j] <- one_row_value` avoids explicit recycling of the right-hand
  side, the recycling happens implicitly in
  [`vctrs::vec_assign()`](https://vctrs.r-lib.org/reference/vec_slice.html)
  for performance
  ([\#922](https://github.com/tidyverse/tibble/issues/922)).

### Internal

- Vignettes are now tested with a snapshot test
  ([\#919](https://github.com/tidyverse/tibble/issues/919)).
- [`new_tibble()`](https://tibble.tidyverse.org/dev/reference/new_tibble.md)
  uses
  [`vctrs::new_data_frame()`](https://vctrs.r-lib.org/reference/new_data_frame.html)
  internally ([\#726](https://github.com/tidyverse/tibble/issues/726),
  [@DavisVaughan](https://github.com/DavisVaughan)).
- Adapt to pillar 1.6.2.
- Fix tests for compatibility with pillar 1.6.2.

## tibble 3.1.3

CRAN release: 2021-07-23

### Bug fixes

- `tbl[row, col] <- rhs` treats an all-`NA` logical vector as a missing
  value both for existing data
  ([\#773](https://github.com/tidyverse/tibble/issues/773)) and for the
  right-hand side value
  ([\#868](https://github.com/tidyverse/tibble/issues/868)). This means
  that a column initialized with `NA` (of type `logical`) will change
  its type when a row is updated to a value of a different type.
- `[[<-()` supports symbols
  ([\#893](https://github.com/tidyverse/tibble/issues/893)).

### Features

- [`as_tibble_row()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  supports arbitrary vectors
  ([\#797](https://github.com/tidyverse/tibble/issues/797)).
- [`enframe()`](https://tibble.tidyverse.org/dev/reference/enframe.md)
  and
  [`deframe()`](https://tibble.tidyverse.org/dev/reference/enframe.md)
  support arbitrary vectors
  ([\#730](https://github.com/tidyverse/tibble/issues/730)).
- [`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md) and
  [`tibble_row()`](https://tibble.tidyverse.org/dev/reference/tibble.md)
  ignore all columns that evaluate to `NULL`, not only those where a
  verbatim `NULL` is passed
  ([\#895](https://github.com/tidyverse/tibble/issues/895),
  [\#900](https://github.com/tidyverse/tibble/issues/900)).
- [`new_tibble()`](https://tibble.tidyverse.org/dev/reference/new_tibble.md)
  is now faster
  ([\#901](https://github.com/tidyverse/tibble/issues/901),
  [@mgirlich](https://github.com/mgirlich)).

### Internal

- Establish compatibility with rlang \> 0.4.11
  ([\#908](https://github.com/tidyverse/tibble/issues/908)).
- Use
  [`pillar::dim_desc()`](https://pillar.r-lib.org/reference/dim_desc.html)
  ([\#859](https://github.com/tidyverse/tibble/issues/859)).
- Establish compatibility with testthat \> 3.0.3
  ([\#896](https://github.com/tidyverse/tibble/issues/896),
  [@lionel-](https://github.com/lionel-)).
- Bump required versions of ellipsis and vctrs to avoid warning during
  package load.

## tibble 3.1.2

CRAN release: 2021-05-16

- Bump required versions of ellipsis and vctrs to avoid warning during
  package load.

## tibble 3.1.1

CRAN release: 2021-04-18

- [`num()`](https://tibble.tidyverse.org/dev/reference/num.md) and
  [`char()`](https://tibble.tidyverse.org/dev/reference/char.md) are
  reexported from pillar
  ([\#880](https://github.com/tidyverse/tibble/issues/880)).
- [`tribble()`](https://tibble.tidyverse.org/dev/reference/tribble.md)
  and
  [`frame_matrix()`](https://tibble.tidyverse.org/dev/reference/frame_matrix.md)
  give an error if values are named
  ([\#871](https://github.com/tidyverse/tibble/issues/871),
  [@lorenzwalthert](https://github.com/lorenzwalthert)).
- Document `cli.num_colors` option
  ([\#410](https://github.com/tidyverse/tibble/issues/410)).
- Fix
  [`new_tibble()`](https://tibble.tidyverse.org/dev/reference/new_tibble.md)
  examples for compatibility with pillar 1.6.0.

## tibble 3.1.0

CRAN release: 2021-02-25

### Bug fixes

- [`has_rownames()`](https://tibble.tidyverse.org/dev/reference/rownames.md)
  now works correctly for data frames with a `"row.names"` attribute
  malformed due to a problem in
  [`structure()`](https://rdrr.io/r/base/structure.html)
  ([\#852](https://github.com/tidyverse/tibble/issues/852)).

- `tbl[FALSE, "column"] <- x` adds new column again
  ([\#846](https://github.com/tidyverse/tibble/issues/846)).

### Features

- Importing pillar 1.5.0, cli and crayon are now suggested packages
  ([\#475](https://github.com/tidyverse/tibble/issues/475)).

- [`size_sum()`](https://pillar.r-lib.org/reference/type_sum.html) is
  now reexported from pillar
  ([\#850](https://github.com/tidyverse/tibble/issues/850),
  [@topepo](https://github.com/topepo)).

- [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  hints more often to use the `.name_repair` argument if column names
  are invalid ([\#855](https://github.com/tidyverse/tibble/issues/855)).

- [`as_tibble.table()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  mentions `.name_repair` argument in the error message
  ([\#839](https://github.com/tidyverse/tibble/issues/839)).

### Internal

- Remove compatibility code for pillar \< 1.5.0
  ([\#861](https://github.com/tidyverse/tibble/issues/861)).

- Moved most functions to the “stable” lifecycle
  ([\#860](https://github.com/tidyverse/tibble/issues/860)).

## tibble 3.0.6

CRAN release: 2021-01-29

- `vec_ptype_abbr.tbl_df()` and `type_sum.tbl_df()` now uses the name of
  the topmost class for subclasses of `"tbl_df"`
  ([\#843](https://github.com/tidyverse/tibble/issues/843)).
- Ignore errors in `formats.Rmd` vignette.
- Avoid tidy evaluation in pillar compatibility code.

## tibble 3.0.5

CRAN release: 2021-01-15

- Use testthat edition 3, compatible with testthat 3.0.1
  ([\#827](https://github.com/tidyverse/tibble/issues/827),
  [\#832](https://github.com/tidyverse/tibble/issues/832)).

## tibble 3.0.4

CRAN release: 2020-10-12

### Compatibility

- Establish compatibility with upcoming pillar 1.5.0
  ([\#818](https://github.com/tidyverse/tibble/issues/818)).

- [`tbl_sum()`](https://pillar.r-lib.org/reference/tbl_sum.html) shows
  “data frame” instead of “tibble” for objects inheriting from `"tbl"`
  but not `"tbl_df"`
  ([\#818](https://github.com/tidyverse/tibble/issues/818)).

- Register
  [`format.tbl()`](https://tibble.tidyverse.org/dev/reference/formatting.md)
  and
  [`print.tbl()`](https://tibble.tidyverse.org/dev/reference/formatting.md)
  methods only if pillar doesn’t
  ([\#816](https://github.com/tidyverse/tibble/issues/816)).

- Use
  [`vctrs::num_as_location()`](https://vctrs.r-lib.org/reference/vec_as_location.html)
  internally for subset assignment of rows and columns for better error
  messages ([\#746](https://github.com/tidyverse/tibble/issues/746)).

- Adapt tests to the development version of testthat.

### Bug fixes

- Fix documentation link to
  [`base::Extract`](https://rdrr.io/r/base/Extract.html).

- `add_row(df)` adds an empty row again
  ([\#809](https://github.com/tidyverse/tibble/issues/809),
  [@DavisVaughan](https://github.com/DavisVaughan)).

## tibble 3.0.3

CRAN release: 2020-07-10

- Fix test compatibility with rlang 0.4.7.

- Fix warning about `needs_dots` arguments with pillar \>= 1.4.5
  ([\#798](https://github.com/tidyverse/tibble/issues/798)).

## tibble 3.0.2

CRAN release: 2020-07-07

### Bug fixes

- `[[` works with classed indexes again, e.g. created with
  [`glue::glue()`](https://glue.tidyverse.org/reference/glue.html)
  ([\#778](https://github.com/tidyverse/tibble/issues/778)).

- [`add_column()`](https://tibble.tidyverse.org/dev/reference/add_column.md)
  works without warning for 0-column data frames
  ([\#786](https://github.com/tidyverse/tibble/issues/786)).

- [`tribble()`](https://tibble.tidyverse.org/dev/reference/tribble.md)
  now better handles named inputs
  ([\#775](https://github.com/tidyverse/tibble/issues/775)) and objects
  of non-vtrs classes like `lubridate::Period`
  ([\#784](https://github.com/tidyverse/tibble/issues/784)) and
  [`formattable::formattable`](https://renkun-ken.github.io/formattable/reference/formattable.html)
  ([\#785](https://github.com/tidyverse/tibble/issues/785)).

### Performance

- Subsetting and subassignment are faster
  ([\#780](https://github.com/tidyverse/tibble/issues/780),
  [\#790](https://github.com/tidyverse/tibble/issues/790),
  [\#794](https://github.com/tidyverse/tibble/issues/794)).

- [`is.null()`](https://rdrr.io/r/base/NULL.html) is preferred over
  `is_null()` for speed.

- Implement continuous benchmarking
  ([\#793](https://github.com/tidyverse/tibble/issues/793)).

### Compatibility

- `is_vector_s3()` is no longer reexported from pillar
  ([\#789](https://github.com/tidyverse/tibble/issues/789)).

## tibble 3.0.1

CRAN release: 2020-04-20

### Compatibility fixes

- `[<-.tbl_df()` coerces matrices to data frames
  ([\#762](https://github.com/tidyverse/tibble/issues/762)).

- Use delayed import for cli to work around unload problems in
  downstream packages
  ([\#754](https://github.com/tidyverse/tibble/issues/754)).

### Bug fixes

- More soft-deprecation warnings are actually visible.

- If `.name_repair` is a function, no repair messages are shown
  ([\#763](https://github.com/tidyverse/tibble/issues/763)).

- Remove superseded signal for
  [`as_tibble.list()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md),
  because
  [`as_tibble_row()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  only works for size 1.

### Enhancements

- `as_tibble(validate = )` now always triggers a deprecation warning.

- Subsetting and subassignment of rows with one-column matrices work
  again, with a deprecation warning
  ([\#760](https://github.com/tidyverse/tibble/issues/760)).

- Attempts to update a tibble row with an atomic vector give a clearer
  error message. Recycling message for subassignment appears only if
  target size is != 1.

- Tweak title of “Invariants” vignette.

## tibble 3.0.0

CRAN release: 2020-03-30

### Major breaking changes

- Subset assignment (“subassignment”) and also subsetting has become
  stricter. Symptoms:

  - Error: No common type for …

  - Error: Assigned data `...` must be compatible with …

  - `i` must have one dimension, not 2

  - Error: Lossy cast from … to …

  The “invariants” article at
  <https://tibble.tidyverse.org/dev/articles/invariants.html> describes
  the invariants that the operations follow in tibble, and the most
  important differences to data frames. We tried to make subsetting and
  subassignment as safe as possible, so that errors are caught early on,
  while introducing as little friction as possible.

- List classes are no longer automatically treated as vectors. Symptoms:

  - Error: All columns in a tibble must be vectors

  - Error: Expected a vector, not a `...` object

  If you implement a class that wraps a list as S3 vector, you need to
  include `"list"` in the class:

  ``` r
  structure(x, class = c("your_s3_class", "list"))
  ```

  Alternatively, implement a
  [`vec_proxy()`](https://vctrs.r-lib.org/reference/vec_proxy.html)
  method as described in
  <https://vctrs.r-lib.org/reference/vec_data.html>, or construct your
  class with
  [`list_of()`](https://vctrs.r-lib.org/reference/list_of.html).

- Added experimental support for inner names for all columns, of the
  form `tibble(a = c(b = 1))`. Inner names are no longer stripped when
  creating a tibble. They are maintained for slicing operations but not
  yet updated when assigning with a row subscript. This is a change that
  may break existing comparison tests that don’t expect names in columns
  ([\#630](https://github.com/tidyverse/tibble/issues/630)). Symptoms:

  - “names for target but not for current” when comparing

### Breaking changes

- [`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md) now
  splices anonymous data frames, `tibble(tibble(a = 1), b = a)` is
  equivalent to `tibble(a = 1, b = a)`. This means that `tibble(trees)`
  now has three columns, use `tibble(trees = trees)` if the intention is
  to create a packed data frame
  ([\#581](https://github.com/tidyverse/tibble/issues/581)).

- The `name-repair` help topic is gone, refer to
  [`?vctrs::vec_as_names`](https://vctrs.r-lib.org/reference/vec_as_names.html)
  instead.

- [`expression()`](https://rdrr.io/r/base/expression.html) columns are
  converted to lists as a workaround for lacking support in vctrs
  ([\#657](https://github.com/tidyverse/tibble/issues/657)).

- [`tribble()`](https://tibble.tidyverse.org/dev/reference/tribble.md)
  is now stricter when combining values. All values in a column must be
  compatible, otherwise an error occurs
  ([\#204](https://github.com/tidyverse/tibble/issues/204)). The
  criteria for wrapping in a list column are now based on vctrs
  principles: non-vectors or vectors with
  [`vctrs::vec_size()`](https://vctrs.r-lib.org/reference/vec_size.html)
  unequal 1 are wrapped in lists.

- `$` warns unconditionally if column not found, `[[` doesn’t warn.

- [`add_row()`](https://tibble.tidyverse.org/dev/reference/add_row.md)
  now uses
  [`vctrs::vec_rbind()`](https://vctrs.r-lib.org/reference/vec_bind.html)
  under the hood, this means that all columns are combined with
  [`vctrs::vec_c()`](https://vctrs.r-lib.org/reference/vec_c.html). In
  particular, factor columns will be converted to character if one of
  the columns is a character column.

### Soft deprecations

- Soft-deprecate `subclass` argument to
  [`new_tibble()`](https://tibble.tidyverse.org/dev/reference/new_tibble.md).

- Soft-deprecate
  [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  without arguments
  ([\#683](https://github.com/tidyverse/tibble/issues/683)).

- Preparing to move
  [`glimpse()`](https://pillar.r-lib.org/reference/glimpse.html) and
  [`tbl_sum()`](https://pillar.r-lib.org/reference/tbl_sum.html) to the
  pillar package. If your package implements these methods, please
  import the generics from pillar as soon as they become available
  there.

### Features

- Internals now make heavy use of the vctrs package, following most of
  the invariants defined there. Name repair is the responsibility of
  vctrs now ([\#464](https://github.com/tidyverse/tibble/issues/464)).

- All errors emitted directly by the package inherit from the
  `"tibble_error"` and `"rlang_error"` classes. In some cases,
  `"vctrs_error"` errors may be passed through. The exact subclass is
  subject to change.

  Example: `tibble(a = quote(b))` raises an error that inherits from
  `"tibble_error_column_must_be_vector"`, `"tibble_error"` and
  `"rlang_error"`, and from `"error"` and `"condition"` like all errors.
  Do not rely on the wording of `"tibble_error_column_must_be_vector"`,
  this is likely to change.

  Use the following pattern to catch errors emitted by tibble:

  ``` r
  tryCatch(
    your_code(),
    tibble_error = function(cnd) {
    }
  )
  ```

- New
  [`tibble_row()`](https://tibble.tidyverse.org/dev/reference/tibble.md)
  constructs tibbles that have exactly one row, or fails. Non-vector
  objects are automatically wrapped in a list, vectors (including lists)
  must have length one
  ([\#205](https://github.com/tidyverse/tibble/issues/205)).

- New
  [`as_tibble_row()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  and
  [`as_tibble_col()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  convert a bare vector to a one-row or one-column tibble, respectively.
  [`as_tibble_col()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  also works for non-bare vectors. Using
  [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  for bare vectors is superseded
  ([\#447](https://github.com/tidyverse/tibble/issues/447)).

- [`as_tibble.data.frame()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  uses implicit row names if asked to create a column from row names.
  This allows lossless direct conversion of matrices with row names to
  tibbles ([\#567](https://github.com/tidyverse/tibble/issues/567),
  [@stufield](https://github.com/stufield)).

- Implement `str.tbl_df()`
  ([\#480](https://github.com/tidyverse/tibble/issues/480)).

- [`tribble()`](https://tibble.tidyverse.org/dev/reference/tribble.md)
  now returns columns with `"unspecified"` type for 0-row tibbles.

- [`add_row()`](https://tibble.tidyverse.org/dev/reference/add_row.md)
  and
  [`add_column()`](https://tibble.tidyverse.org/dev/reference/add_column.md)
  now restore attributes to avoid errors when appending to sf objects or
  other tibble subclasses
  ([\#662](https://github.com/tidyverse/tibble/issues/662)).

- [`add_column()`](https://tibble.tidyverse.org/dev/reference/add_column.md)
  gains `.name_repair` argument. If not given, `.data` must have unique
  columns, with a deprecation message.

- Allow `POSIXlt` columns, they are now better supported by dplyr and
  other tools thanks to vctrs
  ([\#626](https://github.com/tidyverse/tibble/issues/626)).

- [`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md)
  ignores NULL arguments, named or unnamed
  ([\#580](https://github.com/tidyverse/tibble/issues/580)).

- [`view()`](https://tibble.tidyverse.org/dev/reference/view.md) works
  for remote data sources by applying the same strategy as
  [`print()`](https://rdrr.io/r/base/print.html) and
  [`glimpse()`](https://pillar.r-lib.org/reference/glimpse.html). The
  maximum number of rows in this case can be specified using the new `n`
  argument, by default it is taken from the new `"tibble.view_max"`
  option ([\#695](https://github.com/tidyverse/tibble/issues/695)).

### Output

- Formatting dimensions never uses scientific notation.

- [`glimpse()`](https://pillar.r-lib.org/reference/glimpse.html) uses
  “Rows” and “Columns” instead of “Variables” and “Observations”,
  because we’re not sure if the data is tidy here
  ([\#614](https://github.com/tidyverse/tibble/issues/614)).

- [`view()`](https://tibble.tidyverse.org/dev/reference/view.md) now
  uses the created (or passed) title argument
  ([\#610](https://github.com/tidyverse/tibble/issues/610),
  [@xvrdm](https://github.com/xvrdm)).

### Performance

- Construction and subsetting of large data frames is faster now
  ([\#717](https://github.com/tidyverse/tibble/issues/717),
  [@romainfrancois](https://github.com/romainfrancois)).

### Internal

- Import lifecycle package
  ([\#669](https://github.com/tidyverse/tibble/issues/669)).

- [`new_tibble()`](https://tibble.tidyverse.org/dev/reference/new_tibble.md)
  removes redundant subclasses from the `"class"` attribute.

- Using classed conditions. All classes start with `"tibble_error_"` and
  also contain `"tibble_error"`
  ([\#659](https://github.com/tidyverse/tibble/issues/659)).

- The magrittr pipe `%>%` is reexported.

## tibble 2.1.3

CRAN release: 2019-06-06

- Fix compatibility with R 3.5 and earlier, regression introduced in
  tibble 2.1.2.

## tibble 2.1.2

CRAN release: 2019-05-29

- Relax version requirements.

- Fix test failing after pillar upgrade.

## tibble 2.1.1

CRAN release: 2019-03-16

- Three dots are used even for `"unique"` name repair
  ([\#566](https://github.com/tidyverse/tibble/issues/566)).

- [`add_row()`](https://tibble.tidyverse.org/dev/reference/add_row.md),
  [`add_case()`](https://tibble.tidyverse.org/dev/reference/add_row.md)
  and
  [`add_column()`](https://tibble.tidyverse.org/dev/reference/add_column.md)
  now signal a warning once per session if the input is not a data frame
  ([\#575](https://github.com/tidyverse/tibble/issues/575)).

- Fix [`view()`](https://tibble.tidyverse.org/dev/reference/view.md) for
  the case when an object named `x` exists in the global environment
  ([\#579](https://github.com/tidyverse/tibble/issues/579)).

## tibble 2.0.1

CRAN release: 2019-01-12

- tibble names can again be set to `NULL` within RStudio, as some R
  routines within RStudio relied on this behaviour
  ([\#563](https://github.com/tidyverse/tibble/issues/563),
  [@kevinushey](https://github.com/kevinushey)).

- `as_tibble.matrix(validate = TRUE)` works again, with a lifecycle
  warning ([\#558](https://github.com/tidyverse/tibble/issues/558)).

- Replace `new_list_along()` by `rep_along()` to support rlang 0.3.1
  ([\#557](https://github.com/tidyverse/tibble/issues/557),
  [@lionel-](https://github.com/lionel-)).

## tibble 2.0.0

CRAN release: 2019-01-04

### Breaking changes

The [`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md)
and
[`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
functions, and the low-level
[`new_tibble()`](https://tibble.tidyverse.org/dev/reference/new_tibble.md)
constructor, have undergone a major overhaul to improve consistency. We
suspect that package code will be affected more than analysis code.

To improve compatibility with existing code, breaking changes were
reduced to a minimum and in some cases replaced with a warning that
appears once per session. Call `tibble:::scoped_lifecycle_errors()` when
updating your packages or scripts to the new semantics API to turn these
warnings into errors. The compatibility code will be removed in tibble
3.0.0.

- All optional arguments have moved past the ellipsis, and must be
  specified as named arguments. This affects mostly the `n` argument to
  [`as_tibble.table()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md),
  passing `n` unnamed still works (with a warning).

- [`new_tibble()`](https://tibble.tidyverse.org/dev/reference/new_tibble.md)
  has been optimized for performance, the function no longer strips
  dimensions from 1d arrays and no longer checks correctness of names or
  column lengths. (It still checks if the object is named, except for
  zero-length input.) Use the new
  [`validate_tibble()`](https://tibble.tidyverse.org/dev/reference/new_tibble.md)
  if you need these checks
  ([\#471](https://github.com/tidyverse/tibble/issues/471)).

- The `nrow` argument to
  [`new_tibble()`](https://tibble.tidyverse.org/dev/reference/new_tibble.md)
  is now mandatory. The `class` argument replaces the now deprecated
  `subclass` argument, the latter will be supported quietly for some
  time ([\#518](https://github.com/tidyverse/tibble/issues/518)).

- Setting names on a tibble via `names(df) <- ...` now also requires
  minimal names, otherwise a warning is issued once per session
  ([\#466](https://github.com/tidyverse/tibble/issues/466)).

- In
  [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md),
  checking names is also enabled by default, even for tibbles, matrices
  and other matrix-like objects: names must exist, `NA` names are not
  allowed. Coercing a matrix without column names will trigger a warning
  once per session. (This corresponds to the `"minimal"` checks
  described below.).

- The `validate` argument to
  [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  has been deprecated, see below for alternatives. (The
  `as_tibble.tbl_df()` method has been removed, the
  [`as_tibble.data.frame()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  method will be used for tibbles.)

- [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  always checks that all columns are 1D or 2D vectors and not of type
  `POSIXlt`, even with `validate = FALSE` (which is now deprecated).

- Calling
  [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  on a vector now warns once per session. Use `enframe(name = NULL)` for
  converting a vector to a one-column tibble, or
  [`enframe()`](https://tibble.tidyverse.org/dev/reference/enframe.md)
  for converting a named vector to a two-column tibble.

- [`data_frame()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)
  and
  [`frame_data()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)
  are soft-deprecated, please use
  [`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md) or
  [`tribble()`](https://tibble.tidyverse.org/dev/reference/tribble.md)
  ([\#111](https://github.com/tidyverse/tibble/issues/111)).

- [`tibble_()`](https://tibble.tidyverse.org/dev/reference/deprecated.md),
  [`data_frame_()`](https://tibble.tidyverse.org/dev/reference/deprecated.md),
  and
  [`lst_()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)
  are soft-deprecated. Please use
  [`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md) or
  [`lst()`](https://tibble.tidyverse.org/dev/reference/lst.md)
  ([\#111](https://github.com/tidyverse/tibble/issues/111),
  [\#509](https://github.com/tidyverse/tibble/issues/509)).

- [`as.tibble()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)
  and
  [`as_data_frame()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)
  are officially deprecated and not generic anymore, please
  use/implement
  [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  ([\#111](https://github.com/tidyverse/tibble/issues/111)).

- [`as_tibble.data.frame()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  (and also
  [`as_tibble.matrix()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md))
  strip row names by default. Code that relies on tibbles keeping row
  names now will see:

  - a different result when calling
    [`rownames()`](https://tibble.tidyverse.org/dev/reference/rownames.md)
    or [`row.names()`](https://rdrr.io/r/base/row.names.html),
  - rows full of `NA` values when subsetting rows with with a character
    vector, e.g. `as_tibble(mtcars)["Mazda RX4", ]`.

  Call `pkgconfig::set_config("tibble::rownames", NA)` to revert to the
  old behavior of keeping row names. Packages that import *tibble* can
  call `set_config()` in their `.onLoad()` function
  ([\#114](https://github.com/tidyverse/tibble/issues/114)).

- [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  drops extra classes, in particular `as_tibble.grouped_df()` now
  removes grouping
  ([\#535](https://github.com/tidyverse/tibble/issues/535)).

- [`column_to_rownames()`](https://tibble.tidyverse.org/dev/reference/rownames.md)
  now always coerces to a data frame, because row names are no longer
  supported in tibbles
  ([\#114](https://github.com/tidyverse/tibble/issues/114)).

- In all `*_rownames()` functions, the first argument has been renamed
  to `.data` for consistency
  ([\#412](https://github.com/tidyverse/tibble/issues/412)).

- Subsetting one row with `[..., , drop = TRUE]` returns a tibble
  ([\#442](https://github.com/tidyverse/tibble/issues/442)).

- The
  [`print.tbl_df()`](https://tibble.tidyverse.org/dev/reference/formatting.md)
  method has been removed, the
  [`print.tbl()`](https://tibble.tidyverse.org/dev/reference/formatting.md)
  method handles printing
  ([\#519](https://github.com/tidyverse/tibble/issues/519)).

### New features

- [`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md)
  supports columns that are matrices or data frames
  ([\#416](https://github.com/tidyverse/tibble/issues/416)).

- The new `.rows` argument to
  [`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md) and
  [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  allows specifying the expected number of rows explicitly, even if it’s
  evident from the data. This allows writing more defensive code.

- Column name repair has more direct support, via the new `.name_repair`
  argument to
  [`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md) and
  [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md).
  It takes the following values:

  - `"minimal"`: No name repair or checks, beyond basic existence.
  - `"unique"`: Make sure names are unique and not empty.
  - `"check_unique"`: (default value), no name repair, but check they
    are `unique`.
  - `"universal"`: Make the names `unique` and syntactic.
  - a function: apply custom name repair (e.g.,
    `.name_repair = make.names` or
    `.name_repair = ~make.names(., unique = TRUE)` for names in the
    style of base R).

  The `validate` argument of
  [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  is deprecated but supported (emits a message once per session). Use
  `.name_repair = "minimal"` instead of `validate = FALSE`, and
  `.name_repair = "check_unique"` instead of `validate = TRUE`. If you
  need to support older versions of tibble, pass both `.name_repair` and
  `validate` arguments in a consistent way, no message will be emitted
  in this case ([\#469](https://github.com/tidyverse/tibble/issues/469),
  [@jennybc](https://github.com/jennybc)).

- Row name handling is stricter. Row names are never (and never were)
  supported in
  [`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md) and
  [`new_tibble()`](https://tibble.tidyverse.org/dev/reference/new_tibble.md),
  and are now stripped by default in
  [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md).
  The `rownames` argument to
  [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  supports:

  - `NULL`: remove row names (default),
  - `NA`: keep row names,
  - A string: the name of the new column that will contain the existing
    row names, which are no longer present in the result.

  The old default can be restored by calling
  `pkgconfig::set_config("tibble::rownames", NA)`, this also works for
  packages that import *tibble*.

- [`new_tibble()`](https://tibble.tidyverse.org/dev/reference/new_tibble.md)
  and
  [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  now also strip the `"dim"` attribute from columns that are
  one-dimensional arrays.
  ([`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md)
  already did this before.)

- Internally, all
  [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  implementation forward all extra arguments and `...` to
  [`as_tibble.list()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  where they are handled. This means that the common `.rows` and
  `.name_repair` can be used for all inputs. We suggest that your
  implementations of this method do the same.

- [`enframe()`](https://tibble.tidyverse.org/dev/reference/enframe.md)
  (with `name = NULL`) and
  [`deframe()`](https://tibble.tidyverse.org/dev/reference/enframe.md)
  now support one-column tibbles
  ([\#449](https://github.com/tidyverse/tibble/issues/449)).

- Improved S4 support by adding `exportClass(tbl_df)` to `NAMESPACE`
  ([\#436](https://github.com/tidyverse/tibble/issues/436),
  [@jeffreyhanson](https://github.com/jeffreyhanson) and
  [@javierfajnolla](https://github.com/javierfajnolla)).

- New
  [`validate_tibble()`](https://tibble.tidyverse.org/dev/reference/new_tibble.md)
  checks a tibble for internal consistency
  ([\#471](https://github.com/tidyverse/tibble/issues/471)).

- Bring error message for invalid column type in line with allowed
  matrix/df cols
  ([\#465](https://github.com/tidyverse/tibble/issues/465),
  [@maxheld83](https://github.com/maxheld83)).

### New functions

- Added experimental
  [`view()`](https://tibble.tidyverse.org/dev/reference/view.md)
  function that always returns its input invisibly and calls
  [`utils::View()`](https://rdrr.io/r/utils/View.html) only in
  interactive mode
  ([\#373](https://github.com/tidyverse/tibble/issues/373)).

### Output

- The
  [`set_tidy_names()`](https://tibble.tidyverse.org/dev/reference/name-repair-superseded.md)
  and
  [`tidy_names()`](https://tibble.tidyverse.org/dev/reference/name-repair-superseded.md)
  helpers the list of new names using a bullet list with at most six
  items ([\#406](https://github.com/tidyverse/tibble/issues/406)).

- A one-character ellipse (`cli::symbol$ellipsis`) is printed instead of
  `"..."` where available, this affects
  [`glimpse()`](https://pillar.r-lib.org/reference/glimpse.html) output
  and truncated lists
  ([\#403](https://github.com/tidyverse/tibble/issues/403)).

- Column names and types are now formatted identically with
  [`glimpse()`](https://pillar.r-lib.org/reference/glimpse.html) and
  [`print.tbl_df()`](https://tibble.tidyverse.org/dev/reference/formatting.md).

- [`tidy_names()`](https://tibble.tidyverse.org/dev/reference/name-repair-superseded.md)
  quotes variable names when reporting on repair
  ([\#407](https://github.com/tidyverse/tibble/issues/407)).

- All error messages now follow the tidyverse style guide
  ([\#223](https://github.com/tidyverse/tibble/issues/223)).

- [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  prints an informative error message when using the `rownames` argument
  and the input data frame or matrix does not have row names
  ([\#388](https://github.com/tidyverse/tibble/issues/388),
  [@anhqle](https://github.com/anhqle)).

- [`column_to_rownames()`](https://tibble.tidyverse.org/dev/reference/rownames.md)
  uses the real variable name in its error message
  ([\#399](https://github.com/tidyverse/tibble/issues/399),
  [@alexwhan](https://github.com/alexwhan)).

- Lazy tibbles with exactly 10 rows no longer show “…with more rows”
  ([\#371](https://github.com/tidyverse/tibble/issues/371)).

- [`glimpse()`](https://pillar.r-lib.org/reference/glimpse.html) shows
  information obtained from
  [`tbl_sum()`](https://pillar.r-lib.org/reference/tbl_sum.html),
  e.g. grouping information for `grouped_df` from dplyr
  ([\#550](https://github.com/tidyverse/tibble/issues/550)).

### Bug fixes

- [`glimpse()`](https://pillar.r-lib.org/reference/glimpse.html) takes
  coloring into account when computing column width, the output is no
  longer truncated prematurely when coloring is enabled.

- [`glimpse()`](https://pillar.r-lib.org/reference/glimpse.html)
  disambiguates outputs for factors if the levels contain commas
  ([\#384](https://github.com/tidyverse/tibble/issues/384),
  [@anhqle](https://github.com/anhqle)).

- [`print.tbl_df()`](https://tibble.tidyverse.org/dev/reference/formatting.md)
  with a negative value for `n` behaves as if `n` was omitted
  ([\#371](https://github.com/tidyverse/tibble/issues/371)).

- Fixed output for extra column names that contain spaces.

### Internal

- Skip dplyr in tests if unavailable
  ([\#420](https://github.com/tidyverse/tibble/issues/420),
  [@QuLogic](https://github.com/QuLogic)).

- Skip mockr in tests if unavailable
  ([\#454](https://github.com/tidyverse/tibble/issues/454),
  [@Enchufa2](https://github.com/Enchufa2)).

- Use
  [`fansi::strwrap_ctl()`](https://rdrr.io/pkg/fansi/man/strwrap_ctl.html)
  instead of own string wrapping routine.

- [`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md)
  uses recycled values during construction but unrecycled values for
  validation.

- [`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md) is
  now faster for very wide tibbles.

- Subsetting with the `[` operator is faster
  ([\#544](https://github.com/tidyverse/tibble/issues/544)).

- Avoid use of [`stop()`](https://rdrr.io/r/base/stop.html) in examples
  if packages are not installed
  ([\#453](https://github.com/tidyverse/tibble/issues/453),
  [@Enchufa2](https://github.com/Enchufa2)).

- Fix
  [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  examples by using correct argument names in
  [`requireNamespace()`](https://rdrr.io/r/base/ns-load.html) call
  ([\#424](https://github.com/tidyverse/tibble/issues/424),
  [@michaelweylandt](https://github.com/michaelweylandt)).

- [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  checks column length only once
  ([\#365](https://github.com/tidyverse/tibble/issues/365),
  [@anhqle](https://github.com/anhqle)).

- Using [`rlang::list2()`](https://rlang.r-lib.org/reference/list2.html)
  ([\#391](https://github.com/tidyverse/tibble/issues/391),
  [@lionel-](https://github.com/lionel-)).

## tibble 1.4.2

CRAN release: 2018-01-22

### Bug fixes

- Fix OS X builds.
- The `tibble.width` option is honored again
  ([\#369](https://github.com/tidyverse/tibble/issues/369)).
- `tbl[1, , drop = TRUE]` now behaves identically to data frames
  ([\#367](https://github.com/tidyverse/tibble/issues/367)).
- Fix error message when accessing columns using a logical index vector
  ([\#337](https://github.com/tidyverse/tibble/issues/337),
  [@mundl](https://github.com/mundl)).
- [`glimpse()`](https://pillar.r-lib.org/reference/glimpse.html) returns
  its input for zero-column data frames.

### Features

- `enframe(NULL)` now returns the same as `enframe(logical())`
  ([\#352](https://github.com/tidyverse/tibble/issues/352)).
- [`tribble()`](https://tibble.tidyverse.org/dev/reference/tribble.md)
  now ignores trailing commas
  ([\#342](https://github.com/tidyverse/tibble/issues/342),
  [@anhqle](https://github.com/anhqle)).
- Updated vignettes and website documentation.

### Performance

- Faster printing of very wide tibbles
  ([\#360](https://github.com/tidyverse/tibble/issues/360)).
- Faster construction and subsetting for tibbles
  ([\#353](https://github.com/tidyverse/tibble/issues/353)).
- Only call [`nrow()`](https://rdrr.io/r/base/nrow.html) and
  [`head()`](https://rdrr.io/r/utils/head.html) in
  [`glimpse()`](https://pillar.r-lib.org/reference/glimpse.html), not
  [`ncol()`](https://rdrr.io/r/base/nrow.html).

## tibble 1.4.1

CRAN release: 2017-12-25

### New formatting

The new pillar package is now responsible for formatting tibbles. Pillar
will try to display as many columns as possible, if necessary truncating
or shortening the output. Colored output highlights important
information and guides the eye. The vignette in the tibble package
describes how to adapt custom data types for optimal display in a
tibble.

### New features

- Make
  [`add_case()`](https://tibble.tidyverse.org/dev/reference/add_row.md)
  an alias for
  [`add_row()`](https://tibble.tidyverse.org/dev/reference/add_row.md)
  ([\#324](https://github.com/tidyverse/tibble/issues/324),
  [@LaDilettante](https://github.com/LaDilettante)).
- [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  gains `rownames` argument
  ([\#288](https://github.com/tidyverse/tibble/issues/288),
  [\#289](https://github.com/tidyverse/tibble/issues/289)).
- [`as_tibble.matrix()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  repairs column names.
- Tibbles now support character subsetting
  ([\#312](https://github.com/tidyverse/tibble/issues/312)).
- [`` `[.tbl_df`() ``](https://tibble.tidyverse.org/dev/reference/subsetting.md)
  supports `drop = TRUE` and omits the warning if `j` is passed. The
  calls `df[i, j, drop = TRUE]` and `df[j, drop = TRUE]` are now
  compatible with data frames again
  ([\#307](https://github.com/tidyverse/tibble/issues/307),
  [\#311](https://github.com/tidyverse/tibble/issues/311)).

### Bug fixes

- Improved compatibility with remote data sources for
  [`glimpse()`](https://pillar.r-lib.org/reference/glimpse.html)
  ([\#328](https://github.com/tidyverse/tibble/issues/328)).
- Logical indexes are supported, a warning is raised if the length does
  not match the number of rows or 1
  ([\#318](https://github.com/tidyverse/tibble/issues/318)).
- Fixed width for word wrapping of the extra information
  ([\#301](https://github.com/tidyverse/tibble/issues/301)).
- Prevent
  [`add_column()`](https://tibble.tidyverse.org/dev/reference/add_column.md)
  from dropping classes and attributes by removing the use of
  [`cbind()`](https://rdrr.io/r/base/cbind.html). Additionally this
  ensures that
  [`add_column()`](https://tibble.tidyverse.org/dev/reference/add_column.md)
  can be used with grouped data frames
  ([\#303](https://github.com/tidyverse/tibble/issues/303),
  [@DavisVaughan](https://github.com/DavisVaughan)).
- [`add_column()`](https://tibble.tidyverse.org/dev/reference/add_column.md)
  to an empty zero-row tibble with a variable of nonzero length now
  produces a correct error message
  ([\#319](https://github.com/tidyverse/tibble/issues/319)).

### Internal changes

- Reexporting
  [`has_name()`](https://rlang.r-lib.org/reference/has_name.html) from
  rlang, instead of forwarding, to avoid warning when importing both
  rlang and tibble.
- Compatible with R 3.1
  ([\#323](https://github.com/tidyverse/tibble/issues/323)).
- Remove Rcpp dependency
  ([\#313](https://github.com/tidyverse/tibble/issues/313),
  [@patperry](https://github.com/patperry)).

## tibble 1.3.4

CRAN release: 2017-08-22

### Bug fixes

- Values of length 1 in a
  [`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md)
  call are recycled prior to evaluating subsequent arguments, improving
  consistency with
  [`mutate()`](https://dplyr.tidyverse.org/reference/mutate.html)
  ([\#213](https://github.com/tidyverse/tibble/issues/213)).
- Recycling of values of length 1 in a
  [`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md)
  call maintains their class
  ([\#284](https://github.com/tidyverse/tibble/issues/284)).
- [`add_row()`](https://tibble.tidyverse.org/dev/reference/add_row.md)
  now always preserves the column data types of the input data frame the
  same way as [`rbind()`](https://rdrr.io/r/base/cbind.html) does
  ([\#296](https://github.com/tidyverse/tibble/issues/296)).
- [`lst()`](https://tibble.tidyverse.org/dev/reference/lst.md) now again
  handles duplicate names, the value defined last is used in case of a
  clash.
- Adding columns to zero-row data frames now also works when mixing
  lengths 1 and 0 in the new columns
  ([\#167](https://github.com/tidyverse/tibble/issues/167)).
- The `validate` argument is now also supported in `as_tibble.tbl_df()`,
  with default to `FALSE`
  ([\#278](https://github.com/tidyverse/tibble/issues/278)). It must be
  passed as named argument, as in `as_tibble(validate = TRUE)`.

### Formatting

- `format_v()` now always surrounds lists with `[]` brackets, even if
  their length is one. This affects
  [`glimpse()`](https://pillar.r-lib.org/reference/glimpse.html) output
  for list columns
  ([\#106](https://github.com/tidyverse/tibble/issues/106)).
- Factor levels are escaped when printing
  ([\#277](https://github.com/tidyverse/tibble/issues/277)).
- Non-syntactic names are now also escaped in
  [`glimpse()`](https://pillar.r-lib.org/reference/glimpse.html)
  ([\#280](https://github.com/tidyverse/tibble/issues/280)).
- [`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md)
  gives a consistent error message in the case of duplicate column names
  ([\#291](https://github.com/tidyverse/tibble/issues/291)).

## tibble 1.3.3

CRAN release: 2017-05-28

### Bug fixes

- Added [`format()`](https://rdrr.io/r/base/format.html) and
  [`print()`](https://rdrr.io/r/base/print.html) methods for both `tbl`
  and `tbl_df` classes, to protect against malformed tibbles that
  inherit from `"tbl_df"` but not `"tbl"`, as created e.g. by
  [`ungroup()`](https://dplyr.tidyverse.org/reference/group_by.html) in
  dplyr 0.5.0 and earlier
  ([\#256](https://github.com/tidyverse/tibble/issues/256),
  [\#263](https://github.com/tidyverse/tibble/issues/263)).
- The column width for non-syntactic columns is computed correctly again
  ([\#258](https://github.com/tidyverse/tibble/issues/258)).
- Printing a tibble doesn’t apply quote escaping to list columns.
- Fix error in `tidy_names(syntactic = TRUE, quiet = FALSE)` if not all
  names are fixed
  ([\#260](https://github.com/tidyverse/tibble/issues/260),
  [@imanuelcostigan](https://github.com/imanuelcostigan)).
- Remove unused import declaration for assertthat.

## tibble 1.3.1

CRAN release: 2017-05-17

### Bug fixes

- Subsetting zero columns no longer returns wrong number of rows
  ([\#241](https://github.com/tidyverse/tibble/issues/241),
  [@echasnovski](https://github.com/echasnovski)).

### Interface changes

- New
  [`set_tidy_names()`](https://tibble.tidyverse.org/dev/reference/name-repair-superseded.md)
  and
  [`tidy_names()`](https://tibble.tidyverse.org/dev/reference/name-repair-superseded.md),
  a simpler version of
  [`repair_names()`](https://tibble.tidyverse.org/dev/reference/name-repair-superseded.md)
  which works unchanged for now
  ([\#217](https://github.com/tidyverse/tibble/issues/217)).
- New
  [`rowid_to_column()`](https://tibble.tidyverse.org/dev/reference/rownames.md)
  that adds a `rowid` column as first column and removes row names
  ([\#243](https://github.com/tidyverse/tibble/issues/243),
  [@barnettjacob](https://github.com/barnettjacob)).
- The `all.equal.tbl_df()` method has been removed, calling
  [`all.equal()`](https://rdrr.io/r/base/all.equal.html) now forwards to
  `base::all.equal.data.frame()`. To compare tibbles ignoring row and
  column order, please use
  [`dplyr::all_equal()`](https://dplyr.tidyverse.org/reference/all_equal.html)
  ([\#247](https://github.com/tidyverse/tibble/issues/247)).

### Formatting

- Printing now uses `x` again instead of the Unicode multiplication
  sign, to avoid encoding issues
  ([\#216](https://github.com/tidyverse/tibble/issues/216)).
- String values are now quoted when printing if they contain
  non-printable characters or quotes
  ([\#253](https://github.com/tidyverse/tibble/issues/253)).
- The [`print()`](https://rdrr.io/r/base/print.html),
  [`format()`](https://rdrr.io/r/base/format.html), and
  [`tbl_sum()`](https://pillar.r-lib.org/reference/tbl_sum.html) methods
  are now implemented for class `"tbl"` and not for `"tbl_df"`. This
  allows subclasses to use tibble’s formatting facilities. The
  formatting of the header can be tweaked by implementing
  [`tbl_sum()`](https://pillar.r-lib.org/reference/tbl_sum.html) for the
  subclass, which is expected to return a named character vector. The
  [`print.tbl_df()`](https://tibble.tidyverse.org/dev/reference/formatting.md)
  method is still implemented for compatibility with downstream
  packages, but only calls
  [`NextMethod()`](https://rdrr.io/r/base/UseMethod.html).
- Own printing routine, not relying on
  [`print.data.frame()`](https://rdrr.io/r/base/print.dataframe.html)
  anymore. Now providing
  [`format.tbl_df()`](https://tibble.tidyverse.org/dev/reference/formatting.md)
  and full support for Unicode characters in names and data, also for
  [`glimpse()`](https://pillar.r-lib.org/reference/glimpse.html)
  ([\#235](https://github.com/tidyverse/tibble/issues/235)).

### Misc

- Improve formatting of error messages
  ([\#223](https://github.com/tidyverse/tibble/issues/223)).
- Using `rlang` instead of `lazyeval`
  ([\#225](https://github.com/tidyverse/tibble/issues/225),
  [@lionel-](https://github.com/lionel-)), and `rlang` functions
  ([\#244](https://github.com/tidyverse/tibble/issues/244)).
- [`tribble()`](https://tibble.tidyverse.org/dev/reference/tribble.md)
  now handles values that have a class
  ([\#237](https://github.com/tidyverse/tibble/issues/237),
  [@NikNakk](https://github.com/NikNakk)).
- Minor efficiency gains by replacing `any(is.na())` with
  [`anyNA()`](https://rdrr.io/r/base/NA.html)
  ([\#229](https://github.com/tidyverse/tibble/issues/229),
  [@csgillespie](https://github.com/csgillespie)).
- The `microbenchmark` package is now used conditionally
  ([\#245](https://github.com/tidyverse/tibble/issues/245)).
- `pkgdown` website.

## tibble 1.3.0

CRAN release: 2017-04-01

### Bug fixes

- Time series matrices (objects of class `mts` and `ts`) are now
  supported in
  [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  ([\#184](https://github.com/tidyverse/tibble/issues/184)).
- The
  [`all_equal()`](https://dplyr.tidyverse.org/reference/all_equal.html)
  function (called by `all.equal.tbl_df()`) now forwards to `dplyr` and
  fails with a helpful message if not installed. Data frames with list
  columns cannot be compared anymore, and differences in the declared
  class (`data.frame` vs. `tbl_df`) are ignored. The
  `all.equal.tbl_df()` method gives a warning and forwards to
  [`NextMethod()`](https://rdrr.io/r/base/UseMethod.html) if `dplyr` is
  not installed; call `all.equal(as.data.frame(...), ...)` to avoid the
  warning. This ensures consistent behavior of this function, regardless
  if `dplyr` is loaded or not
  ([\#198](https://github.com/tidyverse/tibble/issues/198)).

### Interface changes

- Now requiring R 3.1.0 instead of R 3.1.3
  ([\#189](https://github.com/tidyverse/tibble/issues/189)).
- Add
  [`as.tibble()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)
  as an alias to
  [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  ([\#160](https://github.com/tidyverse/tibble/issues/160),
  [@LaDilettante](https://github.com/LaDilettante)).
- New
  [`frame_matrix()`](https://tibble.tidyverse.org/dev/reference/frame_matrix.md),
  similar to
  [`frame_data()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)
  but for matrices
  ([\#140](https://github.com/tidyverse/tibble/issues/140),
  [\#168](https://github.com/tidyverse/tibble/issues/168),
  [@LaDilettante](https://github.com/LaDilettante)).
- New
  [`deframe()`](https://tibble.tidyverse.org/dev/reference/enframe.md)
  as reverse operation to
  [`enframe()`](https://tibble.tidyverse.org/dev/reference/enframe.md)
  ([\#146](https://github.com/tidyverse/tibble/issues/146),
  [\#214](https://github.com/tidyverse/tibble/issues/214)).
- Removed unused dependency on `assertthat`.

### Features

#### General

- Keep column classes when adding row to empty tibble
  ([\#171](https://github.com/tidyverse/tibble/issues/171),
  [\#177](https://github.com/tidyverse/tibble/issues/177),
  [@LaDilettante](https://github.com/LaDilettante)).
- Singular and plural variants for error messages that mention a list of
  objects ([\#116](https://github.com/tidyverse/tibble/issues/116),
  [\#138](https://github.com/tidyverse/tibble/issues/138),
  [@LaDilettante](https://github.com/LaDilettante)).
- [`add_column()`](https://tibble.tidyverse.org/dev/reference/add_column.md)
  can add columns of length 1
  ([\#162](https://github.com/tidyverse/tibble/issues/162),
  [\#164](https://github.com/tidyverse/tibble/issues/164),
  [@LaDilettante](https://github.com/LaDilettante)).

#### Input validation

- An attempt to read or update a missing column now throws a clearer
  warning ([\#199](https://github.com/tidyverse/tibble/issues/199)).
- An attempt to call
  [`add_row()`](https://tibble.tidyverse.org/dev/reference/add_row.md)
  for a grouped data frame results in a helpful error message
  ([\#179](https://github.com/tidyverse/tibble/issues/179)).

#### Printing

- Render Unicode multiplication sign as `x` if it cannot be represented
  in the current locale
  ([\#192](https://github.com/tidyverse/tibble/issues/192),
  [@ncarchedi](https://github.com/ncarchedi)).
- Backtick `NA` names in printing
  ([\#206](https://github.com/tidyverse/tibble/issues/206),
  [\#207](https://github.com/tidyverse/tibble/issues/207),
  [@jennybc](https://github.com/jennybc)).
- [`glimpse()`](https://pillar.r-lib.org/reference/glimpse.html) now
  uses [`type_sum()`](https://pillar.r-lib.org/reference/type_sum.html)
  also for S3 objects
  ([\#185](https://github.com/tidyverse/tibble/issues/185),
  [\#186](https://github.com/tidyverse/tibble/issues/186),
  [@holstius](https://github.com/holstius)).
- The `max.print` option is ignored when printing a tibble
  ([\#194](https://github.com/tidyverse/tibble/issues/194),
  [\#195](https://github.com/tidyverse/tibble/issues/195),
  [@t-kalinowski](https://github.com/t-kalinowski)).

### Documentation

- Fix typo in `obj_sum` documentation
  ([\#193](https://github.com/tidyverse/tibble/issues/193),
  [@etiennebr](https://github.com/etiennebr)).
- Reword documentation for
  [`tribble()`](https://tibble.tidyverse.org/dev/reference/tribble.md)
  ([\#191](https://github.com/tidyverse/tibble/issues/191),
  [@kwstat](https://github.com/kwstat)).
- Now explicitly stating minimum Rcpp version 0.12.3.

### Internal

- Using registration of native routines.

## tibble 1.2

CRAN release: 2016-08-26

### Bug fixes

- The `tibble.width` option is used for
  [`glimpse()`](https://pillar.r-lib.org/reference/glimpse.html) only if
  it is finite ([\#153](https://github.com/tidyverse/tibble/issues/153),
  [@kwstat](https://github.com/kwstat)).
- New `as_tibble.poly()` to support conversion of a `poly` object to a
  tibble ([\#110](https://github.com/tidyverse/tibble/issues/110)).
- [`add_row()`](https://tibble.tidyverse.org/dev/reference/add_row.md)
  now correctly handles existing columns of type `list` that are not
  updated ([\#148](https://github.com/tidyverse/tibble/issues/148)).
- [`all.equal()`](https://rdrr.io/r/base/all.equal.html) doesn’t throw
  an error anymore if one of the columns is named `na.last`,
  `decreasing` or `method`
  ([\#107](https://github.com/tidyverse/tibble/issues/107),
  [@BillDunlap](https://github.com/BillDunlap)).

### Interface changes

- New
  [`add_column()`](https://tibble.tidyverse.org/dev/reference/add_column.md),
  analogously to
  [`add_row()`](https://tibble.tidyverse.org/dev/reference/add_row.md)
  ([\#99](https://github.com/tidyverse/tibble/issues/99)).
- [`print.tbl_df()`](https://tibble.tidyverse.org/dev/reference/formatting.md)
  gains `n_extra` method and will have the same interface as
  [`trunc_mat()`](https://tibble.tidyverse.org/dev/reference/trunc_mat.md)
  from now on.
- [`add_row()`](https://tibble.tidyverse.org/dev/reference/add_row.md)
  and
  [`add_column()`](https://tibble.tidyverse.org/dev/reference/add_column.md)
  gain `.before` and `.after` arguments which indicate the row (by
  number) or column (by number or name) before or after which the new
  data are inserted. Updated or added columns cannot be named `.before`
  or `.after` ([\#99](https://github.com/tidyverse/tibble/issues/99)).
- Rename
  [`frame_data()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)
  to
  [`tribble()`](https://tibble.tidyverse.org/dev/reference/tribble.md),
  stands for “transposed tibble”. The former is still available as alias
  ([\#132](https://github.com/tidyverse/tibble/issues/132),
  [\#143](https://github.com/tidyverse/tibble/issues/143)).

### Features

- [`add_row()`](https://tibble.tidyverse.org/dev/reference/add_row.md)
  now can add multiple rows, with recycling
  ([\#142](https://github.com/tidyverse/tibble/issues/142),
  [@jennybc](https://github.com/jennybc)).
- Use multiply character `×` instead of `x` when printing dimensions
  ([\#126](https://github.com/tidyverse/tibble/issues/126)). Output
  tests had to be disabled for this on Windows.
- Back-tick non-semantic column names on output
  ([\#131](https://github.com/tidyverse/tibble/issues/131)).
- Use `dttm` instead of `time` for `POSIXt` values
  ([\#133](https://github.com/tidyverse/tibble/issues/133)), which is
  now used for columns of the `difftime` class.
- Better output for 0-row results when total number of rows is unknown
  (e.g., for SQL data sources).

### Documentation

- New object summary vignette that shows which methods to define for
  custom vector classes to be used as tibble columns
  ([\#151](https://github.com/tidyverse/tibble/issues/151)).
- Added more examples for
  [`print.tbl_df()`](https://tibble.tidyverse.org/dev/reference/formatting.md),
  now using data from `nycflights13` instead of `Lahman`
  ([\#121](https://github.com/tidyverse/tibble/issues/121)), with
  guidance to install `nycflights13` package if necessary
  ([\#152](https://github.com/tidyverse/tibble/issues/152)).
- Minor changes in vignette
  ([\#115](https://github.com/tidyverse/tibble/issues/115),
  [@helix123](https://github.com/helix123)).

## tibble 1.1

CRAN release: 2016-07-04

Follow-up release.

### Breaking changes

- [`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md) is
  no longer an alias for
  [`frame_data()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)
  ([\#82](https://github.com/tidyverse/tibble/issues/82)).
- Remove
  [`tbl_df()`](https://tibble.tidyverse.org/dev/reference/tbl_df-class.md)
  ([\#57](https://github.com/tidyverse/tibble/issues/57)).
- `$` returns `NULL` if column not found, without partial matching. A
  warning is given
  ([\#109](https://github.com/tidyverse/tibble/issues/109)).
- `[[` returns `NULL` if column not found
  ([\#109](https://github.com/tidyverse/tibble/issues/109)).

### Output

- Reworked output: More concise summary (begins with hash `#` and
  contains more text
  ([\#95](https://github.com/tidyverse/tibble/issues/95))), removed
  empty line, showing number of hidden rows and columns
  ([\#51](https://github.com/tidyverse/tibble/issues/51)). The trailing
  metadata also begins with hash `#`
  ([\#101](https://github.com/tidyverse/tibble/issues/101)). Presence of
  row names is indicated by a star in printed output
  ([\#72](https://github.com/tidyverse/tibble/issues/72)).
- Format `NA` values in character columns as `<NA>`, like
  [`print.data.frame()`](https://rdrr.io/r/base/print.dataframe.html)
  does ([\#69](https://github.com/tidyverse/tibble/issues/69)).
- The number of printed extra cols is now an option
  ([\#68](https://github.com/tidyverse/tibble/issues/68),
  [@lionel-](https://github.com/lionel-)).
- Computation of column width properly handles wide (e.g., Chinese)
  characters, tests still fail on Windows
  ([\#100](https://github.com/tidyverse/tibble/issues/100)).
- [`glimpse()`](https://pillar.r-lib.org/reference/glimpse.html) shows
  nesting structure for lists and uses angle brackets for type
  ([\#98](https://github.com/tidyverse/tibble/issues/98)).
- Tibbles with `POSIXlt` columns can be printed now, the text
  `<POSIXlt>` is shown as placeholder to encourage usage of `POSIXct`
  ([\#86](https://github.com/tidyverse/tibble/issues/86)).
- [`type_sum()`](https://pillar.r-lib.org/reference/type_sum.html) shows
  only topmost class for S3 objects.

### Error reporting

- Strict checking of integer and logical column indexes. For integers,
  passing a non-integer index or an out-of-bounds index raises an error.
  For logicals, only vectors of length 1 or `ncol` are supported.
  Passing a matrix or an array now raises an error in any case
  ([\#83](https://github.com/tidyverse/tibble/issues/83)).
- Warn if setting non-`NULL` row names
  ([\#75](https://github.com/tidyverse/tibble/issues/75)).
- Consistently surround variable names with single quotes in error
  messages.
- Use “Unknown column ‘x’” as error message if column not found, like
  base R ([\#94](https://github.com/tidyverse/tibble/issues/94)).
- [`stop()`](https://rdrr.io/r/base/stop.html) and
  [`warning()`](https://rdrr.io/r/base/warning.html) are now always
  called with `call. = FALSE`.

### Coercion

- The `.Dim` attribute is silently stripped from columns that are 1d
  matrices ([\#84](https://github.com/tidyverse/tibble/issues/84)).
- Converting a tibble without row names to a regular data frame does not
  add explicit row names.
- [`as_tibble.data.frame()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  preserves attributes, and uses
  [`as_tibble.list()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  to calling overriden methods which may lead to endless recursion.

### New features

- New [`has_name()`](https://rlang.r-lib.org/reference/has_name.html)
  ([\#102](https://github.com/tidyverse/tibble/issues/102)).
- Prefer
  [`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md) and
  [`as_tibble()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  over
  [`data_frame()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)
  and
  [`as_data_frame()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)
  in code and documentation
  ([\#82](https://github.com/tidyverse/tibble/issues/82)).
- New
  [`is.tibble()`](https://tibble.tidyverse.org/dev/reference/is.tibble.md)
  and
  [`is_tibble()`](https://tibble.tidyverse.org/dev/reference/is_tibble.md)
  ([\#79](https://github.com/tidyverse/tibble/issues/79)).
- New
  [`enframe()`](https://tibble.tidyverse.org/dev/reference/enframe.md)
  that converts vectors to two-column tibbles
  ([\#31](https://github.com/tidyverse/tibble/issues/31),
  [\#74](https://github.com/tidyverse/tibble/issues/74)).
- [`obj_sum()`](https://pillar.r-lib.org/reference/type_sum.html) and
  [`type_sum()`](https://pillar.r-lib.org/reference/type_sum.html) show
  `"tibble"` instead of `"tbl_df"` for tibbles
  ([\#82](https://github.com/tidyverse/tibble/issues/82)).
- [`as_tibble.data.frame()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  gains `validate` argument (as in
  [`as_tibble.list()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)),
  if `TRUE` the input is validated.
- Implement
  [`as_tibble.default()`](https://tibble.tidyverse.org/dev/reference/as_tibble.md)
  ([\#71](https://github.com/tidyverse/tibble/issues/71),
  hadley/dplyr#1752).
- [`has_rownames()`](https://tibble.tidyverse.org/dev/reference/rownames.md)
  supports arguments that are not data frames.

### Bug fixes

- Two-dimensional indexing with `[[` works
  ([\#58](https://github.com/tidyverse/tibble/issues/58),
  [\#63](https://github.com/tidyverse/tibble/issues/63)).
- Subsetting with empty index (e.g., `x[]`) also removes row names.

### Documentation

- Document behavior of `as_tibble.tbl_df()` for subclasses
  ([\#60](https://github.com/tidyverse/tibble/issues/60)).
- Document and test that subsetting removes row names.

### Internal

- Don’t rely on `knitr` internals for testing
  ([\#78](https://github.com/tidyverse/tibble/issues/78)).
- Fix compatibility with `knitr` 1.13
  ([\#76](https://github.com/tidyverse/tibble/issues/76)).
- Enhance `knit_print()` tests.
- Provide default implementation for `tbl_sum.tbl_sql()` and
  `tbl_sum.tbl_grouped_df()` to allow `dplyr` release before a `tibble`
  release.
- Explicit tests for `format_v()`
  ([\#98](https://github.com/tidyverse/tibble/issues/98)).
- Test output for `NULL` value of
  [`tbl_sum()`](https://pillar.r-lib.org/reference/tbl_sum.html).
- Test subsetting in all variants
  ([\#62](https://github.com/tidyverse/tibble/issues/62)).
- Add missing test from dplyr.
- Use new `expect_output_file()` from `testthat`.

## Version 1.0

CRAN release: 2016-03-23

- Initial CRAN release

- Extracted from `dplyr` 0.4.3

- Exported functions:

  - [`tbl_df()`](https://tibble.tidyverse.org/dev/reference/tbl_df-class.md)
  - [`as_data_frame()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)
  - [`data_frame()`](https://tibble.tidyverse.org/dev/reference/deprecated.md),
    [`data_frame_()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)
  - [`frame_data()`](https://tibble.tidyverse.org/dev/reference/deprecated.md),
    [`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md)
  - [`glimpse()`](https://pillar.r-lib.org/reference/glimpse.html)
  - [`trunc_mat()`](https://tibble.tidyverse.org/dev/reference/trunc_mat.md),
    `knit_print.trunc_mat()`
  - [`type_sum()`](https://pillar.r-lib.org/reference/type_sum.html)
  - New [`lst()`](https://tibble.tidyverse.org/dev/reference/lst.md) and
    [`lst_()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)
    create lists in the same way that
    [`data_frame()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)
    and
    [`data_frame_()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)
    create data frames (hadley/dplyr#1290). `lst(NULL)` doesn’t raise an
    error ([\#17](https://github.com/tidyverse/tibble/issues/17),
    [@jennybc](https://github.com/jennybc)), but always uses deparsed
    expression as name (even for `NULL`).
  - New
    [`add_row()`](https://tibble.tidyverse.org/dev/reference/add_row.md)
    makes it easy to add a new row to data frame (hadley/dplyr#1021).
  - New
    [`rownames_to_column()`](https://tibble.tidyverse.org/dev/reference/rownames.md)
    and
    [`column_to_rownames()`](https://tibble.tidyverse.org/dev/reference/rownames.md)
    ([\#11](https://github.com/tidyverse/tibble/issues/11),
    [@zhilongjia](https://github.com/zhilongjia)).
  - New
    [`has_rownames()`](https://tibble.tidyverse.org/dev/reference/rownames.md)
    and
    [`remove_rownames()`](https://tibble.tidyverse.org/dev/reference/rownames.md)
    ([\#44](https://github.com/tidyverse/tibble/issues/44)).
  - New
    [`repair_names()`](https://tibble.tidyverse.org/dev/reference/name-repair-superseded.md)
    fixes missing and duplicate names
    ([\#10](https://github.com/tidyverse/tibble/issues/10),
    [\#15](https://github.com/tidyverse/tibble/issues/15),
    [@r2evans](https://github.com/r2evans)).
  - New `is_vector_s3()`.

- Features

  - New `as_data_frame.table()` with argument `n` to control name of
    count column ([\#22](https://github.com/tidyverse/tibble/issues/22),
    [\#23](https://github.com/tidyverse/tibble/issues/23)).
  - Use `tibble` prefix for options
    ([\#13](https://github.com/tidyverse/tibble/issues/13),
    [\#36](https://github.com/tidyverse/tibble/issues/36)).
  - [`glimpse()`](https://pillar.r-lib.org/reference/glimpse.html) now
    (invisibly) returns its argument (hadley/dplyr#1570). It is now a
    generic, the default method dispatches to
    [`str()`](https://rdrr.io/r/utils/str.html) (hadley/dplyr#1325). The
    default width is obtained from the `tibble.width` option
    ([\#35](https://github.com/tidyverse/tibble/issues/35),
    [\#56](https://github.com/tidyverse/tibble/issues/56)).
  - [`as_data_frame()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)
    is now an S3 generic with methods for lists (the old
    [`as_data_frame()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)),
    data frames (trivial), matrices (with efficient C++ implementation)
    (hadley/dplyr#876), and `NULL` (returns a 0-row 0-column data frame)
    ([\#17](https://github.com/tidyverse/tibble/issues/17),
    [@jennybc](https://github.com/jennybc)).
  - Non-scalar input to
    [`frame_data()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)
    and
    [`tibble()`](https://tibble.tidyverse.org/dev/reference/tibble.md)
    (including lists) creates list-valued columns
    ([\#7](https://github.com/tidyverse/tibble/issues/7)). These
    functions return 0-row but n-col data frame if no data.

- Bug fixes

  - [`frame_data()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)
    properly constructs rectangular tables (hadley/dplyr#1377,
    [@kevinushey](https://github.com/kevinushey)).

- Minor modifications

  - Uses `setOldClass(c("tbl_df", "tbl", "data.frame"))` to help with S4
    (hadley/dplyr#969).
  - [`tbl_df()`](https://tibble.tidyverse.org/dev/reference/tbl_df-class.md)
    automatically generates column names (hadley/dplyr#1606).
  - `tbl_df`s gain `$` and `[[` methods that are ~5x faster than the
    defaults, never do partial matching (hadley/dplyr#1504), and throw
    an error if the variable does not exist. `[[.tbl_df()` falls back to
    regular subsetting when used with anything other than a single
    string ([\#29](https://github.com/tidyverse/tibble/issues/29)).
    [`base::getElement()`](https://rdrr.io/r/base/Extract.html) now
    works with tibbles
    ([\#9](https://github.com/tidyverse/tibble/issues/9)).
  - [`all_equal()`](https://dplyr.tidyverse.org/reference/all_equal.html)
    allows to compare data frames ignoring row and column order, and
    optionally ignoring minor differences in type (e.g. int vs. double)
    (hadley/dplyr#821). Used by
    [`all.equal()`](https://rdrr.io/r/base/all.equal.html) for tibbles.
    (This package contains a pure R implementation of
    [`all_equal()`](https://dplyr.tidyverse.org/reference/all_equal.html),
    the `dplyr` code has identical behavior but is written in C++ and
    thus faster.)
  - The internals of
    [`data_frame()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)
    and
    [`as_data_frame()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)
    have been aligned, so
    [`as_data_frame()`](https://tibble.tidyverse.org/dev/reference/deprecated.md)
    will now automatically recycle length-1 vectors. Both functions give
    more informative error messages if you are attempting to create an
    invalid data frame. You can no longer create a data frame with
    duplicated names (hadley/dplyr#820). Both functions now check that
    you don’t have any `POSIXlt` columns, and tell you to use `POSIXct`
    if you do (hadley/dplyr#813). `data_frame(NULL)` raises error “must
    be a 1d atomic vector or list”.
  - [`trunc_mat()`](https://tibble.tidyverse.org/dev/reference/trunc_mat.md)
    and
    [`print.tbl_df()`](https://tibble.tidyverse.org/dev/reference/formatting.md)
    are considerably faster if you have very wide data frames. They will
    now also only list the first 100 additional variables not already on
    screen - control this with the new `n_extra` parameter to
    [`print()`](https://rdrr.io/r/base/print.html) (hadley/dplyr#1161).
    The type of list columns is printed correctly (hadley/dplyr#1379).
    The `width` argument is used also for 0-row or 0-column data frames
    ([\#18](https://github.com/tidyverse/tibble/issues/18)).
  - When used in list-columns, S4 objects only print the class name
    rather than the full class hierarchy
    ([\#33](https://github.com/tidyverse/tibble/issues/33)).
  - Add test that `[.tbl_df()` does not change class
    ([\#41](https://github.com/tidyverse/tibble/issues/41),
    [@jennybc](https://github.com/jennybc)). Improve `[.tbl_df()` error
    message.

- Documentation

  - Update README, with edits
    ([\#52](https://github.com/tidyverse/tibble/issues/52),
    [@bhive01](https://github.com/bhive01)) and enhancements
    ([\#54](https://github.com/tidyverse/tibble/issues/54),
    [@jennybc](https://github.com/jennybc)).
  - [`vignette("tibble")`](https://tibble.tidyverse.org/dev/articles/tibble.md)
    describes the difference between tbl_dfs and regular data frames
    (hadley/dplyr#1468).

- Code quality

  - Test using new-style Travis-CI and AppVeyor. Full test coverage
    ([\#24](https://github.com/tidyverse/tibble/issues/24),
    [\#53](https://github.com/tidyverse/tibble/issues/53)). Regression
    tests load known output from file
    ([\#49](https://github.com/tidyverse/tibble/issues/49)).
  - Renamed `obj_type()` to
    [`obj_sum()`](https://pillar.r-lib.org/reference/type_sum.html),
    improvements, better integration with
    [`type_sum()`](https://pillar.r-lib.org/reference/type_sum.html).
  - Internal cleanup.

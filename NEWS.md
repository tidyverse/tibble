Version 0.3-3 (2016-03-18)
===

`[[.tbl_df` now falls back to regular subsetting when used with anything other than a single string.
Fixes #29
When used in list-columns, S4 objects only print the class name than the full class hierarchy. Fixes #33.
Also give the file a better name
add test that [ does not change class


Version 0.3-2 (2016-03-17)
===

- Cleanup for `column_to_rownames()` and `rownames_to_columns()` (#45).
- New `has_rownames()` and `remove_rownames()` (#44).


Version 0.3-1 (2016-03-17)
===

- Cleanup for `repair_names()` (#43).
- Cleanup for `add_row()` (#46).


Version 0.3 (2016-03-10)
===


- Features
    - New `as_data_frame.table()` with argument `n` to control name of count column (#22, #23).
    - New function `repair_names()` fixes missing and duplicate names (#10, #15, @r2evans).
    - `frame_data()` now also creates a list column if one of the entries is a list (#32).
    - New `rownames_to_column()` and `column_to_rownames()` functions, replace `add_rownames()` (#11, @zhilongjia).
    - Use `tibble` prefix for options (#13, #36).

- Documentation
    - Add pre-tibble NEWS (#39, #40).
    - Include vignette (#38).
    - Expand README.
    - Fix typos in documentation.
    - Remove use of `src()` from examples.

- Prepare CRAN release
    - Use new-style `.travis.yml`
    - Use AppVeyor for testing.
    - Finer coverage analysis (#37).
    - Check with win-builder and valgrind.
    - Fix NOTE from `R CMD check`.


Version 0.2 (2016-03-02)
===

- Functions related to `tbl` and `src` stay in `dplyr` (#26). Remove unused `make_tbl()`.
- Non-scalar input to `frame_data()` and `tibble()` (including lists) creates list-valued columns (#7).
- Use C++ implementation for `as_data_frame.matrix()` (#14). Also add former `matrixToDataFrame()` tests, and fix unwanted conversion to factor.
- `as_data_frame(NULL)` is 0-row 0-column data frame (#17, @jennybc). `frame_data()` and `tibble()` create empty `data_frame` if no rows are given (#20).
- `data_frame(NULL)` raises error "must be a 1d atomic vector or list".
- `lst(NULL)` doesn't raise an error anymore (#17, @jennybc), but always uses deparsed expression as name (even for `NULL`).
- `trunc_mat()` and `print()` use `width` argument also for zero-row and zero-column data frames (#18).
- `glimpse()` now (invisibly) returns `x`, so it can be used within a chain of `dplyr` verbs (@edwindj).
- `base::getElement()` now works with tibbles (#9).
- Remove spurious usage of "dplyr" in documentation (#3).
- Almost full test coverage.


tibble 0.1
==========

First release. Contains functions related to table sources, the `tbl` class and the `tbl_df` subclass, as well as output and helper functions:

## Table sources

- `src()`
- `src_df()`
- `src_local()`
- `src_tbls()`
- `is.src()`
- `same_src()`


## The `tbl` class

- `tbl()`
- `tbl_df()`
- `make_tbl()`
- `tbl_vars()`
- `as.tbl()`, `is.tbl()`


## The `tbl_df` subclass

- `as_data_frame()`
- `data_frame()`, `data_frame_()`
- `frame_data()`, `tibble()`


## Output functions

- `glimpse()`
- `trunc_mat()`, `knit_print.trunc_mat()`
- `dim_desc()`
- `type_sum()`


## Helper functions

- `lst()`, `lst_()`
- `add_row()`
- `add_rownames()`


pre-tibble
==========

* Uses `setOldClass(c("tbl_df", "tbl", "data.frame"))` to help with S4
  (#969).

*  `glimpse()` now (invisibly) returns its argument (#1570).

* `tbl_df` automatically generates column names (#1606).

* `glimpse()` is now a generic. The default method dispatches to `str()`
  (#1325).

* `tbl_df`s gain `$` and `[[` methods that are ~5x faster than the defaults,
  never do partial matching (#1504), and throw an error if the variable
  does not exist.

* `all_equal()` allows to compare data frames ignoring row and column order,
  and optionally ignoring minor differences in type (e.g. int vs. double)
  (#821).

* `as_data_frame()` is now an S3 generic with methods for lists (the old
  `as_data_frame()`), data frames (trivial), and matrices (with efficient
  C++ implementation) (#876).

* New `add_row()` makes it easy to add a new row to data frame (#1021)

* New `lst()` and `lst_()` which create lists in the same way that
  `data_frame()` and `data_frame_()` create data frames (#1290).

* The internals of `data_frame()` and `as_data_frame()` have been aligned,
  so `as_data_frame()` will now automatically recycle length-1 vectors.
  Both functions give more informative error messages if you attempting to
  create an invalid data frame. You can no longer create a data frame with
  duplicated names (#820).

* `vignette("data_frames")` describes the difference between tbl_dfs and
  regular data frames (#1468).

* `print.tbl_df()` is considerably faster if you have very wide data frames.
  It will now also only list the first 100 additional variables not already
  on screen - control this with the new `n_extra` parameter to `print()`
  (#1161).

* `data_frame()` and `as_data_frame()` now check that you don't have any
  `POSIXlt` columns, and tell you to use `POSIXct` if you do (#813).

* `trunc_mat()` correctly prints the type of list columns (#1379)

* `frame_data()` properly constructs rectangular tables. (#1377, @kevinushey)

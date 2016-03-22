Version 1.0 (2016-03-21)
===

- Initial CRAN release

- Extracted from `dplyr` 0.4.3

- Exported functions:
    - `tbl_df()`
    - `as_data_frame()`
    - `data_frame()`, `data_frame_()`
    - `frame_data()`, `tibble()`
    - `glimpse()`
    - `trunc_mat()`, `knit_print.trunc_mat()`
    - `type_sum()`
    - New `lst()` and `lst_()` create lists in the same way that
      `data_frame()` and `data_frame_()` create data frames (hadley/dplyr#1290).
      `lst(NULL)` doesn't raise an error (#17, @jennybc), but always
      uses deparsed expression as name (even for `NULL`).
    - New `add_row()` makes it easy to add a new row to data frame
      (hadley/dplyr#1021).
    - New `rownames_to_column()` and `column_to_rownames()` (#11, @zhilongjia).
    - New `has_rownames()` and `remove_rownames()` (#44).
    - New `repair_names()` fixes missing and duplicate names (#10, #15,
      @r2evans).
    - New `is_vector_s3()`.

- Features
    - New `as_data_frame.table()` with argument `n` to control name of count
      column (#22, #23).
    - Use `tibble` prefix for options (#13, #36).
    - `glimpse()` now (invisibly) returns its argument (hadley/dplyr#1570). It
      is now a generic, the default method dispatches to `str()`
      (hadley/dplyr#1325).  The default width is obtained from the
      `tibble.width` option (#35, #56).
    - `as_data_frame()` is now an S3 generic with methods for lists (the old
      `as_data_frame()`), data frames (trivial), matrices (with efficient
      C++ implementation) (hadley/dplyr#876), and `NULL` (returns a 0-row
      0-column data frame) (#17, @jennybc).
    - Non-scalar input to `frame_data()` and `tibble()` (including lists)
      creates list-valued columns (#7). These functions return 0-row but n-col
      data frame if no data.

- Bug fixes
    - `frame_data()` properly constructs rectangular tables (hadley/dplyr#1377,
      @kevinushey).

- Minor modifications
    - Uses `setOldClass(c("tbl_df", "tbl", "data.frame"))` to help with S4
      (hadley/dplyr#969).
    - `tbl_df()` automatically generates column names (hadley/dplyr#1606).
    - `tbl_df`s gain `$` and `[[` methods that are ~5x faster than the defaults,
      never do partial matching (hadley/dplyr#1504), and throw an error if the
      variable does not exist.  `[[.tbl_df()` falls back to regular subsetting
      when used with anything other than a single string (#29).
      `base::getElement()` now works with tibbles (#9).
    - `all_equal()` allows to compare data frames ignoring row and column order,
      and optionally ignoring minor differences in type (e.g. int vs. double)
      (hadley/dplyr#821).  Used by `all.equal()` for tibbles.  (This package
      contains a pure R implementation of `all_equal()`, the `dplyr` code has
      identical behavior but is written in C++ and thus faster.)
    - The internals of `data_frame()` and `as_data_frame()` have been aligned,
      so `as_data_frame()` will now automatically recycle length-1 vectors.
      Both functions give more informative error messages if you are attempting
      to create an invalid data frame.  You can no longer create a data frame
      with duplicated names (hadley/dplyr#820).  Both functions now check that
      you don't have any `POSIXlt` columns, and tell you to use `POSIXct` if you
      do (hadley/dplyr#813).  `data_frame(NULL)` raises error "must be a 1d
      atomic vector or list".
    - `trunc_mat()` and `print.tbl_df()` are considerably faster if you have
      very wide data frames.  They will now also only list the first 100
      additional variables not already on screen - control this with the new
      `n_extra` parameter to `print()` (hadley/dplyr#1161).  The type of list
      columns is printed correctly (hadley/dplyr#1379).  The `width` argument is
      used also for 0-row or 0-column data frames (#18).
    - When used in list-columns, S4 objects only print the class name rather
      than the full class hierarchy (#33).
    - Add test that `[.tbl_df()` does not change class (#41, @jennybc).  Improve
      `[.tbl_df()` error message.

- Documentation
    - Update README, with edits (#52, @bhive01) and enhancements (#54,
      @jennybc).
    - `vignette("tibble")` describes the difference between tbl_dfs and
      regular data frames (hadley/dplyr#1468).

- Code quality
    - Test using new-style Travis-CI and AppVeyor. Full test coverage (#24,
      #53). Regression tests load known output from file (#49).
    - Renamed `obj_type()` to `obj_sum()`, improvements, better integration with
     `type_sum()`.
    - Internal cleanup.

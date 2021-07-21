# output test

    Code
      tribble(1)
    Error <tibble_error_tribble_needs_columns>
      Must specify at least one column using the `~name` syntax.
    Code
      tribble(~a, ~b, 1)
    Error <tibble_error_tribble_non_rectangular>
      Data must be rectangular.
      * Found 2 columns.
      * Found 1 cells.
      i 1 is not an integer multiple of 2.
    Code
      tribble(a ~ b, 1)
    Error <tibble_error_tribble_lhs_column_syntax>
      All column specifications must use the `~name` syntax.
      x Found `a` on the left-hand side of `~`.
    Code
      tribble(a ~ b + c, 1)
    Error <tibble_error_tribble_lhs_column_syntax>
      All column specifications must use the `~name` syntax.
      x Found `a` on the left-hand side of `~`.
    Code
      tribble(~b, 1, "a")
    Error <vctrs_error_incompatible_type>
      Can't create column `b`: Can't combine `..1` <double> and `..2` <character>.
    Code
      frame_matrix(1)
    Error <tibble_error_tribble_needs_columns>
      Must specify at least one column using the `~name` syntax.
    Code
      frame_matrix(~a, list(1))
    Error <tibble_error_frame_matrix_list>
      All values must be atomic.
      x Found list-valued element at position 1.


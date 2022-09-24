# output test

    Code
      add_row(tibble(), a = 1)
    Condition
      Error in `add_row()`:
      ! New rows can't add columns.
      x Can't find column `a` in `.data`.
    Code
      add_row(tibble(), a = 1, b = 2)
    Condition
      Error in `add_row()`:
      ! New rows can't add columns.
      x Can't find columns `a` and `b` in `.data`.
    Code
      add_row(tibble(), !!!set_names(letters))
    Condition
      Error in `add_row()`:
      ! New rows can't add columns.
      x Can't find columns `a`, `b`, `c`, `d`, `e`, and 21 more in `.data`.
    Code
      add_row(dplyr::group_by(tibble(a = 1), a))
    Condition
      Error in `add_row()`:
      ! Can't add rows to grouped data frames.
    Code
      add_row(tibble(a = 1), a = 2, .before = 1, .after = 1)
    Condition
      Error in `add_row()`:
      ! Can't specify both `.before` and `.after`.
    Code
      add_column(tibble(a = 1), a = 1)
    Output
      # A tibble: 1 x 2
            a   a.1
        <dbl> <dbl>
      1     1     1
    Code
      add_column(tibble(a = 1, b = 2), a = 1, b = 2)
    Output
      # A tibble: 1 x 4
            a     b   a.1   b.1
        <dbl> <dbl> <dbl> <dbl>
      1     1     2     1     2
    Code
      add_column(tibble(!!!set_names(letters)), !!!set_names(letters))
    Output
      # A tibble: 1 x 52
        a     b     c     d     e     f     g     h     i     j     k     l     m    
        <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr>
      1 a     b     c     d     e     f     g     h     i     j     k     l     m    
      # ... with 39 more variables: n <chr>, o <chr>, p <chr>, q <chr>, r <chr>,
      #   s <chr>, t <chr>, u <chr>, v <chr>, w <chr>, x <chr>, y <chr>, z <chr>,
      #   a.1 <chr>, b.1 <chr>, c.1 <chr>, d.1 <chr>, e.1 <chr>, f.1 <chr>,
      #   g.1 <chr>, h.1 <chr>, i.1 <chr>, j.1 <chr>, k.1 <chr>, l.1 <chr>,
      #   m.1 <chr>, n.1 <chr>, o.1 <chr>, p.1 <chr>, q.1 <chr>, r.1 <chr>,
      #   s.1 <chr>, t.1 <chr>, u.1 <chr>, v.1 <chr>, w.1 <chr>, x.1 <chr>,
      #   y.1 <chr>, z.1 <chr>
    Code
      add_column(tibble(a = 2:3), b = 4:6)
    Condition
      Error in `add_column()`:
      ! New columns must be compatible with `.data`.
      x New column has 3 rows.
      i `.data` has 2 rows.
    Code
      add_column(tibble(a = 1), b = 1, .before = 1, .after = 1)
    Condition
      Error in `add_column()`:
      ! Can't specify both `.before` and `.after`.


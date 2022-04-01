# output test

    Code
      add_row(tibble(), a = 1)
    Condition
      Error:
      ! New rows can't add columns.
      x Can't find column `a` in `.data`.
    Code
      add_row(tibble(), a = 1, b = 2)
    Condition
      Error:
      ! New rows can't add columns.
      x Can't find columns `a` and `b` in `.data`.
    Code
      add_row(tibble(), a = "a", b = "b", c = "c", d = "d", e = "e", f = "f", g = "g",
      h = "h", i = "i", j = "j", k = "k", l = "l", m = "m", n = "n", o = "o", p = "p",
      q = "q", r = "r", s = "s", t = "t", u = "u", v = "v", w = "w", x = "x", y = "y",
      z = "z")
    Condition
      Error:
      ! New rows can't add columns.
      x Can't find columns `a`, `b`, `c`, `d`, `e`, and 21 more in `.data`.
    Code
      add_row(dplyr::group_by(tibble(a = 1), a))
    Condition
      Error:
      ! Can't add rows to grouped data frames.
    Code
      add_row(tibble(a = 1), a = 2, .before = 1, .after = 1)
    Condition
      Error:
      ! Can't specify both `.before` and `.after`.
    Code
      add_column(tibble(a = 1), a = 1)
    Condition
      Error:
      ! Column name `a` must not be duplicated.
      Use .name_repair to specify repair.
      Caused by error in `repaired_names()`:
      ! Names must be unique.
      x These names are duplicated:
        * "a" at locations 1 and 2.
    Code
      add_column(tibble(a = 1, b = 2), a = 1, b = 2)
    Condition
      Error:
      ! Column names `a` and `b` must not be duplicated.
      Use .name_repair to specify repair.
      Caused by error in `repaired_names()`:
      ! Names must be unique.
      x These names are duplicated:
        * "a" at locations 1 and 3.
        * "b" at locations 2 and 4.
    Code
      add_column(tibble(a = "a", b = "b", c = "c", d = "d", e = "e", f = "f", g = "g",
        h = "h", i = "i", j = "j", k = "k", l = "l", m = "m", n = "n", o = "o", p = "p",
        q = "q", r = "r", s = "s", t = "t", u = "u", v = "v", w = "w", x = "x", y = "y",
        z = "z"), a = "a", b = "b", c = "c", d = "d", e = "e", f = "f", g = "g", h = "h",
      i = "i", j = "j", k = "k", l = "l", m = "m", n = "n", o = "o", p = "p", q = "q",
      r = "r", s = "s", t = "t", u = "u", v = "v", w = "w", x = "x", y = "y", z = "z")
    Condition
      Error:
      ! Column names `a`, `b`, `c`, `d`, `e`, and 21 more must not be duplicated.
      Use .name_repair to specify repair.
      Caused by error in `repaired_names()`:
      ! Names must be unique.
      x These names are duplicated:
        * "a" at locations 1 and 27.
        * "b" at locations 2 and 28.
        * "c" at locations 3 and 29.
        * "d" at locations 4 and 30.
        * "e" at locations 5 and 31.
        * ...
    Code
      add_column(tibble(a = 2:3), b = 4:6)
    Condition
      Error:
      ! New columns must be compatible with `.data`.
      x New column has 3 rows.
      i `.data` has 2 rows.
    Code
      add_column(tibble(a = 1), b = 1, .before = 1, .after = 1)
    Condition
      Error:
      ! Can't specify both `.before` and `.after`.


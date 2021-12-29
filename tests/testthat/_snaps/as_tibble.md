# as_tibble() implements unique names

    Code
      invalid_df <- as_tibble(list(3, 4, 5), .name_repair = "unique")
    Message <rlib_message_name_repair>
      New names:
      * `` -> `...1`
      * `` -> `...2`
      * `` -> `...3`

# as_tibble() implements universal names

    Code
      invalid_df <- as_tibble(list(3, 4, 5), .name_repair = "universal")
    Message <rlib_message_name_repair>
      New names:
      * `` -> `...1`
      * `` -> `...2`
      * `` -> `...3`

# as_tibble.matrix() supports .name_repair

    Code
      universal <- as_tibble(x, .name_repair = "universal")
    Message <rlib_message_name_repair>
      New names:
      * `` -> `...1`
      * `` -> `...2`

---

    Code
      universal <- as_tibble(x, .name_repair = "universal")
    Message <rlib_message_name_repair>
      New names:
      * `if` -> `.if`

# as_tibble.poly() supports .name_repair

    Code
      universal <- as_tibble(x, .name_repair = "universal")
    Message <rlib_message_name_repair>
      New names:
      * `1` -> `...1`
      * `2` -> `...2`
      * `3` -> `...3`

# as_tibble.table() supports .name_repair

    Code
      as_tibble(table(a = c(1, 1, 1, 2, 2, 2), a = c(3, 4, 5, 3, 4, 5)))
    Error <tibble_error_column_names_must_be_unique>
      Column name `a` must not be duplicated.
      Use .name_repair to specify repair.
      Caused by error in `stop_vctrs()`:
      ! Names must be unique.
      x These names are duplicated:
        * "a" at locations 1 and 2.
    Code
      as_tibble(table(c(1, 1, 1, 2, 2, 2), c(3, 4, 5, 3, 4, 5)))
    Error <tibble_error_column_names_cannot_be_empty>
      Columns 1 and 2 must be named.
      Use .name_repair to specify repair.
      Caused by error in `stop_vctrs()`:
      ! Names can't be empty.
      x Empty names found at locations 1 and 2.

---

    Code
      universal <- as_tibble(x, .name_repair = "universal")
    Message <rlib_message_name_repair>
      New names:
      * `a` -> `a...1`
      * `a` -> `a...2`

---

    Code
      universal <- as_tibble(x, .name_repair = "universal")
    Message <rlib_message_name_repair>
      New names:
      * `if` -> `.if`

---

    Code
      universal <- as_tibble(x, .name_repair = "universal")
    Message <rlib_message_name_repair>
      New names:
      * `n` -> `n...2`
      * `n` -> `n...3`

# as_tibble.ts() supports .name_repair, minimal by default (#537)

    Code
      universal <- as_tibble(x, .name_repair = "universal")
    Message <rlib_message_name_repair>
      New names:
      * `` -> `...1`
      * `` -> `...2`

---

    Code
      universal <- as_tibble(x, .name_repair = "universal")
    Message <rlib_message_name_repair>
      New names:
      * `if` -> `.if`

# creates col names with name repair

    Code
      out <- as_tibble(x, .name_repair = "unique")
    Message <rlib_message_name_repair>
      New names:
      * `` -> `...1`
      * `` -> `...2`

---

    Code
      out <- as_tibble(x, .name_repair = "universal")
    Message <rlib_message_name_repair>
      New names:
      * `` -> `...1`
      * `` -> `...2`


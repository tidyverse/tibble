# output test

    Code
      repaired_names(letters[1:3], repair_hint = FALSE)
    Output
      [1] "a" "b" "c"
    Code
      repaired_names("", repair_hint = FALSE)
    Error <tibble_error_column_names_cannot_be_empty>
      Column 1 must be named.
      Caused by error in `stop_vctrs()`:
      ! Names can't be empty.
      x Empty name found at location 1.
    Code
      repaired_names("", repair_hint = TRUE)
    Error <tibble_error_column_names_cannot_be_empty>
      Column 1 must be named.
      Use .name_repair to specify repair.
      Caused by error in `stop_vctrs()`:
      ! Names can't be empty.
      x Empty name found at location 1.
    Code
      repaired_names(c("a", "a"), repair_hint = FALSE)
    Error <tibble_error_column_names_must_be_unique>
      Column name `a` must not be duplicated.
      Caused by error in `stop_vctrs()`:
      ! Names must be unique.
      x These names are duplicated:
        * "a" at locations 1 and 2.
    Code
      repaired_names("..1", repair_hint = FALSE)
    Error <tibble_error_column_names_cannot_be_dot_dot>
      Column 1 must not have names of the form ... or ..j.
      Caused by error in `stop_vctrs()`:
      ! Names can't be of the form `...` or `..j`.
      x These names are invalid:
        * "..1" at location 1.
    Code
      repaired_names(c("a", "a"), repair_hint = FALSE, .name_repair = "universal")
    Message <rlib_message_name_repair>
      New names:
      * `a` -> `a...1`
      * `a` -> `a...2`
    Output
      [1] "a...1" "a...2"
    Code
      repaired_names(c("a", "a"), repair_hint = FALSE, .name_repair = "universal",
      quiet = TRUE)
    Output
      [1] "a...1" "a...2"
    Code
      repaired_names(c("if"), repair_hint = FALSE, .name_repair = "universal")
    Message <rlib_message_name_repair>
      New names:
      * `if` -> `.if`
    Output
      [1] ".if"


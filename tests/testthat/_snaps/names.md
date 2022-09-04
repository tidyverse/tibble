# output test

    Code
      repaired_names(letters[1:3], repair_hint = FALSE)
    Output
      [1] "a" "b" "c"
    Code
      repaired_names("", repair_hint = FALSE)
    Condition
      Error in `error_column_names_cannot_be_empty()`:
      ! could not find function "error_column_names_cannot_be_empty"
    Code
      repaired_names("", repair_hint = TRUE)
    Condition
      Error in `error_column_names_cannot_be_empty()`:
      ! could not find function "error_column_names_cannot_be_empty"
    Code
      repaired_names(c("a", "a"), repair_hint = FALSE)
    Condition
      Error in `error_column_names_must_be_unique()`:
      ! could not find function "error_column_names_must_be_unique"
    Code
      repaired_names("..1", repair_hint = FALSE)
    Condition
      Error in `error_column_names_cannot_be_dot_dot()`:
      ! could not find function "error_column_names_cannot_be_dot_dot"
    Code
      repaired_names(c("a", "a"), repair_hint = FALSE, .name_repair = "universal")
    Message
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
    Message
      New names:
      * `if` -> `.if`
    Output
      [1] ".if"


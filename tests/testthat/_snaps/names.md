# output test

    Code
      repaired_names(letters[1:3])
    Output
      [1] "a" "b" "c"
    Code
      repaired_names("")
    Error <tibble_error_column_names_cannot_be_empty>
      Column 1 must be named.
    Code
      repaired_names(c("a", "a"))
    Error <tibble_error_column_names_must_be_unique>
      Column name `a` must not be duplicated.
    Code
      repaired_names("..1")
    Error <tibble_error_column_names_cannot_be_dot_dot>
      Column 1 must not have names of the form ... or ..j.
    Code
      repaired_names(c("a", "a"), .name_repair = "universal")
    Message <simpleMessage>
      New names:
      * a -> a...1
      * a -> a...2
    Output
      [1] "a...1" "a...2"
    Code
      repaired_names(c("a", "a"), .name_repair = "universal", quiet = TRUE)
    Output
      [1] "a...1" "a...2"
    Code
      repaired_names(c("if"), .name_repair = "universal")
    Message <simpleMessage>
      New names:
      * `if` -> .if
    Output
      [1] ".if"


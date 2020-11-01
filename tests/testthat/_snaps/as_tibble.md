# as_tibble() implements unique names

    Code
      invalid_df <- as_tibble(list(3, 4, 5), .name_repair = "unique")
    Message <simpleMessage>
      New names:
      * `` -> ...1
      * `` -> ...2
      * `` -> ...3

# as_tibble() implements universal names

    Code
      invalid_df <- as_tibble(list(3, 4, 5), .name_repair = "universal")
    Message <simpleMessage>
      New names:
      * `` -> ...1
      * `` -> ...2
      * `` -> ...3

# as_tibble.matrix() supports .name_repair

    Code
      universal <- as_tibble(x, .name_repair = "universal")
    Message <simpleMessage>
      New names:
      * `` -> ...1
      * `` -> ...2

---

    Code
      universal <- as_tibble(x, .name_repair = "universal")
    Message <simpleMessage>
      New names:
      * `if` -> .if

# as_tibble.poly() supports .name_repair

    Code
      universal <- as_tibble(x, .name_repair = "universal")
    Message <simpleMessage>
      New names:
      * `1` -> ...1
      * `2` -> ...2
      * `3` -> ...3

# as_tibble.table() supports .name_repair

    Code
      universal <- as_tibble(x, .name_repair = "universal")
    Message <simpleMessage>
      New names:
      * a -> a...1
      * a -> a...2

---

    Code
      universal <- as_tibble(x, .name_repair = "universal")
    Message <simpleMessage>
      New names:
      * `if` -> .if

---

    Code
      universal <- as_tibble(x, .name_repair = "universal")
    Message <simpleMessage>
      New names:
      * n -> n...2
      * n -> n...3

# as_tibble.ts() supports .name_repair, minimal by default (#537)

    Code
      universal <- as_tibble(x, .name_repair = "universal")
    Message <simpleMessage>
      New names:
      * `` -> ...1
      * `` -> ...2

---

    Code
      universal <- as_tibble(x, .name_repair = "universal")
    Message <simpleMessage>
      New names:
      * `if` -> .if

# creates col names with name repair

    Code
      out <- as_tibble(x, .name_repair = "unique")
    Message <simpleMessage>
      New names:
      * `` -> ...1
      * `` -> ...2

---

    Code
      out <- as_tibble(x, .name_repair = "universal")
    Message <simpleMessage>
      New names:
      * `` -> ...1
      * `` -> ...2


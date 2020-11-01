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


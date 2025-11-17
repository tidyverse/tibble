# output test

    Code
      name_or_pos(c("a", "", "c"), 1:3)
    Output
      [1] "`a`" "2"   "`c`"
    Code
      cat(tick(c("a", "b c", "if", "`")))
    Output
      `a` `b c` `if` `\``
    Code
      cat(tick_if_needed(c("a", "b c", "if", "`")))
    Output
      a `b c` `if` `\``


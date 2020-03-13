verify_output("tick.txt", {
  name_or_pos(c("a", "", "c"), 1:3)

  cat(tick(c("a", "b c", "if", "`")))
  cat(tick_if_needed(c("a", "b c", "if", "`")))
})

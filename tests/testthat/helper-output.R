unell <- function(x) {
  gsub(symbol$ellipsis, "...", x, fixed = TRUE)
}

unell_bullets <- function(...) {
  unell(bullets(...))
}

unell_commas <- function(...) {
  unell(commas(...))
}

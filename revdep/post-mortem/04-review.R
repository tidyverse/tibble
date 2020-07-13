library(tidyverse)
library(tidytext)


fog_recent <- readRDS("fog_recent.rds")

fog_recent %>%
  count(message) %>%
  count(n)

tr_normal <- function(x) {
  unicode_symbols <- map(cli:::symbol_utf8, rex::escape)
  normal_symbols <- rlang::with_options(cli.unicode = FALSE, cli::symbol)

  reduce2(unicode_symbols, normal_symbols, str_replace_all, .init = x)
}

clean_timings <- function(x) {
  str_replace_all(x, "\\[[0-9]+s(?:/[0-9]+s)?\\]", "[timing]")
}

clean_testthat_summary <- function(x) {
  str_replace_all(x, "\\[ OK:[^\n]+ \\]", "[testthat summary]")
}

clean_backtrace <- function(x) {
  str_replace_all(x, "( +[1-9][0-9]*[.] +(?:[\\\\|+└│├].*| *)\n)+", "[backtrace]\n")
}

clean_pre_backtrace <- function(x) {
  str_replace_all(x, "[x#]\n", "[pre-backtrace]\n")
}

clean_ptime <- function(x) {
  str_replace_all(x, "     [>] base::assign.*\n", "")
}

clean_paths <- function(x) {
  str_replace_all(x, "/home/hornik/tmp/[^\n]+/Work/build/Packages/|/data/gannet/ripley/R/packages/[^\n]+[.]Rcheck/|/home/ripley/R/Lib32-dev/|D:/temp/[^\n]+/RLIBS_[^\n/]+/", "[path]/")
}

fog_clean <-
  fog_recent %>%
  mutate(message = tr_normal(message)) %>%
  mutate(message = clean_timings(message)) %>%
  mutate(message = clean_testthat_summary(message)) %>%
  mutate(message = clean_backtrace(message)) %>%
  mutate(message = clean_pre_backtrace(message)) %>%
  mutate(message = clean_ptime(message)) %>%
  mutate(message = clean_paths(message)) %>%
  group_by(package, result, check, message) %>%
  summarize(
    flavors = paste0(flavors, collapse = ", "),
    n_flavors = sum(n_flavors),
    version = version[[1]]
  ) %>%
  ungroup()

unlink("msg", recursive = TRUE)
dir.create("msg", showWarnings = FALSE)

fog_clean %>%
  filter(check != "vignettes") %>%
  rowid_to_column() %>%
  transmute(text = message, path = sprintf("msg/%04d-%s.txt", rowid, package)) %>%
  pwalk(brio::write_lines)

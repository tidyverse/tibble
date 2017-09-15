# A data frame with all major types
df_all <- tibble(
  a = c(1, 2.5, NA),
  b = c(1:2, NA),
  c = c(T, F, NA),
  d = c("a", "b", NA),
  e = factor(c("a", "b", NA)),
  f = as.Date("2015-12-09") + c(1:2, NA),
  g = as.POSIXct("2015-12-09 10:51:34 UTC") + c(1:2, NA),
  h = as.list(c(1:2, NA)),
  i = list(list(1, 2:3), list(4:6), list(NA))
)

# An empty data frame with all major types
df_empty <- tibble(
  a = integer(0),
  b = double(0),
  c = logical(0),
  d = character(0),
  e = factor(integer(0)),
  f = as.Date(character(0)),
  g = as.POSIXct(character(0)),
  h = as.list(double(0)),
  # i = list(list(integer(0)), list(character(0))),
  to_be_added = double(0)
)

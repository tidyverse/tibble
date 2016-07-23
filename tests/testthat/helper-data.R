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

# A labelled data frame
df_labelled <- as_tibble(mtcars)
attr(df_labelled$mpg, "label") <- "mile per gallon"

library(tibble)
library(dplyr)
library(bench)

source("bench/fun/subsetting.R")

df <- tibble(a = 1:10, aa = 1:10, aaa = 1:10)
b_tibble <- bm(df)

df <- data.frame(a = 1:10, aa = 1:10, aaa = 1:10)
b_df <- bm(df)

b_df %>%
  select(expression, median) %>%
  left_join(b_tibble %>% select(expression, median), by = "expression") %>%
  mutate(ratio = as.numeric(median.y / median.x)) %>%
  arrange(-ratio) %>%
  view()

b_tibble %>% arrange(desc(median))

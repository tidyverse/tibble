library(tibble)
library(bench)

source("bench/fun/subsetting.R")

df <- tibble(a = 1:10, aa = 1:10, aaa = 1:10)
bm(df)

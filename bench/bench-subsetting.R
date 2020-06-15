library(tibble)
library(dplyr)
library(bench)

bm <- function(df) {
  idx <- c(rep(TRUE, 5), rep(FALSE, 5))
  bench::mark(
    df[[1]],
    df[["a"]],
    df[["aa"]],
    df[["aaa"]],
    df[["b"]],

    df$a,
    df$aa,
    df$aaa,

    df["a"],
    df["aa"],
    df[c("aa", "aaa")],
    df[1],
    df[2:3],
    df[TRUE],
    df[c(TRUE, FALSE, TRUE)],

    df[, "a"],
    df[, "aa"],
    df[, c("aa", "aaa")],
    df[, 1],
    df[, 2:3],
    df[, TRUE],
    df[, c(TRUE, FALSE, TRUE)],

    df[1, ],
    df[3:7, ],
    df[TRUE, ],
    df[idx, ],

    df[1, "a"],
    df[1, "aa"],
    df[1, c("aa", "aaa")],
    df[1, 1],
    df[1, 2:3],
    df[1, TRUE],
    df[1, c(TRUE, FALSE, TRUE)],

    df[3:7, "a"],
    df[3:7, "aa"],
    df[3:7, c("aa", "aaa")],
    df[3:7, 1],
    df[3:7, 2:3],
    df[3:7, TRUE],
    df[3:7, c(TRUE, FALSE, TRUE)],

    df[TRUE, "a"],
    df[TRUE, "aa"],
    df[TRUE, c("aa", "aaa")],
    df[TRUE, 1],
    df[TRUE, 2:3],
    df[TRUE, TRUE],
    df[TRUE, c(TRUE, FALSE, TRUE)],

    df[idx, "a"],
    df[idx, "aa"],
    df[idx, c("aa", "aaa")],
    df[idx, 1],
    df[idx, 2:3],
    df[idx, TRUE],
    df[idx, c(TRUE, FALSE, TRUE)],

    check = FALSE,
    iterations = 10000
  )
}

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

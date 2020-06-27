library(tibble)
library(dplyr)
library(bench)

bm <- function(df) {
  idx <- c(rep(TRUE, 5), rep(FALSE, 5))
  bench::mark(
    df[[1]], df[[1]] <- 1,
    df[["a"]], df[["a"]] <- 1,
    df[["aa"]], df[["aa"]] <- 1,
    df[["aaa"]], df[["aaa"]] <- 1,
    df[["b"]],

    df$a, df$a <- 1,
    df$aa, df$aa <- 1,
    df$aaa, df$aaa <- 1,

    df["a"], df["a"] <- 1,
    df["aa"], df["aa"] <- 1,
    df[c("aa", "aaa")], df[c("aa", "aaa")] <- 1,
    df[1], df[1] <- 1,
    df[2:3], df[2:3] <- 1,
    df[TRUE], df[TRUE] <- 1,
    df[c(TRUE, FALSE, TRUE)], df[c(TRUE, FALSE, TRUE)] <- 1,

    df[, "a"], df[, "a"] <- 1,
    df[, "aa"], df[, "aa"] <- 1,
    df[, c("aa", "aaa")], df[, c("aa", "aaa")] <- 1,
    df[, 1], df[, 1] <- 1,
    df[, 2:3], df[, 2:3] <- 1,
    df[, TRUE], df[, TRUE] <- 1,
    df[, c(TRUE, FALSE, TRUE)], df[, c(TRUE, FALSE, TRUE)] <- 1,

    df[1, ], df[1, ] <- 1,
    df[3:7, ], df[3:7, ] <- 1,
    df[TRUE, ], df[TRUE, ] <- 1,
    df[idx, ], df[idx, ] <- 1,

    df[1, "a"], df[1, "a"] <- 1,
    df[1, "aa"], df[1, "aa"] <- 1,
    df[1, c("aa", "aaa")], df[1, c("aa", "aaa")] <- 1,
    df[1, 1], df[1, 1] <- 1,
    df[1, 2:3], df[1, 2:3] <- 1,
    df[1, TRUE], df[1, TRUE] <- 1,
    df[1, c(TRUE, FALSE, TRUE)], df[1, c(TRUE, FALSE, TRUE)] <- 1,

    df[3:7, "a"], df[3:7, "a"] <- 1,
    df[3:7, "aa"], df[3:7, "aa"] <- 1,
    df[3:7, c("aa", "aaa")], df[3:7, c("aa", "aaa")] <- 1,
    df[3:7, 1], df[3:7, 1] <- 1,
    df[3:7, 2:3], df[3:7, 2:3] <- 1,
    df[3:7, TRUE], df[3:7, TRUE] <- 1,
    df[3:7, c(TRUE, FALSE, TRUE)], df[3:7, c(TRUE, FALSE, TRUE)] <- 1,

    df[TRUE, "a"], df[TRUE, "a"] <- 1,
    df[TRUE, "aa"], df[TRUE, "aa"] <- 1,
    df[TRUE, c("aa", "aaa")], df[TRUE, c("aa", "aaa")] <- 1,
    df[TRUE, 1], df[TRUE, 1] <- 1,
    df[TRUE, 2:3], df[TRUE, 2:3] <- 1,
    df[TRUE, TRUE], df[TRUE, TRUE] <- 1,
    df[TRUE, c(TRUE, FALSE, TRUE)], df[TRUE, c(TRUE, FALSE, TRUE)] <- 1,

    df[idx, "a"], df[idx, "a"] <- 1,
    df[idx, "aa"], df[idx, "aa"] <- 1,
    df[idx, c("aa", "aaa")], df[idx, c("aa", "aaa")] <- 1,
    df[idx, 1], df[idx, 1] <- 1,
    df[idx, 2:3], df[idx, 2:3] <- 1,
    df[idx, TRUE], df[idx, TRUE] <- 1,
    df[idx, c(TRUE, FALSE, TRUE)], df[idx, c(TRUE, FALSE, TRUE)] <- 1,

    check = FALSE,
    iterations = 2000
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

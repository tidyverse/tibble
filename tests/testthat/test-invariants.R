new_df_ <- function() {
  df <- data.frame(n = c(1L, NA, 3L, NA))
  df$c <- letters[5:8]
  df$li <- list(9, 10:11, 12:14, "text")
  df
}

new_df <- function() {
  as_tibble(new_df_())
}

df <- new_df()

new_tbl2 <- function() {
  tibble(
    tb = df,
    m = diag(4)
  )
}

new_df2 <- function() {
  df2 <- new_tbl2()
  df2
}

df2 <- new_df2()

with_df <- function(code, verbose = FALSE) {
  code <- rlang::enexpr(code)

  full_code <- rlang::quo({
    df <- new_df()
    !!code
    df
  })
  if (verbose) rlang::expr_print(rlang::quo_get_expr(full_code))
  rlang::eval_tidy(full_code)
}

with_tbl <- function(code, verbose = FALSE) {
  code <- rlang::enexpr(code)

  full_code <- rlang::quo({
    tbl <- new_tbl()
    !!code
    tbl
  })
  if (verbose) rlang::expr_print(rlang::quo_get_expr(full_code))
  rlang::eval_tidy(full_code)
}

with_df2 <- function(code) {
  code <- rlang::enexpr(code)

  full_code <- rlang::quo({
    df2 <- new_df2()
    !!code
    df2
  })
  rlang::eval_tidy(full_code)
}

with_tbl2 <- function(code) {
  code <- rlang::enexpr(code)

  full_code <- rlang::quo({
    tbl2 <- new_tbl2()
    !!code
    tbl2
  })
  rlang::eval_tidy(full_code)
}

test_that("output from invariants vignette", { expect_snapshot(error = TRUE, {

with_df(df$n <- rev(df$n), verbose = TRUE)

df[[1]]
.subset2(df, 1)

identical(df[[3]], .subset2(df, 3))
identical(df2[["df"]], .subset2(df2, "df"))

vec_size(df[[1]])
vec_size(df[[3]])
vec_size(df2[[1]])
vec_size(df2[[2]])

df[[1:2]]
df[[c("n", "c")]]
df[[TRUE]]
df[[mean]]

df[[NA]]
df[[NA_character_]]
df[[NA_integer_]]
df[[-1]]
df[[4]]
df[[1.5]]
df[[Inf]]

df[["x"]]

df$n
df$"n"
df[["n"]]

identical(df$li, df[["li"]])
identical(df2$tb, df2[["tb"]])
identical(df2$m, df2[["m"]])

df$l
df$not_present

df[1:2]

df[c(1, 1)]

df[integer()]

df[is.na(df)]
df[!is.na(df)]

df[, 1]
df[, 1:2]

identical(df[, 2:3], df[2:3])
identical(df2[, 1:2], df2[1:2])

df[, 1, drop = TRUE]

identical(df[, 3, drop = TRUE], df[[3]])
identical(df2[, 1, drop = TRUE], df2[[1]])
identical(df2[, 2, drop = TRUE], df2[[2]])

df[3, ]

df[mean, ]
df[list(1), ]
df["1", ]

df[10, ]
df["x", ]

df[c(TRUE, FALSE), ]

df[NA, ]
df[NA_integer_, ]

df[1, , drop = TRUE]

df[1, 1]
df[1, ][1]
identical(df[1, 2:3], df[2:3][1, ])
identical(df[2:3, 1], df[1][2:3, ])
identical(df2[2:3, 1:2], df2[1:2][2:3, ])

df[[1, 1]]
df[[1, 3]]

with_df(df[[1]] <- 0)
with_df(df[[3]] <- 4:1)
with_df2(df2[[1]] <- 0)
with_df2(df2[[2]] <- 4:1)

with_df(df[[1]] <- 0)
with_df(df[["c"]] <- 0)

with_df(df[[TRUE]] <- 0)
with_df(df[[1:3]] <- 0)
with_df(df[[c("n", "c")]] <- 0)
with_df(df[[FALSE]] <- 0)
with_df(df[[1:2]] <- 0)
with_df(df[[NA_integer_]] <- 0)
with_df(df[[NA]] <- 0)
with_df(df[[NA_character_]] <- 0)

with_df(df[["li"]] <- list(0))
with_df2(df2[["tb"]] <- df[1, ])
with_df2(df2[["m"]] <- df2[["m"]][1, , drop = FALSE])

with_df(df[[1]] <- 1)
with_df(df[[1]] <- 4:1)
with_df(df[[1]] <- 3:1)
with_df(df[[1]] <- 2:1)

with_df(df[["x"]] <- 0)
with_df(df[[4]] <- 0)
with_df(df[[5]] <- 0)

with_df(df[[1]] <- df[[2]])
with_df(df[[2]] <- df[[3]])
with_df(df[[3]] <- df2[[1]])
with_df2(df2[[1]] <- df2[[2]])
with_df2(df2[[2]] <- df[[1]])

with_df(df[[1]] <- NULL)
with_df2(df2[[2]] <- NULL)

with_df(df[["q"]] <- NULL)

with_df(df$n <- 0)
with_df(df[["n"]] <- 0)

with_df(df$"n" <- 0)

with_df(df$l <- 0)
with_df(df[["l"]] <- 0)

with_df(df[1:2] <- list("x", 4:1))
with_df(df[c("li", "x", "c")] <- list("x", 4:1, NULL))

with_df(df[1:2] <- list(1))
with_df(df[1:2] <- list(0, 0, 0))
with_df(df[1:3] <- list(0, 0))

with_df(df[c(1, 1)] <- list(1, 2))

with_df(df[1:2] <- list(NULL, 4:1))

with_df(df[NA] <- list("x"))
with_df(df[NA_integer_] <- list("x"))
with_df(df[NA_character_] <- list("x"))

with_df(df[1] <- df[2])
with_df(df[2] <- df[3])
with_df(df[3] <- df2[1])
with_df2(df2[1] <- df2[2])
with_df2(df2[2] <- df[1])

with_df(df[c("x", "y")] <- tibble("x", x = 4:1))
with_df(df[3:4] <- list("x", x = 4:1))
with_df(df[4] <- list(4:1))
with_df(df[5] <- list(4:1))

with_df(df[is.na(df)] <- 4)
with_df(df[is.na(df)] <- 1:2)
with_df(df[matrix(c(rep(TRUE, 5), rep(FALSE, 7)), ncol = 3)] <- 4)

with_df(df[1:2] <- matrix(8:1, ncol = 2))
with_df(df[1:3, 1:2] <- matrix(6:1, ncol = 2))
with_df(df[1:2] <- array(4:1, dim = c(4, 1, 1)))
with_df(df[1:2] <- array(8:1, dim = c(4, 2, 1)))
with_df(df[1:2] <- array(8:1, dim = c(2, 1, 4)))
with_df(df[1:2] <- array(8:1, dim = c(4, 1, 2)))

with_df(df[1] <- 0)
with_df(df[1] <- list(0))

with_df(df[1] <- list(matrix(1:8, ncol = 2)))

with_df(df[1:2] <- list(matrix(1:8, ncol = 2)))

with_df(df[1] <- NULL)
with_df(df[, 2:3] <- NULL)
with_df(df[1, 2:3] <- NULL)

with_df(df[1] <- mean)
with_df(df[1] <- lm(mpg ~ wt, data = mtcars))

with_df(df[2:3, ] <- df[1, ])
with_df(df[c(FALSE, TRUE, TRUE, FALSE), ] <- df[1, ])

with_df(df[0:2, ] <- df[1, ])
with_df(df[0, ] <- df[1, ])
with_df(df[-2, ] <- df[1, ])
with_df(df[-1:2, ] <- df[1, ])
with_df(df[NA_integer_, ] <- df[1, ])
with_df2(df2[NA_integer_, ] <- df2[1, ])
with_df(df[TRUE, ] <- df[1, ])
with_df(df[FALSE, ] <- df[1, ])
with_df(df[NA, ] <- df[1, ])

with_df(df[2:3, ] <- df[1, ])
with_df(df[2:3, ] <- list(df$n[1], df$c[1:2], df$li[1]))
with_df(df[2:4, ] <- df[1:2, ])

with_df2(df2[2:4, ] <- df2[1, ])
with_df2(df2[2:4, ] <- df2[2:3, ])

with_df(df[5, ] <- df[1, ])
with_df(df[5:7, ] <- df[1, ])
with_df(df[6, ] <- df[1, ])
with_df(df[-5, ] <- df[1, ])
with_df(df[-(5:7), ] <- df[1, ])
with_df(df[-6, ] <- df[1, ])

with_df(df[as.character(1:3), ] <- df[1, ])

with_df(df[as.character(-(1:3)), ] <- df[1, ])
with_df(df[as.character(3:5), ] <- df[1, ])
with_df(df[as.character(-(3:5)), ] <- df[1, ])
with_df(df[NA_character_, ] <- df[1, ])

with_df(df[2:3, 1] <- df[1:2, 2])
with_df(df[2:3, 2] <- df[1:2, 3])
with_df(df[2:3, 3] <- df2[1:2, 1])
with_df2(df2[2:3, 1] <- df2[1:2, 2])
with_df2(df2[2:3, 2] <- df[1:2, 1])

with_df({df$x <- NA; df[2:3, "x"] <- 3:2})
with_df({df$x <- NA_integer_; df[2:3, "x"] <- 3:2})

with_df(df[2:3, "n"] <- 1)
with_df(df[2:3, "x"] <- 1)
with_df(df[2:3, "n"] <- NULL)

with_df(df[5, "n"] <- list(0L))

with_df(df[[1, 1]] <- 0)
with_df(df[1, ][[1]] <- 0)
with_df(df[[1, 3]] <- list(NULL))
with_df(df[1, ][[3]] <- list(NULL))
with_df2(df2[[1, 1]] <- df[1, ])
with_df2(df2[1, ][[1]] <- df[1, ])
with_df2(df2[[1, 2]] <- t(1:4))
with_df2(df2[1, ][[2]] <- t(1:4))
df[[1:2, 1]]
with_df(df[[1:2, 1]] <- 0)

stopifnot(identical(df, new_df()))

})})

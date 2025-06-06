#' Build a data frame
#'
#' @description
#'
#' `tibble()` constructs a data frame. It is used like [base::data.frame()], but
#' with a couple notable differences:
#'
#'   * The returned data frame has the class [`tbl_df`][tbl_df-class], in
#'     addition to `data.frame`. This allows so-called "tibbles" to exhibit some
#'     special behaviour, such as [enhanced printing][formatting]. Tibbles are
#'     fully described in [`tbl_df`][tbl_df-class].
#'   * `tibble()` is much lazier than [base::data.frame()] in terms of
#'     transforming the user's input.
#'
#'       - List-columns are expressly anticipated and do not require special tricks.
#'       - Column names are not modified.
#'       - Inner names in columns are left unchanged.
#'       - For R < 4.0, [character vectors were not coerced to factor](https://blog.r-project.org/2020/02/16/stringsasfactors/).
#'
#'   * `tibble()` builds columns sequentially. When defining a column, you can
#'     refer to columns created earlier in the call. Only columns of length one
#'     are recycled.
#'   * If a column evaluates to a data frame or tibble, it is nested or spliced.
#'     If it evaluates to a matrix or a array, it remains a matrix or array,
#'     respectively.
#'     See examples.
#'
#' @param ... <[`dynamic-dots`][rlang::dyn-dots]>
#'   A set of name-value pairs. These arguments are
#'   processed with [rlang::quos()] and support unquote via [`!!`] and
#'   unquote-splice via [`!!!`]. Use `:=` to create columns that start with a dot.
#'
#'   Arguments are evaluated sequentially.
#'   You can refer to previously created elements directly or using the [.data]
#'   pronoun.
#'   To refer explicitly to objects in the calling environment, use [`!!`] or
#'   [.env], e.g. `!!.data` or `.env$.data` for the special case of an object
#'   named `.data`.
#' @param .rows The number of rows, useful to create a 0-column tibble or
#'   just as an additional check.
#' @param .name_repair Treatment of problematic column names:
#'   * `"minimal"`: No name repair or checks, beyond basic existence,
#'   * `"unique"`: Make sure names are unique and not empty,
#'   * `"check_unique"`: (default value), no name repair, but check they are
#'     `unique`,
#'   * `"universal"`: Make the names `unique` and syntactic
#'   * `"unique_quiet"`: Same as `"unique"`, but "quiet"
#'   * `"universal_quiet"`: Same as `"universal"`, but "quiet"
#'   * a function: apply custom name repair (e.g., `.name_repair = make.names`
#'     for names in the style of base R).
#'   * A purrr-style anonymous function, see [rlang::as_function()]
#'
#'   This argument is passed on as `repair` to [vctrs::vec_as_names()].
#'   See there for more details on these terms and the strategies used
#'   to enforce them.
#'
#' @return A tibble, which is a colloquial term for an object of class
#'   [`tbl_df`][tbl_df-class]. A [`tbl_df`][tbl_df-class] object is also a data
#'   frame, i.e. it has class `data.frame`.
#' @seealso Use [as_tibble()] to turn an existing object into a tibble. Use
#'   `enframe()` to convert a named vector into a tibble. Name repair is
#'   detailed in [vctrs::vec_as_names()].
#'   See [quasiquotation] for more details on tidy dots semantics,
#'   i.e. exactly how  the `...` argument is processed.
#' @export
#' @examples
#' # Unnamed arguments are named with their expression:
#' a <- 1:5
#' tibble(a, a * 2)
#'
#' # Scalars (vectors of length one) are recycled:
#' tibble(a, b = a * 2, c = 1)
#'
#' # Columns are available in subsequent expressions:
#' tibble(x = runif(10), y = x * 2)
#'
#' # tibble() never coerces its inputs,
#' str(tibble(letters))
#' str(tibble(x = list(diag(1), diag(2))))
#'
#' # or munges column names (unless requested),
#' tibble(`a + b` = 1:5)
#'
#' # but it forces you to take charge of names, if they need repair:
#' try(tibble(x = 1, x = 2))
#' tibble(x = 1, x = 2, .name_repair = "unique")
#' tibble(x = 1, x = 2, .name_repair = "minimal")
#'
#' ## By default, non-syntactic names are allowed,
#' df <- tibble(`a 1` = 1, `a 2` = 2)
#' ## because you can still index by name:
#' df[["a 1"]]
#' df$`a 1`
#' with(df, `a 1`)
#'
#' ## Syntactic names are easier to work with, though, and you can request them:
#' df <- tibble(`a 1` = 1, `a 2` = 2, .name_repair = "universal")
#' df$a.1
#'
#' ## You can specify your own name repair function:
#' tibble(x = 1, x = 2, .name_repair = make.unique)
#'
#' fix_names <- function(x) gsub("\\s+", "_", x)
#' tibble(`year 1` = 1, `year 2` = 2, .name_repair = fix_names)
#'
#' ## purrr-style anonymous functions and constants
#' ## are also supported
#' tibble(x = 1, x = 2, .name_repair = ~ make.names(., unique = TRUE))
#'
#' tibble(x = 1, x = 2, .name_repair = ~ c("a", "b"))
#'
#' # Tibbles can contain columns that are tibbles or matrices
#' # if the number of rows is compatible. Unnamed tibbled are
#' # spliced, i.e. the inner columns are inserted into the
#' # tibble under construction.
#' tibble(
#'   a = 1:3,
#'   tibble(
#'     b = 4:6,
#'     c = 7:9
#'   ),
#'   d = tibble(
#'     e = tibble(
#'       f = b
#'     )
#'   )
#' )
#' tibble(
#'   a = 1:3,
#'   b = diag(3),
#'   c = cor(trees),
#'   d = Titanic[1:3, , , ]
#' )
#'
#' # Data can not contain tibbles or matrices with incompatible number of rows:
#' try(tibble(a = 1:3, b = tibble(c = 4:7)))
#'
#' # Use := to create columns with names that start with a dot:
#' tibble(.dotted := 3)
#'
#' # This also works, but might break in the future:
#' tibble(.dotted = 3)
#'
#' # You can unquote an expression:
#' x <- 3
#' tibble(x = 1, y = x)
#' tibble(x = 1, y = !!x)
#'
#' # You can splice-unquote a list of quosures and expressions:
#' tibble(!!!list(x = rlang::quo(1:10), y = quote(x * 2)))
#'
#' # Use .data, .env and !! to refer explicitly to columns or outside objects
#' a <- 1
#' tibble(a = 2, b = a)
#' tibble(a = 2, b = .data$a)
#' tibble(a = 2, b = .env$a)
#' tibble(a = 2, b = !!a)
#' try(tibble(a = 2, b = .env$bogus))
#' try(tibble(a = 2, b = !!bogus))
tibble <- function(
  ...,
  .rows = NULL,
  .name_repair = c(
    "check_unique",
    "unique",
    "universal",
    "minimal",
    "unique_quiet",
    "universal_quiet"
  )
) {
  xs <- quos(...)

  tibble_quos(xs, .rows, .name_repair)
}

#' tibble_row()
#'
#' @description
#' `tibble_row()` constructs a data frame that is guaranteed to occupy one row.
#' Vector columns are required to have size one, non-vector columns are wrapped
#' in a list.
#'
#' @rdname tibble
#' @export
#' @examples
#'
#' # Use tibble_row() to construct a one-row tibble:
#' tibble_row(a = 1, lm = lm(Height ~ Girth + Volume, data = trees))
tibble_row <- function(
  ...,
  .name_repair = c(
    "check_unique",
    "unique",
    "universal",
    "minimal",
    "unique_quiet",
    "universal_quiet"
  )
) {
  xs <- enquos(...)

  tibble_quos(xs, .rows = 1, .name_repair = .name_repair, single_row = TRUE)
}

#' Test if the object is a tibble
#'
#' This function returns `TRUE` for tibbles or subclasses thereof,
#' and `FALSE` for all other objects, including regular data frames.
#'
#' @param x An object
#' @return `TRUE` if the object inherits from the `tbl_df` class.
#' @export
is_tibble <- function(x) {
  inherits(x, "tbl_df")
}

#' Deprecated test for tibble-ness
#'
#' @description
#' `r lifecycle::badge("soft-deprecated")`
#'
#' Please use [is_tibble()] instead.
#'
#' @inheritParams is_tibble
#' @export
#' @keywords internal
is.tibble <- function(x) {
  deprecate_warn("2.0.0", "is.tibble()", "is_tibble()")

  is_tibble(x)
}

tibble_quos <- function(
  xs,
  .rows,
  .name_repair,
  single_row = FALSE,
  call = caller_env()
) {
  # Evaluate each column in turn
  col_names <- given_col_names <- names2(xs)
  empty_col_names <- which(col_names == "")
  col_names[empty_col_names] <- names(quos_auto_name(xs[empty_col_names]))
  lengths <- rep_along(xs, 0L)

  output <- rep_along(xs, list(NULL))

  env <- new_environment()
  mask <- new_data_mask_with_data(env)

  first_size <- .rows

  for (j in seq_along(xs)) {
    res <- eval_tidy(xs[[j]], mask)

    if (!is.null(res)) {
      # Single-row mode: Vectors must be length one, non-vectors are wrapped
      # in a list (which is length one by definition)
      if (single_row) {
        if (vec_is(res)) {
          if (vec_size(res) != 1) {
            abort_tibble_row_size_one(j, given_col_names[[j]], vec_size(res))
          }
        } else {
          res <- list(res)
        }
      } else {
        # 657
        res <- check_valid_col(res, col_names[[j]], j, call)

        lengths[[j]] <- current_size <- vec_size(res)
        if (is.null(first_size)) {
          first_size <- current_size
        } else if (first_size == 1L && current_size != 1L) {
          idx_to_fix <- seq2(1L, j - 1L)
          output[idx_to_fix] <- fixed_output <-
            map(output[idx_to_fix], vec_recycle, current_size)

          # Refill entire data mask
          map2(
            output[idx_to_fix],
            col_names[idx_to_fix],
            add_to_env2,
            env = env
          )

          first_size <- current_size
        } else {
          res <- vectbl_recycle_rows(
            res,
            first_size,
            j,
            given_col_names[[j]],
            call
          )
        }
      }

      output[[j]] <- res
      col_names[[j]] <- add_to_env2(
        res,
        given_col_names[[j]],
        col_names[[j]],
        env
      )
    }
  }

  names(output) <- col_names

  is_null <- map_lgl(output, is.null)
  output <- output[!is_null]

  output <- splice_dfs(output)
  output <- set_repaired_names(
    output,
    repair_hint = TRUE,
    .name_repair = .name_repair,
    call = call
  )

  new_tibble(output, nrow = first_size %||% 0L)
}

check_valid_col <- function(x, name, pos, call) {
  if (name == "") {
    ret <- check_valid_cols(list(x), pos = pos, call = call)
  } else {
    ret <- check_valid_cols(set_names(list(x), name), call = call)
  }
  invisible(ret[[1]])
}

new_data_mask_with_data <- function(env) {
  mask <- new_data_mask(env)
  mask$.data <- as_data_pronoun(env)
  mask
}

add_to_env2 <- function(x, given_name, name = given_name, env) {
  if (is.data.frame(x) && given_name == "") {
    imap(x, add_to_env, env)
    ""
  } else {
    add_to_env(x, name, env)
    name
  }
}

add_to_env <- function(x, name, env) {
  env[[name]] <- x
  invisible()
}

splice_dfs <- function(x) {
  # Avoiding .ptype argument to vec_c()
  if (is_empty(x)) {
    return(list())
  }

  x <- imap(x, function(.x, .y) {
    if (.y == "") unclass(.x) else list2(!!.y := .x)
  })
  vec_c(!!!x, .name_spec = "{inner}")
}

vectbl_recycle_rows <- function(x, n, j, name, call = caller_env()) {
  size <- vec_size(x)
  if (size == n) {
    return(x)
  }
  if (size == 1) {
    return(vec_recycle(x, n))
  }

  if (name == "") {
    name <- j
  }

  abort_incompatible_size(n, name, size, "Existing data", call)
}

# Errors ------------------------------------------------------------------

abort_tibble_row_size_one <- function(j, name, size, call = caller_env()) {
  if (name != "") {
    desc <- tick(name)
  } else {
    desc <- paste0("at position ", j)
  }

  tibble_abort(
    call = call,
    problems(
      "All vectors must be size one, use `list()` to wrap.",
      paste0("Column ", desc, " is of size ", size, ".")
    )
  )
}

abort_incompatible_size <- function(
  .rows,
  vars,
  vars_len,
  rows_source,
  call = caller_env()
) {
  vars_split <- split(vars, vars_len)

  vars_split[["1"]] <- NULL
  if (!is.null(.rows)) {
    vars_split[[as.character(.rows)]] <- NULL
  }

  problems <- map2_chr(names(vars_split), vars_split, function(x, y) {
    if (is.numeric(y)) {
      text <- "Column(s) at position(s) "
    } else {
      text <- "Column(s) "
      y <- tick(y)
    }

    paste0("Size ", x, ": ", pluralise_commas(text, y))
  })

  tibble_abort(
    call = call,
    bullets(
      "Tibble columns must have compatible sizes:",
      if (!is.null(.rows)) paste0("Size ", .rows, ": ", rows_source),
      problems,
      info = "Only values of size one are recycled."
    )
  )
}

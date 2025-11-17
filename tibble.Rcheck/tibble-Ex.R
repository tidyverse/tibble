pkgname <- "tibble"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('tibble')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("add_column")
### * add_column

flush(stderr()); flush(stdout())

### Name: add_column
### Title: Add columns to a data frame
### Aliases: add_column

### ** Examples

# add_column ---------------------------------
df <- tibble(x = 1:3, y = 3:1)

df %>% add_column(z = -1:1, w = 0)
df %>% add_column(z = -1:1, .before = "y")

# You can't overwrite existing columns
try(df %>% add_column(x = 4:6))

# You can't create new observations
try(df %>% add_column(z = 1:5))




cleanEx()
nameEx("add_row")
### * add_row

flush(stderr()); flush(stdout())

### Name: add_row
### Title: Add rows to a data frame
### Aliases: add_row add_case

### ** Examples

# add_row ---------------------------------
df <- tibble(x = 1:3, y = 3:1)

df %>% add_row(x = 4, y = 0)

# You can specify where to add the new rows
df %>% add_row(x = 4, y = 0, .before = 2)

# You can supply vectors, to add multiple rows (this isn't
# recommended because it's a bit hard to read)
df %>% add_row(x = 4:5, y = 0:-1)

# Use tibble_row() to add one row only
df %>% add_row(tibble_row(x = 4, y = 0))
try(df %>% add_row(tibble_row(x = 4:5, y = 0:-1)))

# Absent variables get missing values
df %>% add_row(x = 4)

# You can't create new variables
try(df %>% add_row(z = 10))



cleanEx()
nameEx("as_tibble")
### * as_tibble

flush(stderr()); flush(stdout())

### Name: as_tibble
### Title: Coerce lists, matrices, and more to data frames
### Aliases: as_tibble as_tibble.data.frame as_tibble.list as_tibble.matrix
###   as_tibble.table as_tibble.NULL as_tibble.default as_tibble_row
###   as_tibble_col

### ** Examples

m <- matrix(rnorm(50), ncol = 5)
colnames(m) <- c("a", "b", "c", "d", "e")
df <- as_tibble(m)

as_tibble_row(c(a = 1, b = 2))
as_tibble_row(list(c = "three", d = list(4:5)))
as_tibble_row(1:3, .name_repair = "unique")

as_tibble_col(1:3)
as_tibble_col(
  list(c = "three", d = list(4:5)),
  column_name = "data"
)



cleanEx()
nameEx("char")
### * char

flush(stderr()); flush(stdout())

### Name: char
### Title: Format a character vector
### Aliases: char set_char_opts

### ** Examples

# Display as a vector:
char(letters[1:3])
## Don't show: 
if ({ set.seed(20210331); rlang::is_installed("stringi") }) withAutoprint({ # examplesIf
## End(Don't show)
# Space constraints:
rand_strings <- stringi::stri_rand_strings(10, seq(40, 22, by = -2))

# Plain character vectors get truncated if space is limited:
data_with_id <- function(id) {
  tibble(
    id,
    some_number_1 = 1, some_number_2 = 2, some_number_3 = 3,
    some_number_4 = 4, some_number_5 = 5, some_number_6 = 6,
    some_number_7 = 7, some_number_8 = 8, some_number_9 = 9
  )
}
data_with_id(rand_strings)

# Use char() to avoid or control truncation
data_with_id(char(rand_strings, min_chars = 24))
data_with_id(char(rand_strings, min_chars = Inf))
data_with_id(char(rand_strings, min_chars = 24, shorten = "mid"))

# Lorem Ipsum, one sentence per row.
lipsum <- unlist(strsplit(stringi::stri_rand_lipsum(1), "(?<=[.]) +", perl = TRUE))
tibble(
  back = char(lipsum, shorten = "back"),
  front = char(lipsum, shorten = "front"),
  mid = char(lipsum, shorten = "mid")
)
tibble(abbr = char(lipsum, shorten = "abbreviate"))
## Don't show: 
}) # examplesIf
## End(Don't show)



cleanEx()
nameEx("enframe")
### * enframe

flush(stderr()); flush(stdout())

### Name: enframe
### Title: Converting vectors to data frames, and vice versa
### Aliases: enframe deframe

### ** Examples

enframe(1:3)
enframe(c(a = 5, b = 7))
enframe(list(one = 1, two = 2:3, three = 4:6))
deframe(enframe(3:1))
deframe(tibble(a = 1:3))
deframe(tibble(a = as.list(1:3)))



cleanEx()
nameEx("formatting")
### * formatting

flush(stderr()); flush(stdout())

### Name: formatting
### Title: Printing tibbles
### Aliases: formatting print.tbl format.tbl print.tbl_df format.tbl_df

### ** Examples

print(as_tibble(mtcars))
print(as_tibble(mtcars), n = 1)
print(as_tibble(mtcars), n = 3)

print(as_tibble(trees), n = 100)

print(mtcars, width = 10)

mtcars2 <- as_tibble(cbind(mtcars, mtcars), .name_repair = "unique")
print(mtcars2, n = 25, max_extra_cols = 3)

## Don't show: 
if (requireNamespace("nycflights13", quietly = TRUE)) withAutoprint({ # examplesIf
## End(Don't show)
print(nycflights13::flights, max_footer_lines = 1)
print(nycflights13::flights, width = Inf)
## Don't show: 
}) # examplesIf
## End(Don't show)



cleanEx()
nameEx("frame_matrix")
### * frame_matrix

flush(stderr()); flush(stdout())

### Name: frame_matrix
### Title: Row-wise matrix creation
### Aliases: frame_matrix

### ** Examples

frame_matrix(
  ~col1, ~col2,
  1,     3,
  5,     2
)



cleanEx()
nameEx("lst")
### * lst

flush(stderr()); flush(stdout())

### Name: lst
### Title: Build a list
### Aliases: lst

### ** Examples

# the value of n can be used immediately in the definition of x
lst(n = 5, x = runif(n))

# missing names are constructed from user's input
lst(1:3, z = letters[4:6], runif(3))

a <- 1:3
b <- letters[4:6]
lst(a, b)

# pre-formed quoted expressions can be used with lst() and then
# unquoted (with !!) or unquoted and spliced (with !!!)
n1 <- 2
n2 <- 3
n_stuff <- quote(n1 + n2)
x_stuff <- quote(seq_len(n))
lst(!!!list(n = n_stuff, x = x_stuff))
lst(n = !!n_stuff, x = !!x_stuff)
lst(n = 4, x = !!x_stuff)
lst(!!!list(n = 2, x = x_stuff))



cleanEx()
nameEx("new_tibble")
### * new_tibble

flush(stderr()); flush(stdout())

### Name: new_tibble
### Title: Tibble constructor and validator
### Aliases: new_tibble validate_tibble

### ** Examples

# The nrow argument can be omitted:
new_tibble(list(a = 1:3, b = 4:6))

# Existing row.names attributes are ignored:
try(validate_tibble(new_tibble(trees, nrow = 3)))

# The length of all columns must be compatible with the nrow argument:
try(validate_tibble(new_tibble(list(a = 1:3, b = 4:6), nrow = 2)))



cleanEx()
nameEx("num")
### * num

flush(stderr()); flush(stdout())

### Name: num
### Title: Format a numeric vector
### Aliases: num set_num_opts

### ** Examples

# Display as a vector
num(9:11 * 100 + 0.5)

# Significant figures
tibble(
  x3 = num(9:11 * 100 + 0.5, sigfig = 3),
  x4 = num(9:11 * 100 + 0.5, sigfig = 4),
  x5 = num(9:11 * 100 + 0.5, sigfig = 5),
)

# Maximum digits after the decimal points
tibble(
  x0 = num(9:11 * 100 + 0.5, digits = 0),
  x1 = num(9:11 * 100 + 0.5, digits = -1),
  x2 = num(9:11 * 100 + 0.5, digits = -2),
)

# Use fixed digits and a currency label
tibble(
  usd = num(9:11 * 100 + 0.5, digits = 2, label = "USD"),
  gbp = num(9:11 * 100 + 0.5, digits = 2, label = "£"),
  chf = num(9:11 * 100 + 0.5, digits = 2, label = "SFr")
)

# Scale
tibble(
  small  = num(9:11 / 1000 + 0.00005, label = "%", scale = 100),
  medium = num(9:11 / 100 + 0.0005, label = "%", scale = 100),
  large  = num(9:11 / 10 + 0.005, label = "%", scale = 100)
)

# Notation
tibble(
  sci = num(10^(-13:6), notation = "sci"),
  eng = num(10^(-13:6), notation = "eng"),
  si  = num(10^(-13:6), notation = "si"),
  dec = num(10^(-13:6), notation = "dec")
)

# Fixed exponent
tibble(
  scimin = num(10^(-7:6) * 123, notation = "sci", fixed_exponent = -Inf),
  engmin = num(10^(-7:6) * 123, notation = "eng", fixed_exponent = -Inf),
  simin  = num(10^(-7:6) * 123, notation = "si", fixed_exponent = -Inf)
)

tibble(
  scismall = num(10^(-7:6) * 123, notation = "sci", fixed_exponent = -3),
  scilarge = num(10^(-7:6) * 123, notation = "sci", fixed_exponent = 3),
  scimax   = num(10^(-7:6) * 123, notation = "sci", fixed_exponent = Inf)
)

#' Extra significant digits
tibble(
  default = num(100 + 1:3 * 0.001),
  extra1 = num(100 + 1:3 * 0.001, extra_sigfig = TRUE),
  extra2 = num(100 + 1:3 * 0.0001, extra_sigfig = TRUE),
  extra3 = num(10000 + 1:3 * 0.00001, extra_sigfig = TRUE)
)



cleanEx()
nameEx("rownames")
### * rownames

flush(stderr()); flush(stdout())

### Name: rownames
### Title: Tools for working with row names
### Aliases: rownames has_rownames remove_rownames rownames_to_column
###   rowid_to_column column_to_rownames

### ** Examples

# Detect row names ----------------------------------------------------
has_rownames(mtcars)
has_rownames(trees)

# Remove row names ----------------------------------------------------
remove_rownames(mtcars) %>% has_rownames()

# Convert between row names and column --------------------------------
mtcars_tbl <- rownames_to_column(mtcars, var = "car") %>% as_tibble()
mtcars_tbl
column_to_rownames(mtcars_tbl, var = "car") %>% head()

# Adding rowid as a column --------------------------------------------
rowid_to_column(trees) %>% head()




cleanEx()
nameEx("subsetting")
### * subsetting

flush(stderr()); flush(stdout())

### Name: subsetting
### Title: Subsetting tibbles
### Aliases: subsetting $.tbl_df [[.tbl_df [.tbl_df $<-.tbl_df [[<-.tbl_df
###   [<-.tbl_df

### ** Examples

df <- data.frame(a = 1:3, bc = 4:6)
tbl <- tibble(a = 1:3, bc = 4:6)

# Subsetting single columns:
df[, "a"]
tbl[, "a"]
tbl[, "a", drop = TRUE]
as.data.frame(tbl)[, "a"]

# Subsetting single rows with the drop argument:
df[1, , drop = TRUE]
tbl[1, , drop = TRUE]
as.list(tbl[1, ])

## Don't show: 
if ((Sys.getenv("NOT_CRAN") != "true" || Sys.getenv("IN_PKGDOWN") == "true")) withAutoprint({ # examplesIf
## End(Don't show)
# Accessing non-existent columns:
df$b
tbl$b

df[["b", exact = FALSE]]
tbl[["b", exact = FALSE]]

df$bd <- c("n", "e", "w")
tbl$bd <- c("n", "e", "w")
df$b
tbl$b
## Don't show: 
}) # examplesIf
## End(Don't show)

df$b <- 7:9
tbl$b <- 7:9
df$b
tbl$b

# Identical behavior:
tbl[1, ]
tbl[1, c("bc", "a")]
tbl[, c("bc", "a")]
tbl[c("bc", "a")]
tbl["a"]
tbl$a
tbl[["a"]]



cleanEx()
nameEx("tibble")
### * tibble

flush(stderr()); flush(stdout())

### Name: tibble
### Title: Build a data frame
### Aliases: tibble tibble_row

### ** Examples

# Unnamed arguments are named with their expression:
a <- 1:5
tibble(a, a * 2)

# Scalars (vectors of length one) are recycled:
tibble(a, b = a * 2, c = 1)

# Columns are available in subsequent expressions:
tibble(x = runif(10), y = x * 2)

# tibble() never coerces its inputs,
str(tibble(letters))
str(tibble(x = list(diag(1), diag(2))))

# or munges column names (unless requested),
tibble(`a + b` = 1:5)

# but it forces you to take charge of names, if they need repair:
try(tibble(x = 1, x = 2))
tibble(x = 1, x = 2, .name_repair = "unique")
tibble(x = 1, x = 2, .name_repair = "minimal")

## By default, non-syntactic names are allowed,
df <- tibble(`a 1` = 1, `a 2` = 2)
## because you can still index by name:
df[["a 1"]]
df$`a 1`
with(df, `a 1`)

## Syntactic names are easier to work with, though, and you can request them:
df <- tibble(`a 1` = 1, `a 2` = 2, .name_repair = "universal")
df$a.1

## You can specify your own name repair function:
tibble(x = 1, x = 2, .name_repair = make.unique)

fix_names <- function(x) gsub("\\s+", "_", x)
tibble(`year 1` = 1, `year 2` = 2, .name_repair = fix_names)

## purrr-style anonymous functions and constants
## are also supported
tibble(x = 1, x = 2, .name_repair = ~ make.names(., unique = TRUE))

tibble(x = 1, x = 2, .name_repair = ~ c("a", "b"))

# Tibbles can contain columns that are tibbles or matrices
# if the number of rows is compatible. Unnamed tibbled are
# spliced, i.e. the inner columns are inserted into the
# tibble under construction.
tibble(
  a = 1:3,
  tibble(
    b = 4:6,
    c = 7:9
  ),
  d = tibble(
    e = tibble(
      f = b
    )
  )
)
tibble(
  a = 1:3,
  b = diag(3),
  c = cor(trees),
  d = Titanic[1:3, , , ]
)

# Data can not contain tibbles or matrices with incompatible number of rows:
try(tibble(a = 1:3, b = tibble(c = 4:7)))

# Use := to create columns with names that start with a dot:
tibble(.dotted := 3)

# This also works, but might break in the future:
tibble(.dotted = 3)

# You can unquote an expression:
x <- 3
tibble(x = 1, y = x)
tibble(x = 1, y = !!x)

# You can splice-unquote a list of quosures and expressions:
tibble(!!!list(x = rlang::quo(1:10), y = quote(x * 2)))

# Use .data, .env and !! to refer explicitly to columns or outside objects
a <- 1
tibble(a = 2, b = a)
tibble(a = 2, b = .data$a)
tibble(a = 2, b = .env$a)
tibble(a = 2, b = !!a)
try(tibble(a = 2, b = .env$bogus))
try(tibble(a = 2, b = !!bogus))

# Use tibble_row() to construct a one-row tibble:
tibble_row(a = 1, lm = lm(Height ~ Girth + Volume, data = trees))



cleanEx()
nameEx("tibble_options")
### * tibble_options

flush(stderr()); flush(stdout())

### Name: tibble_options
### Title: Package options
### Aliases: tibble_options
### Keywords: datasets

### ** Examples

# Default setting:
getOption("tibble.view_max")

# Change for the duration of the session:
old <- options(tibble.view_max = 100)

# view() would show only 100 rows e.g. for a lazy data frame

# Change back to the original value:
options(old)

# Local scope:
local({
  rlang::local_options(tibble.view_max = 100)
  # view() would show only 100 rows e.g. for a lazy data frame
})
# view() would show the default 1000 rows e.g. for a lazy data frame



cleanEx()
nameEx("tribble")
### * tribble

flush(stderr()); flush(stdout())

### Name: tribble
### Title: Row-wise tibble creation
### Aliases: tribble

### ** Examples

tribble(
  ~colA, ~colB,
  "a",   1,
  "b",   2,
  "c",   3
)

# tribble will create a list column if the value in any cell is
# not a scalar
tribble(
  ~x,  ~y,
  "a", 1:3,
  "b", 4:6
)
## Don't show: 
if (rlang::is_installed("dplyr") && packageVersion("dplyr") >= "1.0.5") withAutoprint({ # examplesIf
## End(Don't show)

# Use dplyr::mutate(dplyr::across(...)) to assign an explicit type
tribble(
  ~a, ~b, ~c,
  1, "2000-01-01", "1.5"
) %>%
  dplyr::mutate(
    dplyr::across(a, as.integer),
    dplyr::across(b, as.Date)
  )
## Don't show: 
}) # examplesIf
## End(Don't show)



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')

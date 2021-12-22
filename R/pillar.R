#' Format a numeric vector
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' Constructs a numeric vector that can be formatted with predefined
#' significant digits, or with a maximum or fixed number of digits
#' after the decimal point.
#' Scaling is supported, as well as forcing a decimal, scientific
#' or engineering notation.
#' If a label is given, it is shown in the header of a column.
#'
#' The formatting is applied when the vector is printed or formatted,
#' and also in a tibble column.
#' The formatting annotation and the class survives most arithmetic transformations,
#' the most notable exceptions are [var()] and [sd()].
#'
#' @family vector classes
#' @inheritParams ellipsis::dots_empty
#' @param x A numeric vector.
#' @param sigfig Define the number of significant digits to show. Must be one or greater.
#'   The `"pillar.sigfig"` [option][pillar::pillar_options] is not consulted.
#'   Can't be combined with `digits`.
#' @param digits Number of digits after the decimal points to show.
#'   Positive numbers specify the exact number of digits to show.
#'   Negative numbers specify (after negation) the maximum number of digits to show.
#'   With `digits = 2`, the numbers 1.2 and 1.234 are printed as 1.20 and 1.23,
#'   with `digits = -2` as 1.2 and 1.23, respectively.
#'   Can't be combined with `sigfig`.
#' @param label A label to show instead of the type description.
#' @param scale Multiplier to apply to the data before showing.
#'   Useful for displaying e.g. percentages.
#'   Must be combined with `label`.
#' @param notation One of `"fit"`, `"dec"`, `"sci"`, `"eng"`, or `"si"`.
#'   - `"fit"`: Use decimal notation if it fits and if it consumes 13 digits or less,
#'     otherwise use scientific notation. (The default for numeric pillars.)
#'   - `"dec"`: Use decimal notation, regardless of width.
#'   - `"sci"`: Use scientific notation.
#'   - `"eng"`: Use engineering notation, i.e. scientific notation
#'       using exponents that are a multiple of three.
#'   - `"si"`: Use SI notation, prefixes between `1e-24` and `1e24` are supported.
#' @param fixed_exponent
#'   Use the same exponent for all numbers in scientific, engineering or SI notation.
#'   `-Inf` uses the smallest, `+Inf` the largest fixed_exponent present in the data.
#'   The default is to use varying exponents.
#' @param extra_sigfig
#'   If `TRUE`, increase the number of significant digits if the data consists of
#'   numbers of the same magnitude with subtle differences.
#' @export
#' @examples
#' # Display as a vector
#' num(9:11 * 100 + 0.5)
#' @examples
#'
#' # Significant figures
#' tibble(
#'   x3 = num(9:11 * 100 + 0.5, sigfig = 3),
#'   x4 = num(9:11 * 100 + 0.5, sigfig = 4),
#'   x5 = num(9:11 * 100 + 0.5, sigfig = 5),
#' )
#'
#' # Maximum digits after the decimal points
#' tibble(
#'   x0 = num(9:11 * 100 + 0.5, digits = 0),
#'   x1 = num(9:11 * 100 + 0.5, digits = -1),
#'   x2 = num(9:11 * 100 + 0.5, digits = -2),
#' )
#'
#' # Use fixed digits and a currency label
#' tibble(
#'   usd = num(9:11 * 100 + 0.5, digits = 2, label = "USD"),
#'   gbp = num(9:11 * 100 + 0.5, digits = 2, label = "£"),
#'   chf = num(9:11 * 100 + 0.5, digits = 2, label = "SFr")
#' )
#'
#' # Scale
#' tibble(
#'   small  = num(9:11 / 1000 + 0.00005, label = "%", scale = 100),
#'   medium = num(9:11 / 100 + 0.0005, label = "%", scale = 100),
#'   large  = num(9:11 / 10 + 0.005, label = "%", scale = 100)
#' )
#'
#' # Notation
#' tibble(
#'   sci = num(10^(-13:6), notation = "sci"),
#'   eng = num(10^(-13:6), notation = "eng"),
#'   si  = num(10^(-13:6), notation = "si"),
#'   dec = num(10^(-13:6), notation = "dec")
#' )
#'
#' # Fixed exponent
#' tibble(
#'   scimin = num(10^(-7:6) * 123, notation = "sci", fixed_exponent = -Inf),
#'   engmin = num(10^(-7:6) * 123, notation = "eng", fixed_exponent = -Inf),
#'   simin  = num(10^(-7:6) * 123, notation = "si", fixed_exponent = -Inf)
#' )
#'
#' tibble(
#'   scismall = num(10^(-7:6) * 123, notation = "sci", fixed_exponent = -3),
#'   scilarge = num(10^(-7:6) * 123, notation = "sci", fixed_exponent = 3),
#'   scimax   = num(10^(-7:6) * 123, notation = "sci", fixed_exponent = Inf)
#' )
#'
#' #' Extra significant digits
#' tibble(
#'   default = num(100 + 1:3 * 0.001),
#'   extra1 = num(100 + 1:3 * 0.001, extra_sigfig = TRUE),
#'   extra2 = num(100 + 1:3 * 0.0001, extra_sigfig = TRUE),
#'   extra3 = num(10000 + 1:3 * 0.00001, extra_sigfig = TRUE)
#' )
# Assigned in .onLoad()
num <- NULL

#' set_num_opts
#'
#' `set_num_opts()` adds formatting options to an arbitrary numeric vector,
#' useful for composing with other types.
#'
#' @export
#' @rdname num
# Assigned in .onLoad()
set_num_opts <- NULL

#' Format a character vector
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' Constructs a character vector that can be formatted with predefined minimum width
#' or without width restrictions, and where the abbreviation style can be configured.
#'
#' The formatting is applied when the vector is printed or formatted,
#' and also in a tibble column.
#'
#' @family vector classes
#' @inheritParams ellipsis::dots_empty
#' @param x A character vector.
#' @param min_chars The minimum width to allocate to this column, defaults to 15.
#'   The `"pillar.min_chars"` [option][pillar::pillar_options] is not consulted.
#' @param shorten How to abbreviate the data if necessary:
#' - `"back"` (default): add an ellipsis at the end
#' - `"front"`: add an ellipsis at the front
#' - `"mid"`: add an ellipsis in the middle
#' - `"abbreviate"`: use [abbreviate()]
#' @export
#' @examples
#' # Display as a vector:
#' char(letters[1:3])
#' @examplesIf { set.seed(20210331); rlang::is_installed("stringi") }
#' # Space constraints:
#' rand_strings <- stringi::stri_rand_strings(10, seq(40, 22, by = -2))
#'
#' # Plain character vectors get truncated if space is limited:
#' data_with_id <- function(id) {
#'   tibble(
#'     id,
#'     some_number_1 = 1, some_number_2 = 2, some_number_3 = 3,
#'     some_number_4 = 4, some_number_5 = 5, some_number_6 = 6,
#'     some_number_7 = 7, some_number_8 = 8, some_number_9 = 9
#'   )
#' }
#' data_with_id(rand_strings)
#'
#' # Use char() to avoid or control truncation
#' data_with_id(char(rand_strings, min_chars = 24))
#' data_with_id(char(rand_strings, min_chars = Inf))
#' data_with_id(char(rand_strings, min_chars = 24, shorten = "mid"))
#'
#' # Lorem Ipsum, one sentence per row.
#' lipsum <- unlist(strsplit(stringi::stri_rand_lipsum(1), "(?<=[.]) +", perl = TRUE))
#' tibble(
#'   back = char(lipsum, shorten = "back"),
#'   front = char(lipsum, shorten = "front"),
#'   mid = char(lipsum, shorten = "mid")
#' )
#' tibble(abbr = char(lipsum, shorten = "abbreviate"))
# Assigned in .onLoad()
char <- NULL

#' set_char_opts
#'
#' `set_char_opts()` adds formatting options to an arbitrary character vector,
#' useful for composing with other types.
#'
#' @export
#' @rdname char
# Assigned in .onLoad()
set_char_opts <- NULL

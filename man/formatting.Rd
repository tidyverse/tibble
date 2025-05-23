% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/print.R
\name{formatting}
\alias{formatting}
\alias{print.tbl}
\alias{format.tbl}
\alias{print.tbl_df}
\alias{format.tbl_df}
\title{Printing tibbles}
\usage{
\method{print}{tbl_df}(
  x,
  width = NULL,
  ...,
  n = NULL,
  max_extra_cols = NULL,
  max_footer_lines = NULL
)

\method{format}{tbl_df}(
  x,
  width = NULL,
  ...,
  n = NULL,
  max_extra_cols = NULL,
  max_footer_lines = NULL
)
}
\arguments{
\item{x}{Object to format or print.}

\item{width}{Width of text output to generate. This defaults to \code{NULL}, which
means use the \code{width} \link[pillar:pillar_options]{option}.}

\item{...}{These dots are for future extensions and must be empty.}

\item{n}{Number of rows to show. If \code{NULL}, the default, will print all rows
if less than the \code{print_max} \link[pillar:pillar_options]{option}.
Otherwise, will print as many rows as specified by the
\code{print_min} \link[pillar:pillar_options]{option}.}

\item{max_extra_cols}{Number of extra columns to print abbreviated information for,
if the width is too small for the entire tibble. If \code{NULL},
the \code{max_extra_cols} \link[pillar:pillar_options]{option} is used.
The previously defined \code{n_extra} argument is soft-deprecated.}

\item{max_footer_lines}{Maximum number of footer lines. If \code{NULL},
the \code{max_footer_lines} \link[pillar:pillar_options]{option} is used.}
}
\description{
One of the main features of the \code{tbl_df} class is the printing:
\itemize{
\item Tibbles only print as many rows and columns as fit on one screen,
supplemented by a summary of the remaining rows and columns.
\item Tibble reveals the type of each column, which keeps the user informed about
whether a variable is, e.g., \verb{<chr>} or \verb{<fct>} (character versus factor).
See \code{vignette("types")} for an overview of common
type abbreviations.
}

Printing can be tweaked for a one-off call by calling \code{print()} explicitly
and setting arguments like \code{n} and \code{width}. More persistent control is
available by setting the options described in \link[pillar:pillar_options]{pillar::pillar_options}.
See also \code{vignette("digits")} for a comparison to base options,
and \code{vignette("numbers")} that showcases \code{\link[=num]{num()}} and \code{\link[=char]{char()}}
for creating columns with custom formatting options.

As of tibble 3.1.0, printing is handled entirely by the \pkg{pillar} package.
If you implement a package that extends tibble,
the printed output can be customized in various ways.
See \code{vignette("extending", package = "pillar")} for details,
and \link[pillar:pillar_options]{pillar::pillar_options} for options that control the display in the console.
}
\examples{
print(as_tibble(mtcars))
print(as_tibble(mtcars), n = 1)
print(as_tibble(mtcars), n = 3)

print(as_tibble(trees), n = 100)

print(mtcars, width = 10)

mtcars2 <- as_tibble(cbind(mtcars, mtcars), .name_repair = "unique")
print(mtcars2, n = 25, max_extra_cols = 3)

\dontshow{if (requireNamespace("nycflights13", quietly = TRUE)) withAutoprint(\{ # examplesIf}
print(nycflights13::flights, max_footer_lines = 1)
print(nycflights13::flights, width = Inf)
\dontshow{\}) # examplesIf}
}

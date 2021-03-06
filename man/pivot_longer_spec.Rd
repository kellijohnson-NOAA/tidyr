% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pivot-long.R
\name{pivot_longer_spec}
\alias{pivot_longer_spec}
\alias{build_longer_spec}
\title{Pivot data from wide to long using a spec}
\usage{
pivot_longer_spec(
  data,
  spec,
  names_repair = "check_unique",
  values_drop_na = FALSE,
  values_ptypes = list(),
  values_transform = list()
)

build_longer_spec(
  data,
  cols,
  names_to = "name",
  values_to = "value",
  names_prefix = NULL,
  names_sep = NULL,
  names_pattern = NULL,
  names_ptypes = NULL,
  names_transform = NULL
)
}
\arguments{
\item{data}{A data frame to pivot.}

\item{spec}{A specification data frame. This is useful for more complex
pivots because it gives you greater control on how metadata stored in the
column names turns into columns in the result.

Must be a data frame containing character \code{.name} and \code{.value} columns.
Additional columns in \code{spec} should be named to match columns in the
long format of the dataset and contain values corresponding to columns
pivoted from the wide format.
The special \code{.seq} variable is used to disambiguate rows internally;
it is automatically removed after pivotting.}

\item{names_repair}{What happens if the output has invalid column names?
The default, \code{"check_unique"} is to error if the columns are duplicated.
Use \code{"minimal"} to allow duplicates in the output, or \code{"unique"} to
de-duplicated by adding numeric suffixes. See \code{\link[vctrs:vec_as_names]{vctrs::vec_as_names()}}
for more options.}

\item{values_drop_na}{If \code{TRUE}, will drop rows that contain only \code{NA}s
in the \code{value_to} column. This effectively converts explicit missing values
to implicit missing values, and should generally be used only when missing
values in \code{data} were created by its structure.}

\item{values_ptypes}{A list of column name-prototype pairs.
A prototype (or ptype for short) is a zero-length vector (like \code{integer()}
or \code{numeric()}) that defines the type, class, and attributes of a vector.
Use these arguments if you want to confirm that the created columns are
the types that you expect. Note that if you want to change (instead of confirm)
the types of specific columns, you should use \code{names_transform} or
\code{values_transform} instead.}

\item{values_transform}{A list of column name-function pairs.
Use these arguments if you need to change the types of specific columns.
For example, \code{names_transform = list(week = as.integer)} would convert
a character variable called \code{week} to an integer.

If not specified, the type of the columns generated from \code{names_to} will
be character, and the type of the variables generated from \code{values_to}
will be the common type of the input columns used to generate them.}

\item{cols}{<\code{\link[=tidyr_tidy_select]{tidy-select}}> Columns to pivot into
longer format.}

\item{names_to}{A string specifying the name of the column to create
from the data stored in the column names of \code{data}.

Can be a character vector, creating multiple columns, if \code{names_sep}
or \code{names_pattern} is provided. In this case, there are two special
values you can take advantage of:
\itemize{
\item \code{NA} will discard that component of the name.
\item \code{.value} indicates that component of the name defines the name of the
column containing the cell values, overriding \code{values_to}.
}}

\item{values_to}{A string specifying the name of the column to create
from the data stored in cell values. If \code{names_to} is a character
containing the special \code{.value} sentinel, this value will be ignored,
and the name of the value column will be derived from part of the
existing column names.}

\item{names_prefix}{A regular expression used to remove matching text
from the start of each variable name.}

\item{names_sep}{If \code{names_to} contains multiple values,
these arguments control how the column name is broken up.

\code{names_sep} takes the same specification as \code{\link[=separate]{separate()}}, and can either
be a numeric vector (specifying positions to break on), or a single string
(specifying a regular expression to split on).

\code{names_pattern} takes the same specification as \code{\link[=extract]{extract()}}, a regular
expression containing matching groups (\verb{()}).

If these arguments do not give you enough control, use
\code{pivot_longer_spec()} to create a spec object and process manually as
needed.}

\item{names_pattern}{If \code{names_to} contains multiple values,
these arguments control how the column name is broken up.

\code{names_sep} takes the same specification as \code{\link[=separate]{separate()}}, and can either
be a numeric vector (specifying positions to break on), or a single string
(specifying a regular expression to split on).

\code{names_pattern} takes the same specification as \code{\link[=extract]{extract()}}, a regular
expression containing matching groups (\verb{()}).

If these arguments do not give you enough control, use
\code{pivot_longer_spec()} to create a spec object and process manually as
needed.}

\item{names_ptypes}{A list of column name-prototype pairs.
A prototype (or ptype for short) is a zero-length vector (like \code{integer()}
or \code{numeric()}) that defines the type, class, and attributes of a vector.
Use these arguments if you want to confirm that the created columns are
the types that you expect. Note that if you want to change (instead of confirm)
the types of specific columns, you should use \code{names_transform} or
\code{values_transform} instead.}

\item{names_transform}{A list of column name-function pairs.
Use these arguments if you need to change the types of specific columns.
For example, \code{names_transform = list(week = as.integer)} would convert
a character variable called \code{week} to an integer.

If not specified, the type of the columns generated from \code{names_to} will
be character, and the type of the variables generated from \code{values_to}
will be the common type of the input columns used to generate them.}
}
\description{
This is a low level interface to pivotting, inspired by the cdata package,
that allows you to describe pivotting with a data frame.
}
\examples{
# See vignette("pivot") for examples and explanation

# Use `build_longer_spec()` to build `spec` using similar syntax to `pivot_longer()`
# and run `pivot_longer_spec()` based on `spec`.
spec <- relig_income \%>\% build_longer_spec(
  cols = !religion,
  names_to = "income",
  values_to = "count"
)
spec

pivot_longer_spec(relig_income, spec)

# Is equivalent to:
relig_income \%>\% pivot_longer(
  cols = !religion,
  names_to = "income",
  values_to = "count")

}
\keyword{internal}

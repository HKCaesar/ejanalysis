% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rollup.pct.R
\name{rollup.pct}
\alias{rollup.pct}
\title{Calculate a/b for each Subset}
\usage{
rollup.pct(a, b, zone)
}
\arguments{
\item{a}{Required numeric vector, numerator}

\item{b}{Required numeric vector, denominator. Same length as a.}

\item{zone}{Optional, vector to group by. Same length as a and b.}
}
\value{
Returns a table with a/b calculated within each zone.
}
\description{
Uses data.table package to quickly calculate
  ratio of a/b within each subset of a dataset (e.g., by zone).
  This will be superseded by \code{\link{rollup}} once that is completed.
}
\examples{
  pre1960=1:100; builtunits=rep(c(10, 100),50); zone=rep(c('NY','MA'),50)
  rollup.pct(a,b,zone)
}

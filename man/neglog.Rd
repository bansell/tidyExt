% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/neglog.R
\name{neglog}
\alias{neglog}
\title{Converts p values to -log10(p_value)}
\usage{
neglog(x)
}
\value{
A vector.
}
\description{
see \href{https://github.com/bansell/tidyExt#tidyext-package}{\strong{tidyExt vignette}}
}
\examples{
neglog(c(0.02,0.01,1e-5,1e-7))
}

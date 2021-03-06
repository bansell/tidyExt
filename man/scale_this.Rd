% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scale_this.R
\name{scale_this}
\alias{scale_this}
\title{Scale column of data_frame without introducing a matrix. NB unlike scale(), this doesnt have an option to control centring.}
\usage{
scale_this(x)
}
\arguments{
\item{x}{A vector}
}
\value{
A vector of values scaled relative to their mean
}
\description{
see \href{https://github.com/bansell/tidyExt#tidyext-package}{\strong{tidyExt vignette}}
}
\examples{
scale_this(iris$Sepal.Length)
}

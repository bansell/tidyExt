% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/no_legend.R
\name{no_legend}
\alias{no_legend}
\title{No legend}
\usage{
no_legend()
}
\description{
Omits ggplot2 legend.
}
\details{
see \href{https://github.com/bansell/tidyExt#tidyext-package}{\strong{tidyExt vignette}}
}
\examples{
require(ggplot2)
mpg |> ggplot2::ggplot(aes(x=cty,y=hwy)) + geom_point(aes(col=drv)) + no_legend()
}

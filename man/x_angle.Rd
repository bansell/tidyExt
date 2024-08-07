% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/x_angle.R
\name{x_angle}
\alias{x_angle}
\title{Set x axis labels at any angle}
\usage{
x_angle(x = 30)
}
\arguments{
\item{x}{angle in degrees}
}
\description{
Set x axis labels at any angle
}
\examples{
require(ggplot2)
mpg |> ggplot2::ggplot(aes(x=manufacturer,y=hwy)) + geom_boxplot() + x_angle(45)
}

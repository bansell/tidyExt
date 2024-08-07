% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/brewer_GG_col.R
\name{brewer_GG_col}
\alias{brewer_GG_col}
\title{Select R color brewer palette and display swatch and hexcodes
see \href{https://github.com/bansell/tidyExt#tidyext-package}{\strong{tidyExt vignette}}}
\usage{
brewer_GG_col(
  nColours = 4,
  my_palette = "Paired",
  type = "div",
  nExtendColours = nColours,
  plot = T
)
}
\arguments{
\item{nColours}{Number of colours to select from palette. These will be evenly spaced across palette.}

\item{my_palette}{An RColourBrewer palette name (see RColorBrewer::display.brewer.all())}

\item{type}{Type of palette -     one of "seq" (sequential), "div" (diverging) or "qual" (qualitative)}

\item{nExtendColours}{If more colours are desired than are available in the standard palette, specify total colours here.}

\item{plot}{Default will plot the colour palette with the hex codes overlaid.}
}
\description{
Select R color brewer palette and display swatch and hexcodes
see \href{https://github.com/bansell/tidyExt#tidyext-package}{\strong{tidyExt vignette}}
}

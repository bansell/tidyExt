#' Converts p values to -log10(p_value)
#'
#' see \href{https://github.com/bansell/tidyExt#tidyext-package}{\strong{tidyExt vignette}}
#'
#' @return A vector.
#' @param x p value
#' @examples
#' neglog(c(0.02,0.01,1e-5,1e-7))
#' @export
neglog <- function(x){-log10(x)}

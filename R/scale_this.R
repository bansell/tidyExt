#scale_this function
# https://stackoverflow.com/a/35776313

#' Scale column of data_frame without introducing a matrix. NB unlike scale(), this doesnt have an option to control centring.
#'
#' see \href{https://github.com/bansell/tidyExt#tidyext-package}{\strong{tidyExt vignette}}
#' @param x A vector
#' @export
#' @return A vector of values scaled relative to their mean
#' @examples
#' scale_this(iris$Sepal.Length)
scale_this <- function(x){
  (x - mean(x, na.rm=TRUE)) / stats::sd(x, na.rm=TRUE)
}

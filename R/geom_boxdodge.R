#' Create boxplots with multiple series on x axis, overlaid with datapoints, displaying exact y values and jittered x values.
#'
#' see \href{https://github.com/bansell/tidyExt#tidyext-package}{\strong{tidyExt vignette}}
#'
#' @return A ggplot.
#' @param point_size size of points; default is 0.25
#' @param box_alpha alpha for boxplot background ; default is 0.5
#' @examples

#' require(ggplot2)
#' mpg |> ggplot2::ggplot(aes(x=class, y=cty, col=factor(year))) +
#'  geom_boxdodge(point_size = 3,box_alpha = 0.75)

#' @export
geom_boxdodge <- function (..., point_size =0.25, box_alpha=0.5){

  list(ggplot2::geom_boxplot(outlier.alpha = 0, alpha=box_alpha, ...),

       ggplot2::geom_point(position = ggplot2::position_jitterdodge(
         jitter.height = 0, jitter.width = 0.2, dodge.width = 0.9, ...),
         size = point_size,  ... )
       )
}





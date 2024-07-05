
#' Create boxplots overlaid with datapoints, displaying exact y values and jittered x values
#'
#' see \href{https://github.com/bansell/tidyExt#tidyext-package}{\strong{tidyExt vignette}}
#' @name geom_boxjitter
#' @return A ggplot.
#' @param point_size size of points; default is 0.5
#' @param point_col point colour; default is black
#' @param box_alpha alpha for boxplot background ; default is 1
#' @param jitterheight jitter height; default is 0
#' @param jitterwidth jitter width; default is 0.25
#' @examples
#' require(ggplot2)
#' mpg |> ggplot2::ggplot(aes(x=class, y=cty)) +
#'  geom_boxjitter(notch = FALSE, point_size = 2, point_col='dodger blue')

#' @export
geom_boxjitter <- function (..., point_size =0.5,
                            point_col='black' ,
                            box_alpha=1,
                            jitterheight = 0,
                            jitterwidth = 0.25){
  list(ggplot2::geom_boxplot(outlier.alpha = 0, alpha=box_alpha, ...),
       ggplot2::geom_jitter(height = jitterheight, width = jitterwidth, size = point_size,
                            col=point_col, ...))
}



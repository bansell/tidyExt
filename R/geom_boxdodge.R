#' Create boxplots with multiple series on x axis, overlaid with datapoints, displaying exact y values and jittered x values.
#' @return A ggplot.
#' @examples

#' mpg %>% ggplot(aes(x=class, y=cty, col=factor(year))) +
#'  geom_boxdodge(point_size = 3,box_alpha = 0.75)

#' @export
geom_boxdodge <- function (..., point_size =0.25, box_alpha=0.5){
  list(geom_boxplot(outlier.alpha = 0, alpha=box_alpha, ...),
       geom_point(position = position_jitterdodge(jitter.height = 0, jitter.width = 0.2, dodge.width = 0.9, ...),
                  size = point_size,  ...))
}






#' Create boxplots overlaid with datapoints, displaying exact y values and jittered x values.
#' @return A ggplot.
#' @examples
#' mpg %>% ggplot(aes(x=class, y=cty)) +
#'  geom_boxjitter(notch = F, point_size = 2, point_col='dodger blue')

#' @export
geom_boxjitter <- function (..., point_size =0.5, point_col='black' ,box_alpha=1){
  list(geom_boxplot(outlier.alpha = 0, alpha=box_alpha, ...),
       geom_jitter(height = 0, width = 0.25, size = point_size, col=point_col, ...))
}



#' Custom ggplot geoms


#cf https://stackoverflow.com/questions/4835332/how-can-i-combine-multiple-ggplot2-elements-into-the-return-of-a-function



#' Create boxplots overlaid with datapoints, displaying exact y values and jittered x values.
#' @return A ggplot.
#' @examples
#' mpg %>% ggplot(aes(x=class, y=cty)) +
#'  geom_boxjitter(notch = F, point_size = 2, point_col='dodger blue')

#' mpg %>% ggplot(aes(x=class, y=cty, col=factor(year))) +
#'  geom_boxdodge(point_size = 3,box_alpha = 0.75)

#' @export
geom_boxjitter <- function (..., point_size =0.5, point_col='black' ,box_alpha=1){
  list(geom_boxplot(outlier.alpha = 0, alpha=box_alpha, ...),
       geom_jitter(height = 0, width = 0.25, size = point_size, col=point_col, ...))
}

#' @export
geom_boxdodge <- function (..., point_size =0.25, box_alpha=0.5){
  list(geom_boxplot(outlier.alpha = 0, alpha=box_alpha, ...),
       geom_point(position = position_jitterdodge(jitter.height = 0, jitter.width = 0.2, dodge.width = 0.9, ...),
                  size = point_size,  ...))
}





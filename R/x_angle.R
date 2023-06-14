
#' Set x axis labels at any angle
#' @export
#' @examples
#' mpg |> ggplot(aes(x=manufacturer,y=hwy)) + geom_boxplot() + x_angle(45)
x_angle <- function(x = 30) ggplot2::theme(axis.text.x = ggplot2::element_text(angle=x, hjust=1))

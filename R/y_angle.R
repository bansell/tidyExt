
#' Set y axis labels at any angle
#' @param y angle in degrees
#' @export
#' @examples
#' require(ggplot2)
#' mpg |> ggplot2::ggplot(aes(x=hwy,y=manufacturer)) + geom_boxplot() + y_angle(45)

y_angle <- function(y = 30) ggplot2::theme(axis.text.y = ggplot2::element_text(angle = y, hjust = 1))

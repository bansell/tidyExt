#' Adds a linear regression line to scatter plot and calls ggpubr to print the line equation and p value.
#'
#' see \href{https://github.com/bansell/tidyExt#tidyext-package}{\strong{tidyExt vignette}}
#' @return Returns a ggplot.
#' @export
#' @examples
#' mpg %>% ggplot(aes(cty,hwy)) + geom_point() + geom_smooth_lm()

geom_smooth_lm <- function(SE=T,  p.colour="black", ...) {
  list(geom_smooth(method='lm',se=SE),
       ggpubr::stat_regline_equation(label.y.npc = 0.95),
       ggpubr::stat_cor(aes(label = ..p.label..),colour = p.colour, label.y.npc=0.85))
}

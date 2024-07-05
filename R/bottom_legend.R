#' Bottom legend
#'
#' see \href{https://github.com/bansell/tidyExt#tidyext-package}{\strong{tidyExt vignette}}
#'
#' @name bottom_legend
#' @description Moves ggplot2 legend to bottom of plotting space.
#' @export

bottom_legend <- function()list(ggplot2::theme(legend.position='bottom'))

#' @examples
#' require(ggplot2)
#' mpg |> ggplot2::ggplot(aes(x=cty,y=hwy)) + geom_point(aes(col=drv)) + bottom_legend()

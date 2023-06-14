#' No legend
#'
#' see \href{https://github.com/bansell/tidyExt#tidyext-package}{\strong{tidyExt vignette}}
#'
#' @name no_legend
#' @description Omits ggplot2 legend.
#' @export
#' @examples
#' mpg |> ggplot(aes(x=cty,y=hwy)) + geom_point(aes(col=drv)) + no_legend()

no_legend <- function()list(ggplot2::theme(legend.position='none'))

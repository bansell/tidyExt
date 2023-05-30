#' Geom origin. Draw x-y crosshair through the origin.
#' @name geom_origin

#' @param xorig intercept for x axis
#' @param yorig intercept for y axis

#' @examples
#' df <- tibble(x=rnorm(50),y=rnorm(50))
#' ggplot(df, aes(x=x,y=y)) + geom_point() + geom_origin()

#' @export
geom_origin <- function(lty=2, xorig=0, yorig=0, ...){
  list(ggplot2::geom_hline(yintercept = yorig, lty=lty, ...),
       ggplot2::geom_vline(xintercept = xorig, lty=lty, ...))
  }

#' Geom origin
#' @name geom_origin
#' @export

geom_origin <- function(lty=2, ...){
  list(ggplot2::geom_hline(yintercept = 0, lty=lty, ...),
       ggplot2::geom_vline(xintercept = 0, lty=lty, ...))
  }

#' @examples
#' df <- tibble(x=rnorm(50),y=rnorm(50))
#' ggplot(df, aes(x=x,y=y)) + geom_point() + geom_origin()

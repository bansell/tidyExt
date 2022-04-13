#' Geom origin
#' @name geom_origin
#' @export

geom_origin <- function(...){list(ggplot2::geom_hline(yintercept = 0,lty=2,...),
                                  ggplot2::geom_vline(xintercept = 0,lty=2,...))}

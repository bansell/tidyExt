require(ggplot2)
geom_origin <- function(...){list(geom_hline(yintercept = 0,lty=2,...),
                                  geom_vline(xintercept = 0,lty=2,...))}

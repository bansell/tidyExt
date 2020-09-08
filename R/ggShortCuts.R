
#' Custom legend & axis shortcuts

#' @export

bottom_legend <- ggplot2::theme(legend.position='bottom')

#' @export

no_legend <- ggplot2::theme(legend.position = 'none')

#' @export

x_angle30 <- ggplot2::theme(axis.text.x = ggplot2::element_text(angle=30, hjust=1))

#' @export

x_angle45 <- ggplot2::theme(axis.text.x = ggplot2::element_text(angle=45, hjust=1))

#' @export

geom_smooth <- geom_smooth(method='lm')

#Edit  legend title
#guides(col=guide_legend(title="Patient ID"),fill=guide_legend(title="Patient ID"))

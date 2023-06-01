#' ggplot error bars
#'
#' Draw error bars as standard error or standard deviation. cf https://stackoverflow.com/a/19299034/20620467.
#' Adapted from \href{https://rpkgs.datanovia.com/ggpubr/}{ggpubr}.
#'
#' @return A grob (graphical object).
#'
#' @examples
#' ggplot2::ggplot(mtcars, aes(x=cyl,y= qsec)) +
#'   geom_jitter(alpha=0.25,width=0.25) +
#'   geom_error_se(col='red', lwd=1,width=0.4) +
#'   geom_error_sd(col='blue',lwd=1,width=0.6) +
#'   geom_point(stat='summary',fun=mean,col='purple') +
#'   ggtitle('error bars',
#'   subtitle = '±1 standard deviation in blue;\n±1 standard error of the mean in red')
#'
#' @describeIn geom_error_sd Draw standard deviation bars
geom_error_sd <- function(...){
  requireNamespace("ggplot2")
  geom_errorbar( stat='summary',fun.data = mean_sd, ...)
}
#'
#' @describeIn geom_error_sd Draw standard error bars
geom_error_se <- function(...){
  requireNamespace("ggplot2")
  geom_errorbar( stat='summary',fun.data = mean_se, ...)
}
#'
#' @noRd
format_error <- function(d, error.limit = "both"){

  if(error.limit == "upper") d$ymin <- d$y
  else if(error.limit == "lower") d$ymax <- d$y
  else if(error.limit == "none")  d$ymin <- d$ymax <- d$y
  d
}
#' @noRd
mean_sd <- function (x, error.limit = "both")
{
  sd = stats::sd(x, na.rm = TRUE)
  .mean <- base::mean(x, na.rm = TRUE)
  data.frame(y = .mean, ymin = .mean - sd, ymax = .mean + sd) %>%
    format_error(error.limit)
}


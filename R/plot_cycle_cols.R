
#' Recycle color scales over multiple scatter plots
#'
#' Use cases include PCA / MDS plots with multiple factors
#'
#' see \href{https://github.com/bansell/tidyExt#tidyext-package}{\strong{tidyExt vignette}}
#' @param df data frame
#' @param X x axis mapping
#' @param Y y axis mapping
#' @param myLabel TBC: labelling functionality
#' @param colour_vec vector of values to colour points by.
#' @return cowplot list of ggplots
#'
#' @examples
#' my_df <- mpg %>% mutate(year=factor(year), cyl=factor(cyl))
#' my_features <- c('year','drv','cyl','manufacturer')
#'
#' plot_cycle_cols(df = my_df,  X='cty',Y='hwy', myLabel = 'manufacturer', colour_vec = my_features)

#' @export
plot_cycle_cols <- function(df, X,Y, myLabel, colour_vec ){

  require(tidyverse)


  var_plot2 <- function(x, ...){

    #for wide format:
    if(x %in% names(df)){
      df %>% gather(key,value, x) %>%
        ggplot(aes_string(x=X, y=Y, col="value")) + geom_point() +
        guides(col=guide_legend(x)) +
        theme(legend.position = 'bottom')

    }else{
      #for long format where _key is present_ :
      df %>% filter(key == x) %>%
        ggplot(aes_string(x=X, y=Y, col="value")) +
        geom_point() +
        guides(col=guide_legend(x)) +
        theme(legend.position = 'bottom')
    }
  }

  p_list <- map(colour_vec, var_plot2) #here var_plot2(x) takes each value in the colour_vec vector


  cowplot::plot_grid(plotlist = p_list, align = 'hv')
}

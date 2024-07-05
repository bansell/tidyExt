
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
#' @importFrom rlang .data
#'
#' @examples
#' require(ggplot2);
#' my_df <- mpg |> dplyr::mutate(year=factor(year), cyl=factor(cyl))
#' my_features <- c('year','drv','cyl','manufacturer')
#'
#' plot_cycle_cols(df = my_df,  X='cty',Y='hwy', myLabel = 'manufacturer', colour_vec = my_features)

#' @export
plot_cycle_cols <- function(df, X,Y, myLabel, colour_vec ){

  require(ggplot2)

  var_plot <- function(x, ...){

    #for wide format:
    if(x %in% names(df)){
      df |> tidyr::gather("key","value", x) |>
        ggplot2::ggplot(ggplot2::aes_string(x=X, y=Y, col="value")) +
        ggplot2::geom_point() +
        ggplot2::guides(col=ggplot2::guide_legend(x)) +
        ggplot2::theme(legend.position = 'bottom')

    }else{
      #for long format where _key is present_ :
      df |>
        dplyr::filter(.data$key == x) |>
        #cf https://community.rstudio.com/t/devtools-check-giving-error-on-dplyr-column-names/56754/2
        ggplot2::ggplot(ggplot2::aes_string(x=X, y=Y, col="value")) +
        ggplot2::geom_point() +
        ggplot2::guides(col=ggplot2::guide_legend(x)) +
        ggplot2::theme(legend.position = 'bottom')
    }
  }

  p_list <- purrr::map(colour_vec, var_plot) #here var_plot(x) takes each value in the colour_vec vector


  cowplot::plot_grid(plotlist = p_list, align = 'hv')
}

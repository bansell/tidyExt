#' Select R color brewer palette of type my_palette with nCols n colours
#' @name brewer_GG_col
#' @param my_palette An RColourBrewer palette name (see RColorBrewer::display.brewer.all())
#' @param nCols Number of colours to select from palette. These will be evenly spaced across palette.
#' @export
brewer_GG_col <- function(my_palette = 'Paired',nCols){
    scales::brewer_pal(palette = my_palette)(nCols)
  }
#'
#' @examples
#'brewer_GG_col('Blues', 3)
#'
#'
#' Select ggplot default colour palette of n. colours
#' @name default_GG_col
#' @export
default_GG_col <- function(x){scales::hue_pal(h = c(0, 360) + 15, c = 100, l = 65, h.start = 0, direction = 1,ncol=x)}
#'
#' @examples
#' default_GG_col(3)
#'
#' default_GG_col(9)

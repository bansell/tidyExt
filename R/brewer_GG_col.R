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



#' Select R color brewer palette and display swatch and hexcodes
#' see \href{https://github.com/bansell/tidyExt#tidyext-package}{\strong{tidyExt vignette}}
#' @name brewer_GG_col
#' @param nColours Number of colours to select from palette. These will be evenly spaced across palette.
#' @param my_palette An RColourBrewer palette name (see RColorBrewer::display.brewer.all())
#' @param nExtendColours If more colours are desired than are available in the standard palette, specify total colours here.
#' @param plott Default will plot the colour palette with the hex codes overlaid.
#' @export

brewer_GG_col <- function(nColours = 4, my_palette = 'Paired', type = 'div', nExtendColours = nColours, plot = T){

  #based on https://www.datanovia.com/en/blog/easy-way-to-expand-color-palettes-in-r/
  col_obj <- grDevices::colorRampPalette(scales::brewer_pal( palette=my_palette, type=type)(nColours))(nExtendColours)
  if (plot == TRUE) {
    scales::show_col(col_obj)
    return(col_obj)
  }
  else {
    return(col_obj)
  }
}

#' Select R color brewer palette of type my_palette with nCols n colours
#' @name brewer_GG_col
#' @param my_palette An RColourBrewer palette name (see RColorBrewer::display.brewer.all())
#' @param nColours Number of colours to select from palette. These will be evenly spaced across palette.
#' @export
brewer_GG_col <-  function(nColours = 4, my_palette = 'Paired'){
  print(scales::brewer_pal(palette = my_palette)(nColours))
  scales::show_col(scales::brewer_pal(palette = my_palette)(nColours))
}
#'
#' @examples
#'brewer_GG_col(6,'Blues')
#'




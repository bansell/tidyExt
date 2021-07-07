#' Select R color brewer palette and display swatch and hexcodes
#' see \href{https://github.com/bansell/tidyExt#tidyext-package}{\strong{tidyExt vignette}}
#' @name brewer_GG_col
#' @param my_palette An RColourBrewer palette name (see RColorBrewer::display.brewer.all()) .
#' @param nColours Number of colours to select from palette. These will be evenly spaced across palette.
#' @export
brewer_GG_col <-  function(nColours = 4, my_palette = 'Paired', plot = T){
        col_obj <- scales::brewer_pal(palette = my_palette)(nColours)
        if(plot == TRUE){
          scales::show_col(col_obj)
          return(col_obj)
        }else{
          return(col_obj)
          }
}
#'
#' @examples
#'brewer_GG_col(6,'Blues')





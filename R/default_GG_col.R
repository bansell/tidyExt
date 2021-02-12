#' Select ggplot default colour palette of n. colours
#' @name default_GG_col
#' @param nColours N colours to display
#' @export
default_GG_col <- function(nColours = 3, plot = TRUE){
  my_obj <- scales::hue_pal()(nColours)
  if(plot==TRUE){
      scales::show_col(my_obj)
      return(my_obj)
    }else{
      return(my_obj)
    }
}
#'
#' @examples
#' default_GG_col(3)
#'
#' default_GG_col(9)


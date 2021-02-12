#' Select ggplot default colour palette of n. colours
#' @name default_GG_col
#' @param nColours N colours to display
#' @export
default_GG_col <- function(nColours = 3){
  print(scales::hue_pal()(nColours))
  scales::show_col(scales::hue_pal()(nColours))
  }
#'
#' @examples
#' default_GG_col(3)
#'
#' default_GG_col(9)


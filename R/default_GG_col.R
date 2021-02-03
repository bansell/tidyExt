#' Select ggplot default colour palette of n. colours
#' @name default_GG_col
#' @param x N colours to select
#' @export
default_GG_col <- function(nCols = 5){
  scales::hue_pal(h = c(0, 360) + 15, c = 100, l = 65, h.start = 0, direction = 1)(nCols)
  }
#'
#' @examples
#' default_GG_col(3)
#'
#' default_GG_col(9)

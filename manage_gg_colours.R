#manage_gg_colors


#### manage colours ####

#ggplot default colors
default_GG_col <- scales::hue_pal(h = c(0, 360) + 15, c = 100, l = 65, h.start = 0, direction = 1)
default_GG_col(3)
## [1] "#F8766D" "#00BA38" "#619CFF"

default_GG_col(9)
## [1] "#F8766D" "#D39200" "#93AA00" "#00BA38" "#00C19F" "#00B9E3" "#619CFF" "#DB72FB"
## [9] "#FF61C3"


brewer_GG_col <- function(my_palette = 'Paired',nCols){
    scales::brewer_pal(palette = my_palette)(nCols)
  }

brewer_GG_col('Blues', 3)

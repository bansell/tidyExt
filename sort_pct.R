#cf https://tidyeval.tidyverse.org/multiple.html 

sort_pct <- function(.df, ... ){ 
  .df %>% dplyr::count(..., sort=TRUE) %>%  dplyr::mutate(pct = n/sum(n))}


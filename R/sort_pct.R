
#' Count any number of columns, print percentage and sort descending

#' @importFrom magrittr %>%
#' @export

#cf https://tidyeval.tidyverse.org/multiple.html
sort_pct <- function(.df, ... ){
  .df %>% dplyr::count(..., sort=TRUE) %>%  dplyr::mutate(pct = n/sum(n))}

#' @example
#' mtcars %>% sort_pct(cyl,gear)

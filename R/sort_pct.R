
#' Count any number of columns, print percentage and sort descending.
#'
#' see \href{https://github.com/bansell/tidyExt#tidyext-package}{\strong{tidyExt vignette}}

#' @export

#cf https://tidyeval.tidyverse.org/multiple.html
sort_pct <- function(.df, ... ){
  .df |> dplyr::count(..., sort=TRUE) |>  dplyr::mutate(pct = n/sum(n))}

#' @example
#' mtcars |> sort_pct(cyl,gear)

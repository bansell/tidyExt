#' Print values in vector 1 that are not in vector 2.
#'
#' see \href{https://github.com/bansell/tidyExt#tidyext-package}{\strong{tidyExt vignette}}
#'
#' @return A tibble.
#' @param x_vec vector of elements of any type
#' @param y_vec vector of elements of any type


#' @export
recip_anti <- function(x_vec, y_vec){

require(tibble)
require(dplyr)
require(tidyr)
require(purrr)

a <- unique(x_vec)
b <- unique(y_vec)

print(c(head(a),head(b)))

res_a <- a[which(!a %in% b)]
res_b <- b[which(!b %in% a)]

if(!(length(res_a)>0 | length(res_b)>0)) {
  message('NULL result; try recip_table() first.')
} else{
  lst <- list(res_a,res_b)

  #from https://stackoverflow.com/a/53684216
  res_tbl <- map_dfr(lst, ~as_tibble(t(.)) ) %>%
    mutate(tag=c("x_not_in_y",'y_not_in_x')) %>%
    gather(key,value,-tag) %>%
    spread(tag,value) %>% select(-key)

  return(res_tbl)
}

}

#' @examples
#' recip_anti(x_vec= c('apple', 'banana','pear'), y_vec = c('banana','peach'))

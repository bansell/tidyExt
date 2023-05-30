#' Count number of unique elements shared between two vectors. Option to check whether element order is identical.
#'
#' see \href{https://github.com/bansell/tidyExt#tidyext-package}{\strong{tidyExt vignette}}
#'This function requires tidyExt::recip_order() to be loaded.
#'
#' @return A tibble, and an optional message.
#' @param x_vec vector of elements of any type
#' @param y_vec vector of elements of any type


#' @export
recip_table <- function(x_vec, y_vec, check_order=F){
  require(tibble); require(dplyr); require(tidyr); require(stringr)
  require(janitor)

  if(check_order==T){


    message(recip_order(x_vec,y_vec))

  }

  a <- table(unique(x_vec) %in% unique(y_vec)) %>%  as_tibble_row() %>% tidy_names()
  b <- table(unique(y_vec) %in% unique(x_vec)) %>%  as_tibble_row() %>% tidy_names()

  # print(glue::glue('Unique x in y:', a, '\n',
  #                  'Unique y in x:', b,'.'))
  res <- dplyr::bind_cols(
    tibble('Match' = c('Unique x in y:','Unique y in x:')),
    dplyr::bind_rows(a,b)) %>%
    mutate_at(.vars = -1,.funs = ~as.numeric(as.character(.))) %>%
    mutate(across(-1,.fns=~ifelse(is.na(.),0,.))) %>%
    janitor::clean_names()

  if(length(colnames(res))>2){
    return(res %>% select(1,true,false))

  }else{
    return(res)
  }

}

#' @examples
#' recip_table(mtcars$mpg, mtcars$mpg[1:5])
#' recip_table(mtcars$mpg, sort(mtcars$mpg), check_order = T)
#' recip_table(mtcars$mpg[1:5], mtcars$mpg)
#' recip_table(mtcars$mpg, mtcars$mpg)
#' recip_table(mtcars$mpg, mtcars$cyl)








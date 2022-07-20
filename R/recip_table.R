
#' Reciprocal table function: quantifies the intersect of unique occurrences between two vectors
#'
#' @name recip_table
#' @return A tibble.
#' @param x_vec vector of values
#' @param y_vec vector of values
#' @examples
#' recip_table(mtcars$mpg,mtcars$mpg[1:5])
#' recip_table(mtcars$mpg[1:5], mtcars$mpg)
#' recip_table(mtcars$mpg, mtcars$mpg)
#' recip_table(mtcars$mpg, mtcars$cyl)

#' @export
recip_table <- function(x_vec,y_vec){
  require(tibble);require(dplyr); require(tidyr);require(stringr)
  require(janitor)
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
    return(res %>% dplyr::select(1,true,false))


  }else{return(res)}
}


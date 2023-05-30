#' Table output for baseR summary() function.
#' Default is to return summary stats for all columns containing continuous data.
#' Option to specify categorical data.
#'
#' @return A tibble.

#' @examples
#' mpg %>% summary_tidy(data_type = 'cont')
#' mpg %>% summary_tidy(data_type = 'categ')


summary_tidy <- function(tibble, data_type = "cont"){

  not_any_na <- function(y) all(!is.na(y))
  not_all_na <- function(y) any(!is.na(y))

  row_order <- c('Min.','1st Qu.','Mean','Median','Mode','3rd Qu.','Max.')

  #to silence .name_repaire messages: cf: https://github.com/tidyverse/tibble/issues/632
  #co <- capture.output( tibble::as_tibble(summary(tibble), .name_repair = 'universal'))
  #tbl1 <- print(co)
  #t1 <- tbl1 %>%

  #t1 <- {suppressWarnings(tibble::as_tibble(summary(mpg), .name_repair = 'universal'))} %>%
  #t1 <- tibble::as_tibble(summary(tibble), .name_repair = 'unique') %T>% {options(warn=-1)} %T>%
  t1 <- tibble::as_tibble(summary(tibble), .name_repair  = ~ vctrs::vec_as_names(..., quiet = TRUE)) %>%
    magrittr::set_colnames(paste0('x',1:3)) %>%
    select(-x1) %>% separate(x3,into=c('stat','value'), sep=':') %>%
    mutate(across(.fns=~trimws(.))) %>%
    na.omit() %>% spread(x2,value)

  cont <- t1 %>% filter(!stat %in% c('Class','Length')) %>%
    mutate(across(.cols = -1,.fns=~as.numeric(.))) %>%
    select_if(not_all_na) %>%
    #tidy reorder without forcats:
    arrange(match(stat, row_order))

  categ <- t1 %>%
    filter(stat %in% c('Class','Length')) %>%
    select_if(not_all_na)

  res <- list("categorical"=categ, "continuous"=cont)
  if(data_type=='cont'){
    rslt <- res$cont
  } else if(data_type=='categ'){
    rslt <- res$categ
  }
  return(rslt)
}



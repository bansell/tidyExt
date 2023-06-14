#' Count number of unique elements shared between two vectors. Option to check whether element order is identical.
#'
#' see \href{https://github.com/bansell/tidyExt#tidyext-package}{\strong{tidyExt vignette}}
#'This function requires tidyExt::recip_order() to be loaded.
#'
#' @return A tibble, and an optional message.
#' @param x_vec vector of elements of any type
#' @param y_vec vector of elements of any type

#' @examples
#' recip_table(mtcars$mpg, mtcars$mpg[1:5])
#' recip_table(mtcars$mpg, sort(mtcars$mpg), check_order = T)
#' recip_table(mtcars$mpg[1:5], mtcars$mpg)
#' recip_table(mtcars$mpg, mtcars$mpg)
#' recip_table(mtcars$mpg, mtcars$cyl)
#'
#' @importFrom rlang .data

#' @export
recip_table <- function(x_vec, y_vec, check_order=F){

  if(check_order==T){


    message(recip_order(x_vec,y_vec))

  }

  a <- table(unique(x_vec) %in% unique(y_vec)) |>  tibble::as_tibble_row() |> tibble::tidy_names()
  b <- table(unique(y_vec) %in% unique(x_vec)) |>  tibble::as_tibble_row() |> tibble::tidy_names()

  # print(glue::glue('Unique x in y:', a, '\n',
  #                  'Unique y in x:', b,'.'))
  res <- dplyr::bind_cols(
    tibble::tibble('Match' = c('Unique x in y:','Unique y in x:')),
    dplyr::bind_rows(a,b)) |>
    dplyr::mutate_at(.vars = -1, .funs = ~as.numeric(as.character(.))) |>
    dplyr::mutate(dplyr::across(-1,.fns=~ifelse(is.na(.),0,.))) |>
    janitor::clean_names()

  if(length(colnames(res))>2){
    return(res |> dplyr::select(1, .data$true, .data$false))

  }else{
    return(res)
  }

}









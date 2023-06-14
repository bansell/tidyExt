#' Tibble output for baseR summary() function.
#'
#' Default is to return summary stats for all columns containing continuous data.
#' Option to specify categorical data.
#'
#' @return A tibble.

#' @examples
#' mpg |> summary_tidy(data_type = 'cont')
#' mpg |> summary_tidy(data_type = 'categ')
#'
#' @importFrom rlang .data
#'
#' @export
summary_tidy <- function(tbl, data_type = "cont"){

  not_any_na <- function(y) all(!is.na(y))
  not_all_na <- function(y) any(!is.na(y))

  row_order <- c('Min.','1st Qu.','Mean','Median','Mode','3rd Qu.','Max.')

  t1 <- tibble::as_tibble(summary(tbl),
                          .name_repair  = ~ vctrs::vec_as_names(..., quiet = TRUE)) |>
    magrittr::set_colnames(paste0('x',1:3)) |>
    dplyr::select(- .data$x1) |> tidyr::separate(.data$x3, into=c('stat','value'), sep=':') |>
    dplyr::mutate(dplyr::across(.fns = ~trimws(.))) |>
    tidyr::drop_na() |> tidyr::spread(.data$x2, .data$value)

  cont <- t1 |> filter(! .data$stat %in% c('Class','Length')) |>
    dplyr::mutate(dplyr::across(.cols = -1, .fns = ~as.numeric(.))) |>
    dplyr::select_if(not_all_na) |>
    #tidy reorder without forcats:
    dplyr::arrange(match( .data$stat, row_order))

  categ <- t1 |>
    dplyr::filter(.data$stat %in% c('Class','Length')) |>
    dplyr::select_if(not_all_na)

  res <- list("categorical"=categ, "continuous"=cont)
  if(data_type=='cont'){
    rslt <- res$cont
  } else if(data_type=='categ'){
    rslt <- res$categ
  }
  return(rslt)
}



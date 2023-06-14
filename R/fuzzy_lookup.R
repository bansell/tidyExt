#' Fuzzy lookup
#'
#' Soft searching through a lookup table, and adding a new column containing standardized terms.
#' Designed for data cleaning/standardization. Implements soft search, and use of lookup tables, which are currently difficult with dplyr::case_when()/case_match().
#'
#' Maps over lookup table and runs str_detect(string, regex(query)) under the hood.
#'
#' @param lookup Lookup table (tibble) with at least 2 columns.
#' @param search_term First column in lookup containing soft strings for regex search.
#' @param replace_term Second column in lookup containing categorical data relating to each search term.
#' @param .df Tibble to search through. Default behaviour will add a new column containing the replace_term where appropriate.
#' @param search_col Name of .df column to search for fuzzy matches
#' @param new_col Name of new column in .df that will contain categorical data.
#' @param .default Default value if no match is found. This can be a column name from .df, or a user-defined value. Default value for .default is 'other'.
#' @param ignore.case Option to ignore case when fuzzy matching. This is passed to str_detect(search_col, regex(search_term, ignore_case = )).
#'
#' @return A data frame / tibble.
#' @examples

#' require(tibble)
#'
#' #Create tibble from mtcars data
#' mtcars_tbl <- tibble::as_tibble(mtcars,rownames='model')
#'
#' #Create a lookup table with the soft search term ($1) and new standardized/consistent term ($2)
#' lookup_tbl <- tibble::tribble(~key1, ~key2,
#'                       'mazda rx4', 'Mazda RX4',
#'                     # 'Merc', 'Mercedes',
#'                       'merc', 'Mercedes',
#'                       'HORNET','Hornet',
#'                       'hornet','Hornet')
#'
#' fuzzy_lookup(lookup = lookup_tbl,
#'              #lookup = lookup_tbl |> dplyr::slice(-1),
#'              search_term=key1, replace_term=key2,
#'              .df=mtcars_tbl, search_col='model', new_col='model_clean',
#'              .default = wt, ignore.case=T)
#'
#' fuzzy_lookup(lookup = lookup_tbl |> dplyr::slice(-1),
#'              search_term=key1, replace_term=key2,
#'              .df=mtcars_tbl, search_col='model', new_col='model_clean'
#' )
#'
#' @export
fuzzy_lookup <- function(lookup, search_term, replace_term,
                         .df, search_col, new_col,
                         .default='other', ignore.case=F){

  lookup <- lookup |>
    dplyr::select(x1={{search_term}}, x2={{replace_term}}) #only allow 2 cols & constrain colnames.

  df <- .df |> dplyr::distinct() |> tibble::rownames_to_column(var = 'rowdummy')
  df <-  df |> dplyr::mutate(rowdummy=as.numeric(rowdummy))


  res1 <- purrr::pmap_dfr(lookup, function(x1,x2, ...){

    df |> dplyr::filter(stringr::str_detect(.data[[search_col]],
                        stringr::regex(x1, ignore_case = ignore.case))) |>
      dplyr::mutate({{new_col}} := x2)
  })

  message(glue::glue('Updated {nrow(res1)} rows'))


  dfmod <- df |> dplyr::mutate({{new_col}} := as.character({{.default}}))
  #print(dfmod)

  res2 <- dplyr::anti_join(dfmod,  res1 , by='rowdummy')

  #Preserve original order:

  #res <- left_join(distinct(df), res3) # , by={{search_col}})

  res <- dplyr::bind_rows(res1,res2) |> dplyr::arrange(rowdummy) |>
    dplyr::select(-rowdummy)

  if(nrow(res) != nrow(.df)){
    warning('Returned data row number is different to input data row number. Run distinct(df), and then check for redundancy in the lookup table search terms. Use case_when() to control the heirarchy for redundant strings.')
  }

  return(res)


}

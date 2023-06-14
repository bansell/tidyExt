#' Convert vector elements to a delimited string.
#'
#' This function performs the converse to separate_rows() / \href{https://tidyr.tidyverse.org/reference/separate_longer_delim.html}{separate_longer_delim()} functions. Adapted from https://stackoverflow.com/a/56810542.
#' Note this function allows non-standard evaluation. Quotes for column names and groups are optional.
#'
#' see \href{https://github.com/bansell/tidyExt#tidyext-package}{\strong{tidyExt vignette}}

#' @param .data A tibble.
#' @param input_colname The column name to collapse into rows.
#' @param output_colname The new column name to contain collapsed data.
#' @param group_var Any number of grouping columns.
#' @param delim Delimeter for collapsed data.
#' @return If no groups are specified, returns a vector; else returns an ungrouped dataframe.
#'
#' @examples
#' mpg |> unite_rows(displ, displ_str, class)
#' mpg |> unite_rows(displ, displ_str, c(class, cyl), delim=',')

#' @export
unite_rows <- function(.data, input_colname, output_colname, group_var , delim=';'){

  #run in console:
  #usethis::use_tidy_eval() # https://stackoverflow.com/a/75676546

  input_colname  <- rlang::ensym(input_colname)
  output_colname <- rlang::ensym(output_colname)

  #adapted from https://stackoverflow.com/a/68866579

  grp_lst <- as.list(substitute(group_var))

  if(length(grp_lst)>1) grp_lst <- grp_lst[-1]
  grps <- purrr::map_chr(grp_lst, rlang::as_string)

  .data |>
    #group_by(...) |> #works; see unite_rows_dotdot
    dplyr::group_by(dplyr::across(tidyselect::all_of(grps))) |>
    dplyr::reframe(!!{{output_colname}} := paste(!!input_colname, collapse = delim))
}

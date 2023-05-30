#' Convert vector elements to a delimited string.
#'
#' This function performs the converse to separate_rows() / \href{https://tidyr.tidyverse.org/reference/separate_longer_delim.html}{separate_longer_delim()} functions. Adapted from https://stackoverflow.com/a/56810542.
#' Note this function allows non-standard evaluation. Quotes in
#'
#' see \href{https://github.com/bansell/tidyExt#tidyext-package}{\strong{tidyExt vignette}}

#' @param .data A tibble
#' @param input_colname The column name to collapse into rows
#' @param output_colname The new column name to contain collapsed data
#' @param ... Any number of grouping columns
#' @param collapse delimeter for collapsed data
#' @return If no groups are specified, returns a vector; else returns an ungrouped dataframe.
#'
#' @examples
#' mpg %>% unite_rows_dotdot(displ,displ_str,class)
#' mpg %>% unite_rows_dotdot(displ,displ_str,class,cyl,delim=',')

#' @export
unite_rows_dotdot <- function(.data, input_colname, output_colname, ... , delim=';'){

  input_colname  <- ensym(input_colname)
  output_colname <- ensym(output_colname)

  .data %>%
    #to allow multiple groupings (nb no need for ensym/enquo here):
    #group_by(pick(all_of(group_var))) %>%
    #group_by(...) %>% #works
    group_by(!!! ensyms(...)) %>%
    reframe(!!{{output_colname}} := paste(!!input_colname, collapse = delim))
}



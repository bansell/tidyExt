
#' Fix tidyverse conflicts by exporting tidyverse functions to global environment.
#' Author: Jacob Munro
#' @return
#' @export
#'
#'
#'
fix_tidyverse_conflicts <- function() {
  tidyverse::tidyverse_conflicts() %>%
    purrr::map2_df(., names(.), ~ dplyr::tibble(fun = .y, masker = .x[1], maskee = list(.x[-1]))) %>%
    {
      if(nrow(.)) {
        tidyr::unnest(., maskee) %>%
          dplyr::mutate_at(dplyr::vars(masker, maskee), ~ stringr::str_remove(., 'package:')) %>%
          dplyr::filter(maskee %in% tidyverse::tidyverse_packages()) %>%
          {
            if(nrow(.)) {
              with(., stringr::str_c(fun, ' <- ', maskee, '::', fun)) %>%
                purrr::walk(~ {
                  eval(parse(text = .), envir = .GlobalEnv)
                  message(.)
                })
            }
          }
      }
    }
}

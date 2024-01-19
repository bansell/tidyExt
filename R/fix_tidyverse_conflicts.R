#' @export
fix_tidyverse_conflicts <- function() {

  confl <- tidyverse::tidyverse_conflicts()

  confl_tbl <- purrr::map2_df(confl,
                              names(confl),
                              ~ dplyr::tibble(fun = .y, masker = .x[1], maskee = list(.x[-1]))) %>%
    dplyr::mutate(fun = dplyr::if_else(stringr::str_detect(fun, '^%.+%$'),
                                       stringr::str_c('`', fun, '`'),
                                       fun))

  {
    if(nrow(confl_tbl) > 0) {

      #for testing:
      # confl_tbl$maskee[1] <- 'package:dplyr'

      confl_tbl_tidyv <-  tidyr::unnest(confl_tbl, maskee) %>%
        dplyr::mutate_at(dplyr::vars(masker, maskee), ~ stringr::str_remove(., 'package:')) %>%
        dplyr::filter(maskee %in% tidyverse::tidyverse_packages())

      {
        if(nrow(confl_tbl_tidyv) > 0) {
          to_assign <- with(confl_tbl_tidyv, stringr::str_c(fun, ' <- ', maskee, '::', fun))

          purrr::walk(to_assign, ~ {
            eval(parse(text = .), envir = .GlobalEnv)
            message(.)
          })
        }
        }
    }
    }
}

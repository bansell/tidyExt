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
#' recip_table(mtcars$mpg, sort(mtcars$mpg), check_order = TRUE)
#' recip_table(mtcars$mpg[1:5], mtcars$mpg)
#' recip_table(mtcars$mpg, mtcars$mpg)
#' recip_table(mtcars$mpg, mtcars$cyl)
#'
#' @importFrom rlang .data

#' @export
function (x_vec, y_vec, check_order = FALSE, print_matches = FALSE)
{
  if (check_order) {
    message(recip_order(x_vec, y_vec))
  }

  unique_x_in_y <- unique(x_vec) %in% unique(y_vec)
  unique_y_in_x <- unique(y_vec) %in% unique(x_vec)

  if (print_matches) {
    print(tibble('matching_values' = unique(x_vec[unique_x_in_y])))
  }

  a <- tibble::tidy_names(tibble::as_tibble_row(table(unique_x_in_y)))
  b <- tibble::tidy_names(tibble::as_tibble_row(table(unique_y_in_x)))

  res <- janitor::clean_names(
    dplyr::mutate(dplyr::mutate_at(dplyr::bind_cols(
      tibble::tibble(Match = c("Unique x in y:", "Unique y in x:")),
      dplyr::bind_rows(a, b)), .vars = -1,
      .funs = ~as.numeric(as.character(.))),
      dplyr::across(-1, .fns = ~ifelse(is.na(.), 0, .))))

  if (length(colnames(res)) > 2) {
    return(dplyr::select(res, 1, true, false))
  } else {
    return(res)
  }
}



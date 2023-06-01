#' stringr regex helpers
#'
#' Identifies substring occuring before or after character.
#' Note: these are technically all_after_last() and all_before_first() occurances.
#' see \href{https://github.com/bansell/tidyExt#tidyext-package}{\strong{tidyExt vignette}}
#'
#' @return A vector.
#' @param character A character string.
#' @describeIn all_after Extract all characters after match.
all_after <-  function(character){glue::glue('[^{character}]*$')}
#' @describeIn all_after Extract all characters before match.
all_before <- function(character){glue::glue('[^{character}]+')}
#'
#' @examples
#' stringr::str_extract('string_test',all_after("_"))
#' stringr::str_remove('string_test',all_after("_"))
#'
#' stringr::str_extract('string/test',all_after("/"))
#' stringr::str_extract('string/test',all_before("/"))
#
#' stringr::str_extract('string_test',all_before("_"))
#' stringr::str_remove('string_test',all_before("_"))
#
#
#' stringr::str_extract('string_test_two', all_after("_"))
#' stringr::str_remove('string_test_two',  all_after("_"))
#
#' stringr::str_extract('string_test_two', all_before("_"))
#' stringr::str_remove('string_test_two',  all_before("_"))








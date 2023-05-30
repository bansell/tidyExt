#' Shortcuts for stringr regex. Identifies substring occuring before or after character.
#' Note: these are technically all_after_last() and all_before_first() occurances.
#' see \href{https://github.com/bansell/tidyExt#tidyext-package}{\strong{tidyExt vignette}}
#'
#' @return A vector.

#' @examples
#' str_extract('string_test',all_after("_"))
#' str_remove('string_test',all_after("_"))
#'
#' str_extract('string/test',all_after("/"))
#' str_extract('string/test',all_before("/"))
#
#' str_extract('string_test',all_before("_"))
#' str_remove('string_test',all_before("_"))
#
#
#' str_extract('string_test_two', all_after("_"))
#' str_remove('string_test_two',  all_after("_"))
#
#' str_extract('string_test_two', all_before("_"))
#' str_remove('string_test_two',  all_before("_"))


#' @export

all_after <-  function(character){glue::glue('[^{character}]*$')}
all_before <- function(character){glue::glue('[^{character}]+')}





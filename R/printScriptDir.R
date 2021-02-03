#' Print complete path of current file
#' @export
#' @examples
#' printScriptDir()

printScriptDir <- function(x = .){ rstudioapi::getActiveDocumentContext()$path }

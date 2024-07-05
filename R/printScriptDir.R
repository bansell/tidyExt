#' Print complete path of current file
#' @export
printScriptDir <- function(x = .){ cat(rstudioapi::getActiveDocumentContext()$path )}

#' @examples
#' printScriptDir()

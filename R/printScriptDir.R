#' Print complete path of current file
#' @export
#' @examples
#' printScriptDir()
printScriptDir <- function(x = .){ cat(rstudioapi::getActiveDocumentContext()$path )}


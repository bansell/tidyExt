#' Read saved rds
#' @name read_saved_rds
#' @export

read_saved_rds <- function(obj,file){

  #TBC take input as exact saveRDS call (no quotes)

  a <- readr::read_rds(file)

  assign(obj, a, envir = .GlobalEnv)

  print(paste0('Created global environment variable ',obj,' from input file.'))


}

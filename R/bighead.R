#bighead function



#' Extract from a DGE object genes associated with a GO term of interest, e.g. from GSEA testing. Requires GOsource() output.
#' @param .df A data frame or matrix
#' @param n number of rows and columns to print (square output, starting from row1, col1)
#' @export
#' @return A data_frame (aka tibble) to the console. EG.GO and entrez_joinTable are exported to R_GlobalEnv.
#' @examples
#' mtc_mat <- as.matrix(mtcars)
#' mtc_mat %>% bighead(8)

bighead <- function(.df, n = 6){

  as_tibble(.df[1:n,1:n]) }


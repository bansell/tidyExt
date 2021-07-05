#' Print all data frame rows to console

#' @return A data frame.
#' @export
#' @examples
#' mpg %>% print_all()
#' mpg %>% print_all(n=50)

print_all <- function(x, n = nrow(x)){print(x, n = n )}


#' Report whether the order of two vectors is identical.
#'
#' see \href{https://github.com/bansell/tidyExt#tidyext-package}{\strong{tidyExt vignette}}

#'
#' @return A message.
#' @param x_vec vector of elements of any type.
#' @param y_vec vector of elements of any type.


#' @export
recip_order <- function(x_vec, y_vec) {

  #from https://stackoverflow.com/a/23393392

  x <- x_vec; y <- y_vec

  if (isTRUE(all.equal(x,y))) {
    message('Perfect match; same order.')
  }else if (isTRUE(all.equal(sort(x),sort(y)))){
    message('Perfect match; wrong order.')
  }else{

    message('Imperfect match; unknown order.')
  }


}

#' @examples
#' all.equal(sort(mtcars$mpg),sort(mtcars$mpg[1:5]))
#' recip_order(mtcars$mpg,mtcars$mpg)
#' recip_order(mtcars$mpg,sort(mtcars$mpg))
#' recip_order(mtcars$mpg,mtcars$mpg[1:5])

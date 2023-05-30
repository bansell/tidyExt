#' Quote this. Converts a long quoted string to separate elements in a vector.
#'
#' Runs scan() under the hood
#' TBC: ideally split on any delim/white space as determined by user.

#' @name quote_this
#' @examples
#' quote_this('apple pear banana')

#' @export
quote_this <- function(x, what=" "){scan(text=x,what=what)}

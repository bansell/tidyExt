#quote_this

#takes a chunk of text and converts to vector values. runs scan() under the hood
#TBC: ideally split on any delim/white space as determined by user.

quote_this <- function(x, what=" "){scan(text=x,what=what)}

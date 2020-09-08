#custom ggplot geoms

#cf https://stackoverflow.com/questions/4835332/how-can-i-combine-multiple-ggplot2-elements-into-the-return-of-a-function

geom_boxjitter <- function(...){
  list(geom_boxplot(outlier.alpha = 0, ...) ,
       geom_jitter(height=0, width=0.25, cex=0.25, ...))
}


geom_boxdodge <- function(...){
  list(geom_boxplot(outlier.alpha = 0, ...) ,
       geom_point(position = position_jitterdodge(jitter.height=0, jitter.width=0.25, dodge.width=0.75, ...),
                  cex=0.15, ...))
}




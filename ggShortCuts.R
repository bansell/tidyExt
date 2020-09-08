
#custom legend& axis shortcuts

bottom_legend <- theme(legend.position='bottom')

no_legend <- theme(legend.position = 'none')


x_angle30 <- theme(axis.text.x = element_text(angle=30, hjust=1))

x_angle45 <- theme(axis.text.x = element_text(angle=45, hjust=1))

geom_smooth <- geom_smooth(method='lm')

#Edit  legend title  
#guides(col=guide_legend(title="Patient ID"),fill=guide_legend(title="Patient ID"))
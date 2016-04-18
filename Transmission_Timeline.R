timeline = read.csv("~/Dropbox/Copy of ICs_JACmanuscript- EpiLink.csv",sep=",", stringsAsFactors = F)
timeline$DOA = as.Date(timeline$DOA, "%d/%m/%y")
timeline$DOD = as.Date(timeline$DOD, "%d/%m/%y")
mdfr <- melt(timeline, measure.vars = c("DOA", "DOD"))

mdfr$Hospital = gsub("TTSH","B",mdfr$Hospital)
mdfr$Hospital = gsub("SGH","A",mdfr$Hospital)
mdfr$Hospital = gsub("NUH","C",mdfr$Hospital)
mdfr$Hospital = gsub("AH","D",mdfr$Hospital)

science_theme = theme(panel.grid.major = element_line(size = 0.3, color = "grey"), axis.line = element_line(size = 0.7, color = "black"), legend.position = "left", text = element_text(size = 20))

ggplot(mdfr, aes(value, reorder(Sample,Sequence), colour = Hospital)) + 
  geom_line(size = 8) +
  xlab(NULL) + 
  ylab(NULL) + scale_color_manual(values=c("#504A4B","black","#B6B6B4","light grey")) + theme_bw(base_size = 20, base_family = "Helvetica") + science_theme

pdf(file = "transmission_timeline.pdf", width= 16, height = 12, #' see how it looks at this size useDingbats=F)
transmission_timeline
dev.off()

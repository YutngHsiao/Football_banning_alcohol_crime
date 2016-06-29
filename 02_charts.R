licrary(ggplot2)

##plot offence type
offence_p <- ggplot(offence_melt, aes(x=year, y=v, group= offence)) + geom_line(aes(colour = offence))
offence_p <- ggplot(offence_melt, aes(x=variable, y=value, group= Offence.type)) + geom_line(aes(colour = Offence.type))
offence_p + geom_text(data = offence_melt[offence_melt$variable == "X2015",], aes(label = Offence.type), hjust = .6, vjust = 1)

##plot line graph with smooth  
l1 <- ggplot(crime_sub_melt, aes(x=year,y=count , group=region))+geom_line()
l1 + geom_line(aes(colour = region)) + stat_smooth(aes(colour = region),fill="blue", alpha=.2)

##plot normalized figures
dfb <- as.data.frame(t(dfb[110,]))
colnames(dfb) <- "x"
pb <- ggplot(dfb, aes(x=rownames(dfb), dfb$x, fill=c("a","b","c"))) + geom_bar(width=.5, stat="identity") + scale_fill_manual(values=c("#CC6666","#0072B2", "#E69F00"))
pb+ylim(0,1)+coord_flip()+ theme(axis.title.x=element_blank(),axis.title.y=element_blank(),
                                 axis.text.x=element_blank(),
                                 axis.ticks.x=element_blank(),legend.position="none")

##plot corr and comparism
ggplot(data=ban.df, aes(x=club, y=mean, fill=club)) +
  geom_bar(colour=bar_c, stat="identity") +
  guides(fill=FALSE)
ggplot(data=ccor, aes(x=club, y=X0.9, fill=club)) +
  geom_bar(colour=bar_c, stat="identity") +
  guides(fill=FALSE)
ggplot(data=all_m, aes(x=region, y=value, fill=variable)) +
  geom_bar(colour=ccc, stat="identity") +
  guides(fill=FALSE)

ggplot(all_m, aes(region, value)) +geom_bar(aes(fill = variable), position = "dodge", stat="identity") + scale_fill_manual(value = colour_set)

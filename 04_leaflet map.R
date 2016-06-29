library(leaflet)

fldr <- tempfile()
dir.create(fldr)

pop <- lapply(seq(ncol(dfb1)), function(i) {
  dfbbb <- as.data.frame(dfb1[,i])
  colnames(dfbbb) <- "x"
  pb <- ggplot(dfbbb, aes(x=rownames(dfbbb), dfbbb$x,fill=c("a","b","c"))) + geom_bar(width=.5, stat="identity") + scale_fill_manual(values=c("#CC6666","#0072B2", "#E69F00"))
  pb <- pb+ylim(0,1)+coord_flip()+ theme(axis.title.x=element_blank(),axis.title.y=element_blank(),
                                         axis.text.x=element_blank(),
                                         axis.ticks.x=element_blank(),legend.position="none")
  
  svg(filename = paste(fldr, "test.svg", sep = "/"), width = 3, height = 1)
  print(pb)
  dev.off()
  tst <- paste(readLines(paste(fldr, "test.svg", sep = "/")), collapse = "")
  return(tst)
})

pal1 <- colorFactor("Reds", alc_map$d1)
pal2 <- colorFactor("Blues", alc_map$c)
pal3 <- colorFactor("YlOrRd", alc_map$c)

state_popup <- paste0("<strong>District: </strong>", 
                      gadm$NAME_2,
                      "<br><strong>Region: </strong>", 
                      alc_map$region,
                      "<br><strong> % of drank more than 8/6 units one day: </strong>",
                      round(alc_map$avg_alc, 2), pop1
                      )

leaflet(data = gadm) %>%
  addProviderTiles("CartoDB.Positron") %>%
  addPolygons(fillColor = ~pal1(alc_map$d1), 
              fillOpacity = 0.5, 
              color = "#BDBDC3", 
              weight = 1
              ) %>% 
  addPolygons(fillColor = ~pal2(alc_map$c), 
              fillOpacity = 0.5, 
              color = "#BDBDC3", 
              weight = 1 
              ) %>% 
  addPolygons(fillColor = ~pal3(alc_map$b), 
              fillOpacity = 0.5, 
              color = "#BDBDC3", 
              weight = 1, 
              popup = state_popup)
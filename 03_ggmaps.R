library(ggmap)
p<-ggmap::ggmap(map) 
p <- p + geom_polygon(data = alc_M, aes(x = long, y = lat, group = group, fill = alc_M$d1))
p
##plot mixed map
cri_M = merge(shapeGadm, alc_map, by.x = "id", by.y = "ID_2", all = T)
p<-ggmap::ggmap(map) 

p <- p + geom_polygon(data = alc_M, aes(x = long, y = lat, group = group, fill = alc_M$d1,alpha = 1)) +     scale_fill_distiller(palette = "Reds", trans = 'reverse')
p <- p + geom_point(data = ban_cat, 
                    aes(ban_cat$lon, ban_cat$lat, 
                        size = ban_cat$ban_w),
                    colour= "yellow",
                    alpha = 0.6) 
p <- p + geom_text(data=ban_cat, aes(ban_cat$lon, ban_cat$lat-.2,label=Category, colour= 'blue3'))


## plot alc + banning 
pa <- ggplot() + theme(panel.background = element_rect(fill = "gray66"))
pa <- pa+  geom_polygon(data = alc_M, aes(x = long, y = lat, group = group, fill = alc_M$d1)) +
  scale_fill_distiller(palette = "YlOrRd", trans = 'reverse')
pa <- pa + geom_point(data = ban_cat, 
                      aes(ban_cat$lon, ban_cat$lat, 
                          size = ban_cat$m1),
                      colour= "orange",
                      fill = "yellow",
                      pch=21, stroke = 2,
                      alpha = 0.8) + scale_size(range = c(0, 36))
pa <- pa + geom_text(data=ban_cat, aes(ban_cat$lon, ban_cat$lat-.2,label=region), colour = "blue3")+ geom_text(data=ban_cat, aes(ban_cat$lon, ban_cat$lat,label=mean), colour = "blue3")

## plot crime + banning 
pc <- ggplot() +
  geom_polygon(data = cri_M, aes(x = long, y = lat, group = group, fill = cri_M$c)) +
  scale_fill_distiller(palette = "Blues", trans = 'reverse')
pc <- pc + geom_point(data = ban_cat, 
                      aes(ban_cat$lon, ban_cat$lat, 
                          size = ban_cat$m1),
                      colour= "orange",
                      fill = "yellow",
                      pch=21, stroke = 2,
                      alpha = 0.6) + scale_size(range = c(0, 24))

pc <- pc +theme(panel.background = element_rect(fill = "gray66"))
pc + geom_text(data=ban_cat, aes(ban_cat$lon, ban_cat$lat,label=mean), colour = "blue3")+ geom_text(data=ban_cat, aes(ban_cat$lon, ban_cat$lat-.2,label=region), colour = "blue3")


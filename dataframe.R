
library(ggplot2)
library(ggmap)

us <- map_data("state")

datamap <- ggplot(mergestatedf, aes(map_id = stateName))
datamap <- datamap + geom_map(map = us, aes(fill=stateArea))
datamap <- datamap + expand_limits(x= us$long, y = us$lat)
datamap <- datamap + coord_map() + ggtitle("State Area")
datamap

datamapmurder <- ggplot(mergestatedf, aes(map_id = stateName))
datamapmurder <- datamapmurder + geom_map(map = us, aes(fill=Murder))
datamapmurder <- datamapmurder + expand_limits(x= us$long, y = us$lat)
datamapmurder <- datamapmurder + coord_map() + ggtitle("Map by Murder")
datamapmurder

datapoint <- datamapmurder + geom_point(data = mergestatedf, aes(x=mergestatedf$xstate, y=mergestatedf$ystate , size = mergestatedf$population)) 
datapoint

#Since New York is the 32nd column, I checked the coordinates of New York. (I also cross checked online as
# to confirm once again for New York City as I was confused between New York State and City.)
mergestatedf[32,]

datazoom <- datapoint + scale_x_continuous(limits = c(-85.1449, -65.1449), expand = c(0,0)) + scale_y_continuous(limits=c(33.1361, 53.1361), expand = c(0,0))
datazoom <- datazoom + coord_map() 
datazoom

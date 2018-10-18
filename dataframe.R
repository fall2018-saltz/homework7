
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

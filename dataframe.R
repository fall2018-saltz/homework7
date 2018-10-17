
library(ggplot2)
library(ggmap)

us <- map_data("state")

datamap <- ggplot(mergestatedf, aes(map_id = stateName))
datamap <- datamap + geom_map(map = us, aes(fill=StateArea))
datamap <- datamap + expand_limits(x= us$long, y = us$lat)
datamap <- datamap + coord_map() + ggtitle("State Area")
datamap

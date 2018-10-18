
#Installing the libraries once again as MIDST requires that.

library(ggplot2)
library(ggmap)

#Loading the map data.
us <- map_data("state")

#I used ggplot and map_id to get the data of the map. Then I added stateArea in the aesthetics
#to fill the map by the state area.
#I used geom_map to show the map.
datamap <- ggplot(mergestatedf, aes(map_id = stateName))
datamap <- datamap + geom_map(map = us, aes(fill=stateArea))
datamap <- datamap + expand_limits(x= us$long, y = us$lat)
datamap <- datamap + coord_map() + ggtitle("State Area")
datamap

#I switched the stateArea to Murder for this question.

datamapmurder <- ggplot(mergestatedf, aes(map_id = stateName))
datamapmurder <- datamapmurder + geom_map(map = us, aes(fill=Murder))
datamapmurder <- datamapmurder + expand_limits(x= us$long, y = us$lat)
datamapmurder <- datamapmurder + coord_map() + ggtitle("Map by Murder")
datamapmurder

#I plotted population values in circles on the map which had Murder already given. As I'm assuming we had to repeat that step.
#I used geom_point for that and used the stateCenter coordinates as the aesthetics.
datapoint <- datamapmurder + geom_point(data = mergestatedf, aes(x=mergestatedf$xstate, y=mergestatedf$ystate , size = mergestatedf$population)) 
datapoint

#Since New York is the 32nd column, I checked the coordinates of New York. (I also cross checked online as
# to confirm once again for New York City as I was confused between New York State and City.)

mergestatedf[32,]

#The coordinates of New York -75.1449,  43.1361)

#I then zoomed in the data using coord_map and sent 
datazoom <- datapoint + scale_x_continuous(limits = c(-85.1449, -65.1449), expand = c(0,0)) + scale_y_continuous(limits=c(33.1361, 53.1361), expand = c(0,0))
datazoom <- datazoom + coord_map() + ggtitle("Zoomed Map") 
datazoom


#IST 687 
#Homework 7 - Maps
#Homework due on October 17th, 2018.
#Submitted by Rohan Mahajan on October 17th, 2018.
#Submitted using MIDST

#Loading the libraries
library(ggplot2)
library(ggmap)
library(tibble)


readStates <- function(states)
{
    #removing first row
    
    states <- states[-1,]
    
    #removing last row
    
    num.row <- nrow(states)
    states <- states[-num.row,]
    
    #removing the first four columns
    states <- states[,-1:-4]
    
    #changing names for remaining columns
    colnames(states)<-c("stateName","population","popOver18","percentOver18")
    
    #returning the states dataset
    return(states)
    
    
    
}

cleanCensus <- readStates(raw_data)
str(cleanCensus)

#Loading the second dataset which is arrests.

arrests <- USArrests
arrests <- rownames_to_column(arrests, var = "stateName")
arrests

#Merging the data sets

mergedataframe <- merge(cleanCensus,arrests, by = "stateName")
mergedataframe
mergedataframe$stateName <- tolower(mergedataframe$stateName)

#I first tried to add the stateArea and stateCenter directly to mergedataframe but then the stateCenter
#values came in as a vector. To prevent this, I created a seperate dataframe called statedf and it worked.

statedf <- data.frame(state.name,state.center,state.area)
statedf

#Assigned an object to the dataframe.
statedataframe <- statedf
statedataframe

#Changed to column names to merge.
colnames(statedataframe)<-c("stateName","xstate","ystate","stateArea")
statedataframe

statedataframe$stateName <- tolower(statedataframe$stateName)
statedataframe

mergestatedf <- merge(mergedataframe, statedataframe, by = "stateName")
mergestatedf


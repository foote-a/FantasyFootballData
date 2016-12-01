# setting working directory
setwd("C:/Users/afoote/Documents/Data Science/mydata")

# library imports
library(ggplot2)
library(partykit)
library(plyr)
library(dplyr)

# data imports from csv
qb <- read.csv("QB Stats.csv")
def <- read.csv("Defense Stats.csv")

# verifying data
str(qb)
str(def)

# mutating new columns to merge by
qb <- mutate(qb, Game = paste(Opponent, Season, sep=""))
def <- mutate(def, Game = paste(Name, Season, sep=""))

# join qb(x) and def(y) where x.season=y.season and x.opponent=y.name
fulldata <- merge(qb,def, by="Game")

# verifying data
str(fulldata)

# saving fulldata locally
write.table(fulldata, "C:/Users/afoote/Documents/Data Science/mydata/fulldata.csv", sep=",")

# subsetting data into testing and training by years (2014/2015 for training, 2016 for testing)
train <- subset(fulldata, Season.x<2016, select=Game:Comp...y)
test <- subset(fulldata, Season.x==2016, select=Game:Comp...y)

# verifying data
str(train)
str(test)

# saving data locally
write.table(train, "C:/Users/afoote/Documents/Data Science/mydata/traindata.csv", sep=",")
write.table(test, "C:/Users/afoote/Documents/Data Science/mydata/testdata.csv", sep=",")

# methods of generating projections


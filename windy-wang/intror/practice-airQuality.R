getwd()
setwd("Desktop/practice-2015-10/windy-wang/intror")

airQuality <- read.csv("../../data/airQuality.csv", header=TRUE) #Read .csv files

head(airQuality)      #Read the first 6 rows
head(airQuality, n=8) #Specify the number of rows to look at starting from the beginning
tail(airQuality)      #Read the last 6 rows

nrow(airQuality)      #Number of rows
ncol(airQuality)      #Number of columns

str(airQuality)       #Class of each variable

summary(airQuality)   #Basic statistics

mean(airQuality$Ozone, na.rm=TRUE)  #The mean of a specific variable, specified by $. na.rm=TRUE tells R to ignore the missing variables when calculating means


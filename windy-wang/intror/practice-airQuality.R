# SET UP DIRECTORY #
# ======================================================================================
getwd()
setwd("Desktop/practice-2015-10/windy-wang/intror")

airQuality <- read.csv("../../data/airQuality.csv", header=TRUE) #Read .csv files

# READING DATA #
# =======================================================================================

head(airQuality)      #Read the first 6 rows
head(airQuality, n=8) #Specify the number of rows to look at starting from the beginning
tail(airQuality)      #Read the last 6 rows

nrow(airQuality)      #Number of rows
ncol(airQuality)      #Number of columns

str(airQuality)       #Class of each variable

summary(airQuality)   #Basic statistics

mean(airQuality$Ozone, na.rm=TRUE)  #The mean of a specific variable, specified by $. na.rm=TRUE tells R to ignore the missing variables when calculating means

# WRITING DATA #
# ========================================================================================

## Change name ##
names(airQuality)[2] <- "Solar"

## Add new column called Random ##
airQuality$Random <- rnorm(153,1,2)

rm(may) #Removes the variable may

# SUBSET DATA #
# ========================================================================================
rowThree <- airQuality[3, ] #Subset the third row
rowThree
str(rowThree) #Structure of rowThree...still a dataframe

colFour <- airQuality[ ,4]  #Subset the forth column
colFour
str(colFour)

ozone <- airQuality$Ozone   #Subset the whole ozone column
ozone
str(ozone)

highTemp <-airQuality[airQuality$Temp > 80, ] #Subset everything with temperature higher than 80
highTemp

highTempCol <- airQuality$Temp[airQuality$Temp >80] #Subset ???
highTempCol

may <- airQuality[airQuality$Month == "May", ] #Subset so the month is always May
head(may)
tail(may)

## SUBSET TWO VARIABLES ##
mayAmp <- airQuality[airQuality$Month == "May" & airQuality$Temp >80, ] #& means and
head(mayAmp)

mayPipe <- airQuality[airQuality$Month == "May" | airQuality$Temp >80, ] #| means or
mayPipe

# ANALYSIS #
# =======================================================================================

## MEAN ###
airQualNoMonth <- airQuality[ ,-5] #Removed the 5th column
head(airQualNoMonth)
colMeans(airQualNoMonth, na.rm=T) #Can use colMeans now because no Factor class

## STANDARD DEVIATION ##
l <- lapply(airQuality, sd, na.rm=T) #Loop without actually looping; vectorization; return list
str(l)

s <- sapply(airQuality, sd, na.rm=T) #Return the simplist value, use this one more often
str(s)

t <- tapply(airQuality$Ozone, airQuality$Month, range, na.rm=T) #Apply range on Ozone by Month
str(t)

# MAKE FUNCTIONS #
# =========================================================================================
columnmean <- function(y, remove.NA=TRUE) {
  nc <- ncol(y)                                 #Functions have local environment, and variables in here won't be carried outside
  means <- vector("numeric", length=0)          #means is empty numeric vector
  for(i in 1:nc) {                              #for everything in 1 to the total number of columns
    means[i] <- mean(y[,i], na.rm=remove.NA)    
  } 
  means
}
columnmean(airQuality)
y <- 1:12
columnmean(y, remove.NA = TRUE)

# PACKAGES #
# =========================================================================================
install.packages("ggplot2")

library(ggplot2) # Load datasets package into library

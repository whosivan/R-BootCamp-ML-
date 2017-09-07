?read.csv()

#Method 1: Select the File manually
stats <- read.csv(file.choose())
stats

#Method 2: Select WD and read Data
getwd()
setwd("/Users/IvanC/R/Sec5L40/")
rm(stats)
stats <- read.csv("DemographicData.csv")

stats



#------------------------Using the $ sign
stats
nrow(stats)
#Imported 195 rows
ncol(stats)
head(stats, n = 10)
tail(stats, n = 4)
summary(stats)

#------------------------ Basic Operations with a DF
stats[1:10,]
stats[3:9,]
stats[c(4,100),]
#Remember how the [] work:
is.data.frame(stats[1,]) #no need for drop=F
is.data.frame(stats[, 1])
is.data.frame(stats[, 1, drop = F])
#multiply columns
head(stats)
stats$Birth.rate * stats$Internet.users
#add column
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
head(stats)
#remove a column
head(stats)
stats$MyCalc <- NULL
head(stats)

#--------------------------Filtering Data
head(stats)
filter <- stats$Internet.users < 2
stats[filter,]

stats[stats$Birth.rate > 40,]
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats$Income.Group == "High income",]
stats[stats$Country.Name == "Malta",]


#----------------- Intordution to qplot
install.packages("ggplot2")
library(ggplot2)
?qplot
qplot(data = stats, x = Internet.users)
qplot(data = stats, x = Income.Group, y = Birth.rate)
qplot(data = stats, x = Income.Group, y = Birth.rate, size = I(10))
qplot(data = stats, x = Income.Group, y = Birth.rate, size = I(3), 
      color = I("blue"))
qplot(data = stats, x = Income.Group, y = Birth.rate, geom = "boxplot")


#-------------------------- Visualizing what we need
qplot(data = stats, x = Internet.users, y = Birth.rate)
qplot(data = stats, x = Internet.users, y = Birth.rate,
      size = I(4), color = I("red"))
qplot(data = stats, x = Internet.users, y = Birth.rate,
      size = I(2), color = Income.Group)


#--------------------------Creating Dataframe
mydf <- data.frame(Countries_2012_Dataset,
                   Codes_2012_Dataset,
                   Regions_2012_Dataset)
head(mydf)
colnames(mydf) <- c("Country", "Code", "Region")
mydf
rm(mydf)

mydf <- data.frame(Country = Countries_2012_Dataset,
                   Codes = Codes_2012_Dataset,
                   Regions = Regions_2012_Dataset)
head(mydf)
summary(mydf)
str(mydf)
tail(mydf)

#------------------------- Merging Data Frames
head(stats)
head(mydf)

merged <- merge(stats, mydf, by.x = "Country.Code", by.y = "Codes")
merged$Country <- NULL
head(merged)


#------------------------- Visualizing Data Frame  with new split
qplot(data = merged, x = Internet.users, y = Birth.rate)
qplot(data = merged, x = Internet.users, y = Birth.rate, color = Regions)
#1. Shapes
qplot(data = merged, x = Internet.users, y = Birth.rate, 
      color = Regions, size = I(2), shape = I(17))

#2. Transparency
qplot(data = merged, x = Internet.users, y = Birth.rate, 
      color = Regions, size = I(2), shape = I(20),
      alpha = I(0.6))

#3. Add Title
qplot(data = merged, x = Internet.users, y = Birth.rate, 
      color = Regions, size = I(2), shape = I(20),
      alpha = I(0.6),
      main = "Birth Rate vs Internet Users")










install.packages("ISLR")
library(ISLR)

str(Caravan)
summary(Caravan$Purchase)
#check na value
any(is.na(Caravan))
#check variance of first col
var(Caravan[,1])
#check variance of the second col
var(Caravan[,2])
#large variance between cols seem to be existing.

purchase <- Caravan[, 86]
#
standardized.Caravan <- scale(Caravan[, -86])
var(standardized.Caravan[, 1])
var(standardized.Caravan[, 2])

#Train Test Split
test.data <- standardized.Caravan[1:1000,]
test.purchase <- purchase[1:1000]
train.data <- standardized.Caravan[-c(1:1000),]
train.purchase <- purchase[-c(1:1000)]

########################
########################
########################
#KNN model
library(class)
set.seed(101)

predicted.purchase <- knn(train.data, test.data, train.purchase, k = 3)
head(predicted.purchase)


misclass.error <- mean(test.purchase != predicted.purchase)
misclass.error

#choosing a k value
predicted.purchase <- NULL
error.rate <- NULL

for(i in 1:20){
  set.seed(101)
  predicted.purchase <- knn(train.data, test.data, train.purchase, k = i)
  error.rate[i] <- mean(test.purchase != predicted.purchase)
}

error.rate
#viusualize k
library(ggplot2)
k.values <- 1:20
error.df <- data.frame(error.rate, k.values)

ggplot(error.df, aes(k.values, error.rate)) +
  geom_point() +
  geom_line(lty = 'dotted', color = 'red')

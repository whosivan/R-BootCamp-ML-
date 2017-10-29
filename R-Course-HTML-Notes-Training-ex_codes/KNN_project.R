#####KNN project#####
library(ISLR)
summary(iris) #checkd data
str(iris) #check data

####
stand.features <- scale(iris[1:4])
final.data <- cbind(stand.features, iris[5])
head(final.data)

#####
library(caTools)
set.seed(101)
sample <- sample.split(final.data$Species, SplitRatio = 0.7)
train <- subset(final.data, sample == TRUE)
test <- subset(final.data, sample == FALSE)

####
library(class)
predicted.species <- knn(train[1:4], test[1:4], train$Species, k = 1)
predicted.species

misclass <- mean(test$Species != predicted.species)
misclass


#choose a k value
predicted.species <- NULL
error.rate <- NULL

for(i in 1:20){
  set.seed(101)
  predicted.species <- knn(train[1:4], test[1:4], train$Species, k = i)
  error.rate[i] <- mean(test$Species != predicted.species)
}

error.rate

library(ggplot2)
k.value <- 1:20
error.df <- data.frame(error.rate, k.value)
error.df
ggplot(error.df, aes(x = k.value, y = error.rate)) + 
  geom_point() + geom_line(lty = 'dotted', color = 'red') + theme_bw()

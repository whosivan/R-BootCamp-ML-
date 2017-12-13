library(ISLR)
df <- College #assign df as the College dataframe
head(df, 5)
str(df)

#data exploration
library(ggplot2)
#create quick scatter plot to see data 
ggplot(data = df, aes(y = Grad.Rate, x = Room.Board)) + geom_point(aes(color = Private))
#also quick vis using histogram
ggplot(data = df, aes(x = F.Undergrad)) + 
  geom_histogram(aes(fill = Private), color = 'black', bins = 50)
#try another histogram
ggplot(data = df, aes(x = Grad.Rate)) + 
  geom_histogram(aes(fill = Private), color = 'black', bins = 50) + 
  theme_bw()
#graph indicate a college has over 100% graduation rate? 

subset(df, Grad.Rate > 100)
#replace the outlier with 99th percentile
df['Cazenovia College', 'Grad.Rate'] <- 100
subset(df, Grad.Rate > 100) #recheck

#fitting DT
library(caTools)
set.seed(101)

sample <- sample.split(df$Private, SplitRatio = 0.7)
train <- subset(df, sample == T)
test <- subset(df, sample == F)

##Train model
library(rpart)
tree <- rpart(Private ~ ., method = 'class', data = train)
summary(tree)
#tree vis
library(rpart.plot)
prp(tree)
#check prediction
tree.preds <- predict(tree, test)
head(tree.preds)


###
tree.preds <- as.data.frame(tree.preds)
#
joiner <- function(x){
  if(x >= 0.5){
    return('Yes')
  }else{
    return('No')
  }
}

tree.preds$Private <- sapply(tree.preds$Yes, joiner)
head(tree.preds, 5)
#ROC
table(tree.preds$Private, test$Private)



#RF model
library(randomForest)
rf.model = randomForest(Private ~ ., data = train, importance = T)
rf.model$confusion
rf.model$importance
#prediction using rf model
rf.preds <- predict(rf.model, test)
table(rf.preds, test$Private)

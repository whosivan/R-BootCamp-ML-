#Decision Trees(DT) and RandomForest(RF)
#install rpart package
install.packages('rpart')
library(rpart)

help(rpart)#help page on decision trees
#----------------
#load the df
str(kyphosis)
head(kyphosis)

#fit the model
tree <- rpart(Kyphosis ~ ., method = 'class', data = kyphosis)
#there are multiple model for examining tree model
#plotcp() allows one to plot cross-validation results
#plot() allows one to plot decision tree
#text() allows one to label the decision tree plot
#more on help(rpart)
printcp(tree)
plot(tree, uniform = T, main = 'kyphosis tree') + text(tree, use.n = T, all = T)

install.packages('rpart.plot')
library(rpart.plot)
prp(tree)

#---------RandomForest
install.packages('randomForest')
library(randomForest)
rf.model <- randomForest(Kyphosis ~ ., data = kyphosis)
print(rf.model)
#grab a value from model
rf.model$predicted
rf.model$ntree
rf.model$confusion

library(ISLR)
head(iris)

install.packages('e1071')
library(e1071)
help('svm')

#create dummy svm model, takes the whole data set so the model is perfect but useless
model <- svm(Species ~., data = iris)
summary(model)
pred.values <- predict(model, iris[1:4])

#tune model
tune.results <- tune(svm, train.x = iris[1:4], train.y = iris[,5], kernel = 'radial', 
                     ranges = list(cost=c(0.5, 1, 1.5), gamma = c(0.1, 0.5, 0.7)))
summary(tune.results)
#best: cost = 1.5
#best: gamma = 0.1
tuned.svm <- svm(Species ~., data = iris, kernel = 'radial', cost = 1.5, gamma = 0.1)
summary(tuned.svm)

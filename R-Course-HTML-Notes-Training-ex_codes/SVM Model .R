#SVM project codes
getwd()
loans <- read.csv('loan_data.csv')
summary(loans)
str(loans)

#clean data
loans$credit.policy <- factor(loans$credit.policy)
loans$inq.last.6mths <- factor(loans$inq.last.6mths)
loans$delinq.2yrs <- factor(loans$delinq.2yrs)
loans$pub.rec <- factor(loans$pub.rec)
loans$not.fully.paid <- factor(loans$not.fully.paid)

#visualization
library('ggplot2')
ggplot(data = loans, aes(x = fico)) + 
  geom_histogram(aes(fill = not.fully.paid), color = 'black', bins = 40, alpha = 0.5) +
  theme_bw() + scale_fill_manual(values = c('green', 'red'))
 
ggplot(data = loans, aes(x = factor(purpose))) + 
  geom_bar(aes(fill = not.fully.paid), position = 'dodge') + 
  theme_bw()

ggplot(data = loans, aes(x = int.rate, y = fico)) +
  geom_point(aes(color = not.fully.paid), alpha = 0.5) + 
  theme_bw()


#building svm
library(caTools)
set.seed(101)
sample <- sample.split(df$not.fully.paid, SplitRatio = 0.7)
train <- subset(loans, sample == T)
test <- subset(loans, sample == F)

library(e1071)
model <- svm(not.fully.paid ~ ., data = train)
summary(model)
predicted.values <- predict(model, test[1:13])
table(predicted.values, test$not.fully.paid)

#tune svm model
tune.results <- tune(model, train.x = not.fully.paid ~., data = train, kernel = 'radial', 
                     ranges = list(cost = c(100, 200), gamma = c(0.1)))
summary(tune.results)

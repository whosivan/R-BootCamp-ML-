#logistic regression codes
df.train <- read.csv('titanic_train.csv')
head(df.train)
str(df.train)

install.packages('Amelia')
library('Amelia')

missmap(df.train, main = 'Missing Map', col = c('yellow', 'black'), legend = FALSE)

library('ggplot2')
ggplot(df.train, aes(Sex)) +
  geom_bar(aes(fill = factor(Sex)))

ggplot(df.train, aes(Age)) +
  geom_histogram(bins = 20, alpha = 0.5, fill = 'blue')

ggplot(df.train, aes(SibSp)) + geom_bar()
ggplot(df.train, aes(Fare)) + geom_histogram(bins = 50, fill = 'green', color = 'black', alpha = 0.5)

pl <- ggplot(df.train, aes(Pclass, Age)) 
pl <- pl + geom_boxplot(aes(group = Pclass, fill = factor(Pclass), alpha = 0.4)) 
pl + scale_y_continuous(breaks = seq(min(0), max(80), by = 2)) + theme_bw()
pl

#imputataion of age based on class
impute_age <- function(age, class){
  out <- age
  for (i in 1:length(age)){
    if(is.na(age[i])){
      if(class[i] == 1){
        out[i] <- 37
      }else if(class[i] == 2){
        out[i] <- 29
      }else{
        out[i] <- 24
      }
    }else{
      out[i] <- age[i]
    }
  }
  return(out)
}

fixed.ages <- impute_age(df.train$Age, df.train$Pclass)
df.train$Age <- fixed.ages
missmap(df.train, main = 'Imputation Check', col = c('yellow', 'black'), legend = F)

str(df.train)
library(dplyr)
df.train <- select(df.train, -PassengerId, -Name, - Ticket, -Cabin)
head(df.train)

df.train$Survived <- factor(df.train$Survived)
df.train$Pclass <- factor(df.train$Pclass)
df.train$Parch <- factor(df.train$Parch)
df.train$SibSp <- factor(df.train$SibSp)

str(df.train)

log.model <- glm(Survived ~ -Parch, family = binomial(link = 'logit'), data = df.train)
summary(log.model)

#import test data set
df.test <- read.csv('titanic_test.csv')
head(df.test)

#check for missing values
missmap(df.test, main = 'check test data', col = c('yellow', 'black'), legend = F)
fixed.age.test <- impute_age(df.test$Age, df.test$Pclass)
df.test$Age <- fixed.age.test
missmap(df.test, main = 'check test data after imputation', col = c('yellow', 'black'), legend = F)
str(df.test)
df.test <- select(df.test, -PassengerId, -Name, - Ticket, -Cabin)

df.test$Pclass <- factor(df.test$Pclass)
df.test$Parch <- factor(df.test$Parch)
df.test$SibSp <- factor(df.test$SibSp)

fitted.probabilities <- predict(log.model, df.test, type = 'response')
fitted.results <- ifelse(fitted.probabilities > 0.5, 1, 0)

#confusion matrix

setwd("~/R/R-BootCamp-ML-/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/
      Training Exercises/Machine Learning Projects/CSV files for ML Projects")
getwd()
adult = read.csv('adult_sal.csv')
head(adult, 5)

library('dplyr')
adult <- select(adult, -X)
head(adult, 5)
summary(adult)
str(adult)

#data cleaning
##feature engineering, group factors to reduce dimension
table(adult$type_employer)
unemp <- function(job){
  job <- as.character(job)
  if(job == "Never-worked" | job == "Without-pay"){
    return('Unemployed')
  }else{
  return(job)
  }
}

#group self employ
group_emp <- function(job){
  job <- as.character(job)
  if(job == "Local-gov" | job == "State-gov"){
    return('SL-gov')
  }else{
    return(job)
  }
}

#group self employ
group_self <- function(job){
  job <- as.character(job)
  if(job == "Self-emp-inc" | job == "Self-emp-not-inc"){
    return("self-emp")
  }else{
    return(job)
  }
}

adult$type_employer <- sapply(adult$type_employer, group_emp)
adult$type_employer <- sapply(adult$type_employer, group_self)
adult$type_employer <- sapply(adult$type_employer, unemp)
table(adult$type_employer)


#now take a look at the martial col
table(adult$marital)

#group marriage
group_married <- function(marriage){
  marriage <- as.character(marriage)
  if(marriage == "Married-AF-spouse" | marriage == "Married-civ-spouse" | marriage == "Married-spouse-absent"){
    return("Married")
  }else{
    return(marriage)
  }
}

#group not-married
group_not_married <- function(marriage){
  marriage <- as.character(marriage)
  if(marriage == "Divorced" | marriage == "Separated" | marriage == "Widowed"){
    return("Not-Married")
  }else{
    return(marriage)
  }
}

adult$marital <- sapply(adult$marital, group_married)
adult$marital <- sapply(adult$marital, group_not_married)
table(adult$marital)


table(adult$country)
Asia <- c('China', 'Hong', 'India', 'Iran', 'Cambodia', 'Japan', 'Laos', 'Philippines', 'Vietnam', 'Taiwan', 'Thailand')
North.America <- c('Canada', 'United-States', 'Puerto-Rico')
Europe <- c('England', 'France', 'Germany', 'Greece', 'Holand-Netherlands', 'Hungary', 
            'Ireland', 'Italy', 'Poland', 'Portugal', 'Scotland', 'Yugoslavia')
Latin.and.South.America <- c('Columbia', 'Cuba', 'Dominican-Republic', 'Ecuador', 'El-Salvador', 'Guatemala', 'Haiti', 'Honduras',
                             'Mexico', 'Nicaragua', 'Outlying-US(Guam-USVI-etc)', 'Peru', 'Jamaica', 'Trinadad&Tobago')
Other <- c('South')

group_country <- function(country){
  if(country %in% Asia){
    return('Asia')
  }else if(country %in% North.America){
    return('North.America')
  }else if(country %in% Europe){
    return('Europe')
  }else if(country %in% Latin.and.South.America){
    return('Latin.and.South.America')
  }else{
    return('Other')
  }
}

adult$country <- sapply(adult$country, group_country)
table(adult$country)

str(adult)
adult$type_employer <- factor(adult$type_employer)
adult$marital <- factor(adult$marital)
adult$country <- factor(adult$country)

table(adult$occupation)

#Handle missing data
library(Amelia)
adult[adult == "?" | adult == " ?"] <- NA
adult$type_employer <- factor(adult$type_employer)
adult$marital <- factor(adult$marital)
adult$country <- factor(adult$country)

table(adult$type_employer)


missmap(adult, y.at = c(1), y.labels = c(''), col = c('yellow', 'black'))


#drop missing data
adult <- na.omit(adult)
adult
missmap(adult, y.at = c(1), y.labels = c(''), col = c('yellow', 'black'))



library(ggplot2)
library(dplyr)
ggplot(adult, aes(age)) + 
  geom_histogram(aes(fill = income), color = 'black', binwidth = 1) + 
  theme_bw()

ggplot(adult, aes(hr_per_week)) +
  geom_histogram() +
  theme_bw()

head(adult)
adult <- rename(adult, region = country)
head(adult)

ggplot(adult, aes(region)) +
  geom_bar(aes(fill = income), color = 'black') +
  theme_bw()


#fitting logit model
###################################
head(adult)
str(adult)

library(caTools)
set.seed(101)

#sample
sample <- sample.split(adult$income, SplitRatio = 0.7)
#train
train <- subset(adult, sample == T)
#test
test <- subset(adult, sample == F)

#model training
model <- glm(income ~ ., family = binomial(link = 'logit'), data = train)
summary(model)

new.step.model <- step(model)
summary(model)


test$predicted.income <- predict(model, newdata = test, type = 'response')
table(test$income, test$predicted.income > 0.5)
acc <- (6372 + 1423) / (6372 + 548 + 872 + 1423)
pre <- 6732 / (6732 + 872)

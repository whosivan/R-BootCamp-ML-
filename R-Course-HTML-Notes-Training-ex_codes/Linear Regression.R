getwd()
setwd('/Users/IvanC/R/R-BootCamp-ML-/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Machine Learning with R/')
df <- read.csv('student-mat.csv', sep = ';')
head(df)
summary(df)

#check if there is NULL value
any(is.na(df))

library(ggplot2, ggthemes, dplyr)
num.cols <- sapply(df, is.numeric)
#filter
cor.data <- cor(df[,num.cols])
cor.data

install.packages('corrgram')
library('corrgram')
install.packages('corrplot')
library('corrplot')

print(corrplot(cor.data, method = 'color'))
corrgram(df, order = TRUE, lower.panel = panel.shade,
         upper.panel = panel.pie, text.panel = panel.txt)

ggplot(df, aes(x = G3)) + 
  geom_histogram(bins = 20, alpha = 0.5, fill = 'blue')

#split data into train and test
install.packages('caTools')
library('caTools')

set.seed(101)
#split up sample
sample <- sample.split(df$G3, SplitRatio = 0.7)
train <- subset(df, sample == TRUE) #the 70% training data
test <- subset(df, sample == FALSE)

#Train and build model
model <- lm(G3 ~ ., data = train)
summary(model)

res <- residuals(model)
res <- as.data.frame(res)
ggplot(res, aes(res)) + geom_histogram(fill = 'blue', alpha = 0.5)

#prediction
G3.prediction <- predict(model, test)
results <- cbind(G3.prediction, test$G3)
colnames(results) <- c('predictied', 'actual')
results <- as.data.frame(results)
head(results)

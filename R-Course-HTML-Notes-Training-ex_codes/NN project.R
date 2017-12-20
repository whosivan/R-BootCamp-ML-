#read in data
df <- read.csv('bank_note_data.csv')
head(df, 5)
str(df)
#EDA
library(ggplot2)
ggplot(df, aes(x = Image.Var, y = Entropy)) + geom_point()

#nn
library(neuralnet)
library(caTools)
#?neuralnet
set.seed(101)
split <- sample.split(df$Class, SplitRatio = 0.7)
train <- subset(df, split == T)
test <- subset(df, split == F)

#model
#skip normalizing due to data nature
nn <- neuralnet(Class ~ Image.Var + Image.Skew + Image.Curt + Entropy, data = train, hidden = c(5, 3), linear.output = F)
predicted.nn.values <- compute(nn, test[1:4])
head(predicted.nn.values$net.result)
predictions <- sapply(predicted.nn.values$net.result, round)

table(predictions, test$Class)

#compute RF to compare
library(randomForest)
train$Class <- factor(train$Class)
#compute RF model
rf.model <- randomForest(Class ~ ., data = train)
rf.pred <- predict(rf.model, test)
table(rf.pred, test$Class)

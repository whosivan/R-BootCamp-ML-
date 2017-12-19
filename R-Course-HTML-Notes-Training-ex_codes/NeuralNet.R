#Neural networks
install.packages('MASS')
library(MASS)
head(Boston)
str(Boston)

#check missing data
any(is.na(Boston))
#reassign value 
data <- Boston

#pre-process data
#normalize data
maxs <- apply(data, 2, max)
mins <- apply(data, 2, min)
scaled.data <- scale(data, center = mins, scale = maxs-mins)
scaled <- as.data.frame(scaled.data)

library(caTools)
sample <- sample.split(scaled$medv, SplitRatio = 0.7)
train <- subset(scaled, sample == T)
test <- subset(scaled, sample == F)

#get neural network package
install.packages('neuralnet')
library(neuralnet)
n <- names(train)
f <- as.formula(paste("medv ~", paste(n[!n %in% "medv"], collapse = " + ")))

nn <- neuralnet(f, data = train, hidden = c(5, 3), linear.output = T)
plot(nn)

predicted.nn.values <- compute(nn, test[1:13])
predicted.nn.values
#convert back to true prediction
true.predictions <- predicted.nn.values$net.result * (max(data$medv) - min(data$medv)) + min(data$medv)
#convert test data
test.r <- (test$medv) * (max(data$medv) - min(data$medv)) + min(data$medv)
MSE.nn <- sum((test.r - true.predictions)^2)/nrow(test)
MSE.nn

error.df <- data.frame(test.r, true.predictions)
error.df

library(ggplot2)
ggplot(error.df, aes(x = test.r, y = true.predictions)) +
  geom_point() + stat_smooth()

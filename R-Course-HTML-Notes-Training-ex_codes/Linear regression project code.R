getwd()
setwd("/Users/IvanC/R/R-BootCamp-ML-/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training Exercises/Machine Learning Projects/
      CSV files for ML Projects/")

bike <- read.csv("bikeshare.csv")
head(bike, n=5)

library("ggplot2")
ggplot(data = bike, aes(x = temp, y = count)) + 
  geom_point(aes(color = temp), alpha = 0.3)

#convert to posixct()
?as.POSIXct
bike$datetime <- as.POSIXct(bike$datetime)
pl <- ggplot(data = bike, aes(x = datetime, y = count)) + geom_point(aes(color = temp), alpha = 0.5)

pl + scale_color_continuous(low = "#55D8CE", high = "#FF6E2E") + theme_bw()

cor(bike[, c('temp', 'count')])
cor(bike$temp, bike$count)

ggplot(data = bike, aes(factor(season), count)) +
  geom_boxplot(aes(color = factor(season))) + theme_bw()

#feature engineering
bike$hour <- sapply(bike$datetime, function(x){format(x, "%H")})
head(bike)

pl2 <- ggplot(filter(bike, workingday == 1), aes(hour, count))
pl2 + geom_point(position = position_jitter(w = 1, h = 0), aes(color = temp), alpha = 0.5) + 
  scale_color_gradientn(colours = c("dark blue", "blue", "light blue", "light green", "yellow", "orange", "red"))


#build model
temp.model <- lm(count ~ . -casual - registered - datetime - atemp, bike)
summary(temp.model)

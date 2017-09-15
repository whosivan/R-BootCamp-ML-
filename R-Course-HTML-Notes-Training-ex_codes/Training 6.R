library(ggplot2)
#install.packages("ggthemes")
library(ggthemes)
head(mpg)

#1.
pl1 <- ggplot(data = mpg, aes(x = hwy))
pl1 + geom_histogram(bins = 20, fill = "red")

#2.
pl2 <- ggplot(data = mpg, aes(x = manufacturer)) 
pl2 + geom_bar(aes(fill = factor(cyl)))

#3.
pl3 <- ggplot(data = txhousing, aes(x = sales, y = volume))
pl3 + geom_point(color = "blue", alpha = 0.3)

#4.
pl3 + geom_point(color = "blue", alpha = 0.3) + geom_smooth(color = "red")

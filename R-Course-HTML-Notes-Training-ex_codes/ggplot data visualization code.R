#ggplot2 data visualization project
setwd("/Users/IvanC/R/R-BootCamp-ML-/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training Exercises/Capstone and Data Viz Projects/Data Visualization Project/")
getwd()
data = read.csv("Economist_Assignment_Data.csv", colClasses=c("NULL", NA, NA, NA, NA, NA))
head(data)
summary(data)
str(data)

library(ggplot2)
pl <- ggplot(data, aes(x = CPI, y = HDI))
pl2 <- pl + 
  geom_point(aes(color = Region), 
             shape = I(1), 
             size = I(3)) +
  geom_smooth(aes(group = 1), 
              method = 'lm', 
              formula = y ~ log(x), 
              se = FALSE, 
              color = 'red', 
              size = I(0.5))

pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                     "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                     "India", "Italy", "China", "South Africa", "Spane",
                     "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                     "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                     "New Zealand", "Singapore")

pl3 <- pl2 + geom_text(aes(label = Country), color = "gray20", 
                       data = subset(data, Country %in% pointsToLabel),check_overlap = TRUE)

pl4 <- pl3 + theme_bw()
pl4 + scale_x_continuous(name = "Corruption Perception Index, 2011 (10=least corrupt)",
                         breaks = 1:10,
                         limits = c(1, 10)) +
  scale_y_continuous(name = "Human Development Index, 2011 (1 = best",
                     limits = c(0.2, 1)) + 
  ggtitle("Corruption and human development")

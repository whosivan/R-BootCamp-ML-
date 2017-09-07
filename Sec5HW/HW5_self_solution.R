getwd()
setwd("/Users/IvanC/R/Sec5HW/")

hwdf <- read.csv("Section5-Homework-Data.csv")
head(hwdf)
str(hwdf)
summary(hwdf)

hwdf2 <- data.frame(Life_Expectancy_At_Birth_1960, Life_Expectancy_At_Birth_2013, Country_Code)
head(hwdf2)

df_merge <- merge(hwdf, hwdf2, by.x = "Country.Code", by.y = "Country_Code")
head(df_merge)

df_1960 <- df_merge[df_merge$Year == 1960, ]
df_2013 <- df_merge[df_merge$Year == 2013, ]

head(df_1960)
head(df_2013)
library("ggplot2")
#1960 life expectancy vs fertility rate plot
qplot(data = df_merge, x = Fertility.Rate, y = Life_Expectancy_At_Birth_1960,
      color = Region, size = I(3), shape = I(20), alpha = I(0.5),
      main = "1960_Fertility_rate vs Life_Expectancy")
#2013 life expectancy vs fertility rate plot
qplot(data = df_merge, x = Fertility.Rate, y = Life_Expectancy_At_Birth_2013,
      color = Region, size = I(3), shape = I(20), alpha = I(0.5),
      main = "2013_Fertility_rate vs Life_Expectancy")

#set directory
setwd("/Users/IvanC/R/R-BootCamp-ML-/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training Exercises/Capstone and Data Viz Projects/Capstone Project")
getwd()

#import packages
library(ggplot2)
library(tidyr)
library(dplyr)

#import dataframes and data exploration
batting <- read.csv('Batting.csv')
head(batting)
str(batting)
head(batting$AB)
head(batting$X2B)

#create calculated features
batting$BA <- batting$H / batting$AB
batting$OBP <- (batting$H + batting$BB + batting$HBP) / (batting$AB + batting$BB + batting$HBP + batting$SF)
batting$X1B <- batting$H - batting$X2B - batting$X3B - batting$HR
batting$SLG <- ((batting$X1B) + (2 * batting$X2B) + (3 * batting$X3B) + (4 * batting$HR)) / batting$AB
str(batting)

#import another dataframes
sal <- read.csv('Salaries.csv')
summary(sal)

#because sal has values starting from 1985 only, where batting df has it traced back to 1971, subset batting
batting <- subset(batting, yearID >= 1985)
summary(batting)
combo <- merge(batting, sal, by = c('playerID', 'yearID'))
summary(combo)

#Analyzing df
lost_players <- subset(combo, playerID %in% c('giambja01', 'damonjo01', 'saenzol01'))
tail(lost_players)

lost_players <- subset(lost_players, yearID == 2001)
keep_names <- c('playerID', 'H', 'X2B', 'X3B', 'HR', 'OBP', 'SLG', 'BA', 'AB')
lost_players <- lost_players[, keep_names]
lost_players


#1469 AB
#AVG 0.364 OBP
#15 Million

ggplot(combo, aes(x = OBP, y = salary)) + geom_point()
combo <- subset(combo, salary < 8000000, OBP > 0)
combo <- subset(combo, AB >= 450)
options <- head(arrange(combo, desc(OBP)), n = 10)
options[, c('playerID', 'AB', 'salary')]

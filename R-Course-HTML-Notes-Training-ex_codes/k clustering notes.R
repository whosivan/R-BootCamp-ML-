#k clustering in R
library(ISLR)
head(iris, 5)

#exploartory data analysis
library(ggplot2)
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) + 
  geom_point(size = 4)

#modeling
set.seed(101)
irisCluster <- kmeans(iris[, 1:4], 3, nstart = 20)
irisCluster
table(irisCluster$cluster, iris$Species)

#vis it
library(cluster)
clusplot(iris, irisCluster$cluster, color = T, shade = T, labels = 0, lines = 0)

#k means clustering project
#read in files
df1 <- read.csv('winequality-red.csv', sep = ';')
df2 <- read.csv('winequality-white.csv', sep = ';')

df1$label <- 'red'
df2$label <- 'white'

head(df1, 10)
head(df2, 10)

wine <- rbind(df1, df2)
str(wine)

#EDA
library(ggplot2)
ggplot(data = wine, aes(x = residual.sugar)) +
  geom_histogram(aes(fill = label), color = 'black', bins = 50) +
  scale_fill_manual(values = c('#ae4554', '#faf7ea')) + 
  theme_bw()

ggplot(data = wine, aes(x = citric.acid)) +  
  geom_histogram(aes(fill = label), color = 'black', bins = 50) +
  scale_fill_manual(values = c('#ae4554', '#faf7ea')) + 
  theme_bw()

ggplot(data = wine, aes(x = alcohol)) +  
  geom_histogram(aes(fill = label), color = 'black', bins = 50) +
  scale_fill_manual(values = c('#ae4554', '#faf7ea')) + 
  theme_bw()

ggplot(data = wine, aes(x = citric.acid, y = residual.sugar)) + 
  geom_point(aes(color = label), alpha = 0.2) + 
  scale_color_manual(values = c('#ae4554', '#faf7ea')) + 
  theme_dark()

ggplot(data = wine, aes(x = volatile.acidity, y = residual.sugar)) + 
  geom_point(aes(color = label), alpha = 0.2) + 
  scale_color_manual(values = c('#ae4554', '#faf7ea')) + 
  theme_dark()

#fit model
clus.data <- wine[,1:12]
wine.cluster <- kmeans(clus.data, 2)
wine.cluster$centers

#evaluate the model
table(wine$label, wine.cluster$cluster)

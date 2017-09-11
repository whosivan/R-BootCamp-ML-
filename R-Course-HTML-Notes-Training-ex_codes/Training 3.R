#1
age = c(22, 25, 26)
weight = c(150, 165, 120)
sex = c('M', 'M', 'F')

ex1 <- data.frame(Age = age, Weight = weight, Sex = sex)
rownames(ex1) <- c('Sam', 'Frank', 'Amy')
ex1

#2
is.data.frame(mtcars)

#3
mat <- matrix(1:25,nrow = 5)
as.data.frame(mat)

#4
df <- mtcars

#5
head(df, n = 6)

#6
mean(df$mpg)

#7
subset(df, cyl == 6)

#8
df[c('am', 'gear', 'carb')]

#9
df$performance <- df$hp / df$wt
df

#10
df$performance <- round(df$performance, 2)
mean(subset(df, hp > 100 & wt > 2.5)$mpg)

#11
df['Hornet Sportabout', ]$mpg

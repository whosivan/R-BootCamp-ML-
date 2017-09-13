install.packages('tidyr')
install.packages('data.table')
install.packages('data.frame')

#tidyr
library(tidyr)
library(data.table)

comp <- c(1, 1, 1, 2, 2, 2, 3, 3, 3)
yr <- c(1998, 1999, 2000, 1998, 1999, 2000, 1998, 1999, 2000)
q1 <- runif(9, min = 0, max = 100)
q2 <- runif(9, min = 0, max = 100)
q3 <- runif(9, min = 0, max = 100)
q4 <- runif(9, min = 0, max = 100)

df <- data.frame(comp = comp, Qtr1 = q1, Qtr2 = q2, Qtr3 = q3, Qtr4 = q4)
#gather()
gather(df, Quarter, Revenue, Qtr1:Qtr4)
df %>% gather(Quarter, Revenue, Qtr1:Qtr4)

stocks <- data.frame(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)
head(stocks)
#spread()
stocks.gathered <- stocks %>% gather(stock, price, X:Z)
stocks.gathered
stocks.gathered %>% spread(stock, price)
spread(stocks.gathered, time, price )
#separate()
df <- data.frame(new.col = c(NA, 'a-x', 'b-y', 'c-z'))
df.sep <- separate(df, new.col, c('ABC', 'XYZ'), sep = '-')

#unite()
unite(df.sep, new.joined.col, ABC, XYZ, sep = "---")

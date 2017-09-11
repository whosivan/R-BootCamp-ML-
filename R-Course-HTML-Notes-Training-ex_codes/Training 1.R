#1
2^5

#2
stock.price <- c(23, 27, 23, 21, 34)
stock.price

#3
names(stock.price) <- c("Mon", "Tue", "Wed", "Thu", "Fri")
stock.price

#4
mean(stock.price)

#5
over.23 <- stock.price > 23
over.23

#6
stock.price[over.23]

#7
max(stock.price)

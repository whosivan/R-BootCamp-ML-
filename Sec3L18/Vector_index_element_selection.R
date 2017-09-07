x <- c(1,123, 534, 13, 4) #combine
y <- seq(201, 250, 11) #sequence
z <- rep("Hi!", 3) #replicate

w <- c("a", "b", "c", "d", "e")
w

w[1]
w[2]
w[3]
w[-1]
w[-3]
w[c(1, 3, 5)]
w[c(-2, -4)]
w[-3:-5]
w[1:2]
w[7]
w[-100]
w[-800]
w[1:9]
w[5:9]

#----
a <- c("a", "b", "c")
b <- c(1, 2, 3)
a
b
toString(b)
a + b
is.character(b)

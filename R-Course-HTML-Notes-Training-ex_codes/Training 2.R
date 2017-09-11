#1 
A <- c(1, 2, 3)
B <- c(4, 5, 6)
ex1 <- rbind(A, B)
ex1

#2
mat <- matrix(1:9, byrow = T, nrow = 3)
mat

#3
is.matrix(mat)

#4
mat2 <- matrix(1:25, byrow = T, nrow = 5)
mat2

#5
ex5 <- mat2[2:3, 2:3]
ex5

#6
ex6 <- mat2[4:5, 4:5]
ex6

#7
sum(mat2)

#8
ex8 <- matrix(runif(20, min = 0, max = 100), nrow = 5)
ex8

x <- 0

while(x < 10){
  print(paste0('X is: ', x))
  x <- x + 1
  if(x == 10){
    print('X is now equal to 10! Break Loop!')
  }
}

#forloop with vector
v <- c(1, 2, 3)
for(variable in v){
  print(variable)
}

#forloop with list
my.list <- list(c(1, 2, 3), mtcars, 12)
for(item in my.list){
  print(item)
}

#forloop with matrix
mat <- matrix(1:25, nrow = 5)
for(num in mat){
  print(num)
}

#nested forloop
for(row in 1:nrow(mat)){
  for(col in 1:ncol(mat)){
    print(paste('The element at row:', row, 'and col:', col, 'is', mat[row, col]))
  }
}


#function
hello <- function(name = 'Frank'){
 print(paste("Hello", name)) 
}
hello('Sammy')

#-------

add_num <- function(num1, num2){
  return(num1 + num2)
}
result <- add_num(4, 5)
result

#--------
times5 <- function(num){
  return(num*5)
}
print(times5(20))

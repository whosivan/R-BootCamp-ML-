#1.
x1 <- 44444
if(x1%%2 == 0){
  print('Even Number')
}else{
  print('Not Even')
}

#2.
x2 <- matrix(1:15, nrow = 3, ncol = 5, byrow = T)
if(is.matrix(x2) == TRUE){
  print('Is a Matrix')
}else{
  print('Not a Matrix')
}

#3.
x3 <- c(3, 7 ,1)
if(x3[1] > x3[2]){
  fir <- x3[1]
  sec <- x3[2]
}else{
  fir <- x3[2]
  sec <- x3[1]
}

if(x3[3] > fir & x3[3] > sec){
  thi <- sec
  sec <- fir
  fir <- x[3]
}else if(x3[3] < fir & x3[3] < sec){
  thi <- x3[3]
}else{
  thi <- sec
  sec <- x3[3]
}
x3.result <- c(fir, sec, thi)
x3.result

#4.
x4 <- c(20, 40, 100)
if(x4[1] > x4[2] & x4[1] > x4[3]){
  print(x4[1])
}else if(x4[2] > x4[1] & x4[2] > x4[3]){
  print(x4[2])
}else{
  print(x4[3])
}

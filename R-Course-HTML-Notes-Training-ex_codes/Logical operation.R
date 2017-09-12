#---------LOGICAL OPERATORS
x <- 10
x < 20
x > 5
(x < 20) & (x > 5) #multiple logical operation, using & requires all statements to be TRUE

x == 100
x == 10
(x == 10) | (x == 100) #OR statement, need at least one statement to be TRUE

!(10 == 1)#NOT statement

df <- mtcars
head(mtcars)
df[df$mpg > 20, 'mpg']

subset(df, mpg > 20)

df[(df$mpg > 20) & (df$hp > 100), ]
df[(df$mpg > 20) | (df$hp > 100), ]

#-------------If, else, and elif
x <- 13
if(x == 10){
  print('x is equal to 10!')
}else if(x == 12){
  print('x equal to 12')
}else{
  print('x was not equal to 10 or 12')
}

ham <- 10
cheese <- 10
report <- 'blank'

if(ham >= 10 & cheese >= 10){
 report <- 'Strong sales of both ham and cheese' 
}else if(ham == 0 & cheese ==0){
  report <- 'No sales today!'
}else{
  report <- 'we sold something today!'
}

report

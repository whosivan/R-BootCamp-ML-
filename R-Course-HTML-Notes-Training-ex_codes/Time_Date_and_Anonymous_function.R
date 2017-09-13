sample(x = 1:100, 5)

#apply
v <- c(1, 2, 3, 4, 5)
addrand <- function(x){
  ran <- sample(1:100, 1)
  return(x + ran)
}

print(addrand(10))

lapply(v, addrand)
?lapply

#Anonymous Function
v <- 1:5
sapply(v, function(num){num*2})




#REGULAR EXPRESSION
?grepl
#grep

text <- "Hi there, do you know who you are voting for?"
text
grepl('voting', text)
grepl('dog', text)

v <- c('a', 'b', 'c', 'd', 'd')
grepl('b', v)
grep('b', v)

#-----------------
class(Sys.Date())
#strptime
#1.
prod <- function(num1, num2){
  return(num1 * num2)
}
prod(3, 4)

#2.
num_check <- function(num1, num_vector){
  for(num in num_vector){
    if(num == num1){
      return(TRUE)
    }
  }
  return(FALSE)
}  
num_check(2, c(1, 4, 3))

#3.
num_count <- function(num1, num_vector){
  count <- 0
  for(number in num_vector){
    if(number == num1){
      count <- count + 1
    }
  }
  return(count)
}
num_count(1,c(1,1,2,2,3,1,4,5,5,2,2,1,3))

#4.
bar_count <- function(pack){
  amount.of.ones <- pack %% 5
  amount.of.fives <- (pack - amount.of.ones)/5
  return(amount.of.ones + amount.of.fives)
}
print(bar_count(14))

#5.
summer <- function(a, b, c){
  out <- c(0)
  if(a %% 3 != 0){
    out <- append(a, out)
  }
  if(b %% 3 != 0){
    out <- append(b, out)
  }
  if(c %% 3 != 0){
    out <- append(c, out)
  }
  
  return(sum(out))
}
print(summer(1, 2, 3))

#6.
prime_check <- function(num){
  if(num == 2){
    return(TRUE)
  }
  for(x in 2:(num - 1)){
    if(num %% x == 0){
      return(FALSE)
    }
  }
  return(TRUE)
}

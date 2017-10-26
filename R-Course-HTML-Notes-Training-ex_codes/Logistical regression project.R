getwd()
adult = read.csv('adult_sal.csv')
head(adult, 5)

library('dplyr')
adult <- select(adult, -X)
head(adult, 5)
summary(adult)
str(adult)

#data cleaning
##feature engineering, group factors to reduce dimension
table(adult$type_employer)
unemp <- function(job){
  job <- as.character(job)
  if(job == "Never-worked" | job == "Without-pay"){
    return('Unemployed')
  }else{
  return(job)
  }
}

adult$type_employer <- sapply(adult$type_employer, unemp)
table(adult$type_employer)

#group self employ
group_emp <- function(job){
  job <- as.character(job)
  if(job == "Local-gov" | job == "State-gov"){
    return('SL-gov')
  }else{
    return(job)
  }
}
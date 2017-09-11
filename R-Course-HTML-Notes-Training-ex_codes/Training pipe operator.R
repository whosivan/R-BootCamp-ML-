x <- c(1, 2, 3, 4, 5, 6, 7)
sqrt(x)
sum(sqrt(x))

x %>% sqrt() %>% sum()

summary(iris)
tail(iris)
summary(tail(iris))
iris %>% tail() %>% summary() 

summary(tail(subset(iris, iris$Species == "setosa"), 5))

iris %>% 
  subset(iris$Species == "setosa") %>%
  tail(n = 5) %>%
  summary()

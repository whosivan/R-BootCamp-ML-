setwd("/Users/IvanC/R/Sec6L54/")
getwd()

movies <- read.csv("Movie-Ratings.csv")
head(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
head(movies)
str(movies)
summary(movies)

movies$Year <- factor(movies$Year)
str(movies)


#---------------------Aesthetics
library(ggplot2)

ggplot(data = movies, aes(x = CriticRating, y = AudienceRating))
#add geometry
ggplot(data = movies, aes(x = CriticRating, y = AudienceRating)) + 
  geom_point()

#add color
ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, color = Genre)) + 
  geom_point() 

#add size - better
ggplot(data = movies, aes(x = CriticRating, y = AudienceRating,
                          color = Genre, size = BudgetMillions)) + 
  geom_point()

#>>>This #1 (we will improve it)

#-----------------------Plotting with Layers
p <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating,
                               color = Genre, size = BudgetMillions)) 
#point
p + geom_point()

#lines
p + geom_line()

#multiple layers
p + geom_line() + geom_point()


#-------------- Overriding Aesthetics
q <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, 
                               color = Genre, size = BudgetMillions))
#add geom layer
q + geom_point()

#overriding aes
#ex1
q + geom_point(aes(size = CriticRating))

#ex2
q + geom_point(aes(x = BudgetMillions)) + xlab("Budget Million $$$")

#ex3 reduce line size
q + geom_line(size = 1) + geom_point()
q

#------------------- Mapping vs Setting
r <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating))
r + geom_point()

#Add color
#1. Mapping (What we've done so far):
r + geom_point(aes(color = Genre))
#2. Setting
r + geom_point(color = "DarkGreen")
#ERROR
#r + geom_point(aes(color = "Darkgreen"))


#1. Mapping
r + geom_point(aes(size = BudgetMillions))
#2. Setting
r + geom_point(size = 10)


#-------------------- Histograms and Density Charts

s <- ggplot(data = movies, aes(x = BudgetMillions))
s + geom_histogram(binwidth = 10)

#add olor
s + geom_histogram(binwidth = 10, aes(fill = Genre))

#add a border
s + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black")

#>>>3(we will improve it)

#sometimes yo may need density charts:
s + geom_density(aes(fill = Genre), position = "stack")


#-------------------- Starting layer tips

t <- ggplot(data = movies, aes(x = AudienceRating))
t + geom_histogram(binwidth = 10,
                   fill = "White", color = "Blue")

# ----------- Statistical Transformation
?geom_smooth

#u <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, color = Genre))
#u + geom_point() + geom_smooth(fill = NA)

#boxplot
u <- ggplot(data = movies, aes(x = Genre, y = AudienceRating, color = Genre))
u + geom_boxplot()
u + geom_boxplot(size = 1) + geom_point()

#tip / hack:
u + geom_boxplot(size = 0.5, alpha = 0.5) + geom_jitter()

#challenge
i <- ggplot(data = movies, aes(x = Genre, y = CriticRating, color = Genre))
i + geom_boxplot(size = 1, alpha = 0.5) + geom_jitter()


#---------------- Using Facets
v <- ggplot(data = movies, aes(x = BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill = Genre),
                   color = "Black")

#facets
v + geom_histogram(binwidth = 10, aes(fill = Genre),
                   color = "Black") + 
  facet_grid(Genre~., scales = "free")


#scatterplots:
w <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, color = Genre))
w +  geom_point(size =3)

#facets
w + geom_point(size = 3) + facet_grid(Genre~.)
w + geom_point(size = 3) + facet_grid(.~Year)
w + geom_point(size = 1) + facet_grid(Genre~Year)
w + geom_point(aes(size = BudgetMillions)) + facet_grid(Genre~Year) + geom_smooth() + coord_cartesian(ylim = c(0, 100))


#------------------- Coordinates
m <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating,
                               size = BudgetMillions,
                               color = Genre))
m + geom_point()
m + geom_point() +
  xlim(50, 100) + 
  ylim(50, 100)


#instead - zoom:
n <- ggplot(data = movies, aes(x = BudgetMillions))
n + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black") + coord_cartesian(ylim = c(0, 50))

# ----------------------- Theme
o <- ggplot(data = movies, aes(x = BudgetMillions))
h <- o + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black")
h

#axes labels
h + xlab("Money Axis") + ylab("Number of Movies")

#label formatting
h + xlab("Money Axis") + ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(color = "DarkGreen", size = 30),
        axis.title.y = element_text(color = "Red", size = 30),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20),
        
        legend.title = element_text(size = 30),
        legend.text = element_text(size = 30),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(color = "DarkBlue",
                                  size = 40,
                                  family = "Courier"))



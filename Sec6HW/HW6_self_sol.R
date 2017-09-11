getwd()
setwd("/Users/IvanC/R/R-BootCamp-ML-/Sec6HW/")
hwdata <- read.csv("Section6-Homework-Data.csv")

head(hwdata)
colnames(hwdata) <- c("DayofWeek", "Director", "Genre", "Movie_Title", "Release_Date", "Studio", "AdjustedGross_inmill", "Budget_inmill", "Gross_inmill", "IMDb_Rating", "MovieLens_Rating", "Overseas_inmill", "Overseas_percent", "Profit_inmill", "Profit_percent", "Runtime_min", "US_inmill", "Gross_percentUS")
desire_genre <- c("action", "adventure", "animation", "comedy", "drama")
desire_studio <- c("Buena Vista Studios", "Fox", "Paramount Pictures", "Sony", "Universal", "WB")

df <- subset(hwdata, Genre %in% desire_genre)
dff <- subset(df, Studio %in% desire_studio)
head(dff)
#---------


w <- ggplot(data = dff, aes(x = Genre, y = Gross_percentUS))
w + geom_jitter(aes(color = Studio, size = Budget_inmill)) + geom_boxplot(alpha = 0.5, outlier.colour = NA) +
  xlab("Genre") + ylab("Gross % US") + ggtitle("Domestic Gross % by Genre") + 
  theme(axis.title.x = element_text(color = "Blue", size = 20),
        axis.title.y = element_text(color = "Blue", size = 20),
        plot.title = element_text(color = "Black", size = 20),
        text = element_text(family = "Times New Roman")
        )

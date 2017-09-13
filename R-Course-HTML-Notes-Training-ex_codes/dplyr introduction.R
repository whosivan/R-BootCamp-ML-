#install.packages('dplyr')
#install.packages('nycflights13')

library(dplyr)
library(nycflights13)

#check dataset
head(flights)
summary(flights)

#using dplyr
#filter()
head(filter(flights, month == 11, day == 3, carrier == 'AA'))
flights %>%
  filter(month == 11, day == 3, carrier == 'AA') %>%
  head()
#slice()
slice(flights, 1:10)
#arrange()
head(arrange(flights, year, month, day, arr_time))
#select()
head(select(flights, carrier, arr_time))
#rename()
distinct(flights, carrier)
#distinct
distinct(select(flights, carrier))
#mutate()
mutate(flights, arr_time_diff = abs(sched_arr_time - arr_time))
#transmutate()
transmute(flights, arr_time_dff = abs(sched_arr_time -arr_time))
#summarise()
summarise(flights, avg_air_time = mean(air_time, na.rm = TRUE))
#sample_n()
sample_n(flights, 10)
#sample_facr()
sample_frac(flights, 0.3)

library(ggplot2)
library(tidyr)
#load file
load("C:/Users/mwoja/Downloads/Rscripts/house_prices.rda")
prices = house_prices

#2a
ggplot(data=prices, aes(x=date, y=house_price_index)) +
  geom_smooth() +
  facet_wrap(~state, ncol = 10) +
  scale_x_date(name='Year', date_breaks = '20 years', date_labels = '%y', limits = as.Date(c('1964-01-01', '2026-01-01'), breaks = as.Date(c('1980-01-01', '2020-01-01'))))
#2b
house_reshaped <- gather(prices, measure, value, -1, -2, -5) 
#2c
ggplot(data = house_reshaped, aes(x=date, y=value, group=measure, color=measure)) +
  geom_smooth() +
  facet_wrap(~state, ncol = 10) +
  scale_x_date(name='Year', date_breaks = '20 years', date_labels = '%y', limits = as.Date(c('1964-01-01', '2026-01-01'), breaks = as.Date(c('1980-01-01', '2020-01-01'))))
#This is not a good graph to use for these data points. 
#The values for house_price_index are bigger than values for unemploy_perc,
# making the graph look wonky.   


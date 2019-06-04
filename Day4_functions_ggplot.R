### Functions and ggplot
# Author: Ariel Deardorff
# Date: June 1, 2019

# install packages
install.packages("ggplot2")

#load the library
library(ggplot2)

#### reading in gapminder ####

gapminder <- read.csv(file = "src/data/gapminder-FiveYearData.csv")

#create a working copy

gapcopy <- gapminder

#### functions ####

# psuedocode 

# name_of_function <- function(input data){
# body here - do something
# return (some output)
# }

?log
log(10)

# convert fahrenheit to kelvin degrees

fahr_to_kelvin <- function(temp){
  kelvin <- (temp-32) * (5/9) + 273.15
  return(kelvin)
}

fahr_to_kelvin(temp = 32)

kelvin_freeze <- fahr_to_kelvin(temp = 32)

# kelvin to celsius
kelvin_to_celsius <- function(temp) {
  celsius <- temp - 273.15
  return(celsius)
}

#nesting functions

fahr_to_celsius <- function(temp){
  tempk <- fahr_to_kelvin(temp)
    tempc <- kelvin_to_celsius(tempk)
      return(tempc)
    }

fahr_to_celsius(32)

# make it print something 
fahr_to_celsius <- function(temp){
  tempk <- fahr_to_kelvin(temp)
  tempc <- kelvin_to_celsius(tempk)
  print(paste("Celsius", tempc))
  return(tempc)
}

f_temp <- fahr_to_celsius(32)
f_temp

#more informative error messages
fahr_to_celsius <- function(temp =NULL){
  if(is.null(temp)){
    stop("temp is null")
  }
  stopifnot(is.numeric(temp))
  tempk <- fahr_to_kelvin(temp)
  tempc <- kelvin_to_celsius(tempk)
  print(paste("Celsius", tempc))
  return(tempc)
}


fahr_to_celsius()

#define functions in temp_fuctions.R
source("src/temp_functions.R")

#### ggplot ####

ggplot(data = gapcopy, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point()

# change the figure so that year is on the x y is the life
ggplot(data = gapcopy, aes(x = year, y = lifeExp)) + 
  geom_point() +
  labs(title = "Life expectancy over time", x = "Year", y = "Life Expectancy")

# colors
ggplot(data = gapcopy, aes(x = year, y = lifeExp, by = country, color = continent)) + 
  geom_line() +
  labs(title = "Life expectancy over time", x = "Year", y = "Life Expectancy")

# add layers
ggplot(data = gapcopy, aes(x = year, y = lifeExp, by = country, color = continent)) + 
  geom_line() + geom_point() +
  labs(title = "Life expectancy over time", x = "Year", y = "Life Expectancy")

#color lines but not the dots
ggplot(data = gapcopy, aes(x = year, y = lifeExp, by = country)) + 
  geom_point() + geom_line(aes(color = continent)) + 
  labs(title = "Life expectancy over time", x = "Year", y = "Life Expectancy")

# transform a plotted variable

ggplot(data= gapcopy, aes(x=gdpPercap, y=lifeExp, color=continent)) + geom_point() + scale_x_log10()

# plot regression line
ggplot(data = gapcopy, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point(aes(color = continent)) + scale_x_log10() + 
  geom_smooth(method = "lm")

lm(gapcopy$lifeExp ~ log10(gapcopy$gdpPercap))

#add text to plot
ggplot(data = gapcopy, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point(aes(color = continent)) + scale_x_log10() + 
  geom_smooth(method = "lm") + 
  annotate("text", x=10000, y=90, label = "linear reg: lifeExp ~ -9.1 +19*4*gdpPercap")

ggsave("results/gapminder_plot.png")

#multiple panels 
oceania <- gapcopy[gapcopy$continent == "Oceania",]
europe <- gapcopy[gapcopy$continent == "Europe",]

ggplot(data= oceania, aes(x=year, y=lifeExp, color=country)) +
  geom_line() +
  facet_wrap(~ country)

ggplot(data= europe, aes(x=year, y=lifeExp, color = country)) +
  geom_line() +
  facet_wrap(~ country)
## Covering Data Frames
# Author: Ariel Deardorff
# Date: May 30th 2019

cats <- read.csv(file = "src/data/feline-data.csv")
age <-  c(2,3,5)

#binds a column to this dataframe

cbind(cats, age)

#too many rows
age <- c(2,3,5,12)
cbind(cats, age)

#too few rows 
age <- c(2,3)
cbind(cats, age)

#fix this
age <- c(2,3,5)
cbind(cats, age)

#check and see if rows match number of elements in your vector
nrow(cats)
length(age)

#overwrite cats dataframe
cats <- cbind(cats, age)

#adding rows:
newRow <- list("torty", 3.3, 1, 9)
cats <- rbind(cats, newRow)

levels(cats$coat)
#add a level to the factor
levels(cats$coat) <- c(levels(cats$coat), "torty")

newRow <- list("torty", 3.3, 1, 9)
cats <- rbind(cats, newRow)
cats

#removing rows by index
cats[-4,]

#remove rows with NA
na.omit(cats)
cats <- na.omit(cats)

#removing Ariel's extra rows
cats <- cats[-5,]
cats

#append data to a data frame
cats <- rbind(cats, cats)

#fix the row numbers
rownames(cats) <- NULL
cats

#leaving cats behind:
#gapminder <- read.csv(file="src/data/gapminder-FiveYearData.csv")
#names(gapminder)[1]<-"Country"

cats$coat <- as.character(cats$coat)
str(cats)
newRow <- list("grey", 3.3, 1, 9)
cats <- rbind(cats, newRow)
cats
cats$coat <- as.factor(cats$coat)
str(cats)

#leaving cats behind:
gapminder <- read.csv(file = "src/data/gapminder-FiveYearData.csv")

#asking questions about data
str(gapminder)
typeof(gapminder$country)
typeof(gapminder$year)
length(gapminder)
nrow(gapminder)
dim(gapminder)

colnames(gapminder)
head(gapminder)
tail(gapminder)

#looking at specific rows
gapminder[100:105,]

#look at random sampling of rows
x <- gapminder[sample(nrow(gapminder),5),]

#export the random sample
write.csv(x, file = "src/data/gapminder-sample.csv")

# Author: Ariel Deardorff
# Date: May 29, 2019

# creates data in R
cats <- data.frame(coat = c("calico", "black","tabby"),
                   weight = c(2.1, 5.0, 3.2),
                   likes_string = c(1,0,1))

# saves data to disk
write.csv( x = cats, file = "src/data/feline-data.csv", row.names = FALSE)

#removing cats
rm(cats)

cats <- read.csv(file = "src/data/feline-data.csv")

cats$weight
cats$coat

### data types

typeof(cats$weight)

file.show("src/data/feline-data.csv")

cats <- read.csv(file = "src/data/feline-data_v2.csv")

class(cats)

my_vector <- vector(length = 3)
my_vector

x <- 1:10 
x

#structure function
str(x)

combine_vector <- c(2,6,3)

quiz_vector <- c(2,6,"3")
quiz_vector <- as.numeric(quiz_vector)
typeof(quiz_vector)
typeof(cats$likes_string)
cats$likes_string <- as.logical(cats$likes_string)
typeof(cats$likes_string)

## using combine function on vectors

ab_vector <- c("a","b")
combine_example <- c(ab_vector , "SWC")

mySeries <- 1:10

seq(1,10, by = 0.1)

sequence_example <- seq(10)
head(sequence_example, n = 2)
sequence_example

#checking type
typeof(sequence_example)

my_example <- 5:8
names(my_example) <- c("a", "b", "c","d")
my_example

cats <- read.csv(file = "src/data/feline-data.csv" ,stringsAsFactors = FALSE)
str(cats$coat)

### lists
list_example <- list(1,"a", TRUE)
str(list_example)

# a dataframe is a list of vectors (of the same length)
#index by using square brackets [row,column]
#in r indexes start at 1
cats[1,]
typeof(cats[1,])

str(cats[1,])

matrix_example <- matrix(0, ncol=6, nrow = 3)
matrix_example
class(matrix_example)

#### Subsetting data, control flow ####
## Author: Ariel Deardorff
## Date: May 31 2019

x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c("a","b","c","d","e")

#subset by index
x[1]
x[c(1,3)]
x[1:4]
x[c(1,1,3)]
x[6]
length(x)

#skipping elements
x[-2]
x[c(-1,-5)]

#skip a slice of the vector
x[-1:-3]
x[-(1:3)]

#as a reminder 
# to remove do 
# x <- x[-4]

#subsetting by name
x[c("a","c")]

#subset by logical operators
x[c(TRUE, FALSE, FALSE, TRUE, FALSE)]

#subset by value
x[x>7]

# remember dataframes and matrices are two-dimensional objects 
# df[row,col]

#tip: combine logical operations:
gapminder <- read.csv(file = "src/data/gapminder-FiveYearData.csv")

#get all data from 2002 and 2007
demo <- gapminder[gapminder$year == 2002 | gapminder$year == 2007,]

#what is the | about? It is the logical or operator 
# The & is the and operator 

#extract rows with info from 2002 and continent Africa
demo2 <- gapminder[gapminder$year == 2002 & gapminder$continent == "Africa",]

#save our file
write.csv(demo2, file = "src/data/gapminder2002Africa.csv")

#### control flow #### 

# If (condition is true){
# perform action
# }

x <- 5

if (x >= 10) {
  print("x is greater than or equal to 10")
} else if (x > 5) {
  print("x is greater than 5 and not >= 10")
} else {
  print("x is not greater than 5")
}

## find data with the rows using any
if (any(gapminder$year == 2007)){
  print("yes there is data for 2007")
}

## generate the rows using nrow
if(nrow(gapminder[(gapminder$year == 2007),]) >= 1){
  print("Record(s) for the year 2007 found.")
}

nrow(gapminder[(gapminder$year == 2007),]) >= 1

#for (iterator in set of values){
# do something
# }

for(i in 1:10){
  print(i)
}

for (j in c("a","b","c")){
  print(j)
}

z <- 1

while (z >= 0.1){
  z <- z- 0.1
  print(z)
}

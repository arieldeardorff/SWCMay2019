# 3 Functions to convert between measurements
# Name: Ariel Deardorff
# Date: June 1, 2019

#convert from fahrenheit to kelvin
fahr_to_kelvin <- function(temp){
  kelvin <- (temp-32) * (5/9) + 273.15
  return(kelvin)
}

#convert from kelvin to celsius
kelvin_to_celsius <- function(temp) {
  celsius <- temp - 273.15
  return(celsius)
}

#convert from fahrenheit to celsius
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

fahr_to_celsius(32)


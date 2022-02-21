library(tidyverse)
library(ggplot2)

getwd()

setwd("[WD GOES HERE]") 

# "data/23000_2021-01.csv"

readBoMcsv <- function(data) {
  data <- read_csv(data, skip = 7) %>% 
    select(-1) %>% 
    mutate(Date = as.Date(Date),
           dir_wind_gust = as_factor(`Direction of maximum wind gust`),
           am9_wind_dir = as_factor(`9am wind direction`),
           pm3_wind_dir = as_factor(`3pm wind direction`)) %>% 
    rename(date = Date,
           min_temp = `Minimum temperature (°C)`,
           max_temp = `Maximum temperature (°C)`,
           rainfall = `Rainfall (mm)`,
           evaporation = `Evaporation (mm)`,
           sunshine = `Sunshine (hours)`,
           time_of_max_wind_gust = `Time of maximum wind gust`,
           am9_humidity = `9am relative humidity (%)`,
           am9_MSL_pressure = `9am MSL pressure (hPa)`,
           am9_temp = `9am Temperature (°C)`,
           pm3_humidity = `3pm relative humidity (%)`,
           pm3_MSL_pressure = `3pm MSL pressure (hPa)`,
           pm3_temp = `3pm Temperature (°C)`) %>% 
    select(-evaporation, -sunshine, 
           -`Direction of maximum wind gust`, 
           -`9am wind direction`,
           -`3pm wind direction`)
}

dec21 <- readBoMcsv("data/23000_2021-12.csv")

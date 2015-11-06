
library(dplyr)

# Download data

load.data <- function () {
  
  if(!file.exists("./data")) {
    file.url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    dir.create("./data")
    download.file(file.url, destfile="data/data.zip", method="curl")  
    unzip(zipfile = "./data/data.zip", exdir = "./data")
    file.remove("./data/data.zip")
  }
  
  # Read in the data, it uses roughly 80 megabytes of RAM, my computer is 
  # able to sustain that. Then keep only dates 2007-02-01 and 2007-02-02.
  # Current date format is : dd/mm/yyyy
  
  metering.data <- read.csv('./data/household_power_consumption.txt', 
                            sep = ";", 
                            stringsAsFactors = FALSE)
  
  metering.data <- metering.data %>% filter(Date == '1/2/2007' | Date == '2/2/2007')
  
  # Convert fields to good type:
  #   - convert date field to date
  #   - measurements numeric fields as numeric
  
  metering.data$Date  <- as.Date(metering.data$Date, format = "%d/%m/%Y")
  metering.data[,3:9] <- apply(metering.data[,3:9], 2, as.numeric)
  
  # Create a date-time valid field
  
  metering.data$DateTime <- strptime(paste(metering.data$Date, metering.data$Time), "%Y-%m-%d %H:%M:%S")
  
  # Return our data frame
  metering.data
}

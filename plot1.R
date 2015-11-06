
# Check if we have data, if not load it!

source("load.data.R")

if (!exists("metering.data") || nrow(metering.data) == 0) {
  metering.data <- load.data()
}

# Plot to screen

par(mfrow=c(1,1))

hist(metering.data$Global_active_power, 
     col  = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")


# Save to PNG file with a width of 480 pixels and a height of 480 pixels.

dev <- dev.cur()
dev.copy(png, filename = "plot1.png", width = 480, height = 480)
dev.off()

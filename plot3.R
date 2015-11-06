
# Check if we have data, if not load it!

source("load.data.R")

if (!exists("metering.data") || nrow(metering.data) == 0) {
  metering.data <- load.data()
}

# Plot to screen

par(mfrow=c(1,1))

with(metering.data, {
  plot(x = DateTime, y = Sub_metering_1, 
       type = "l", col = "black", 
       xlab = "", ylab = "Energy sub metering")
  lines(x = DateTime, y = Sub_metering_2, col = "red")
  lines(x = DateTime, y = Sub_metering_3, col = "blue")
})
legend("topright", lty = 1,
       col    = c("black",          "red",            "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       text.width = strwidth("Sub_metering_1"),
       cex=0.9)

# Save to PNG file with a width of 480 pixels and a height of 480 pixels.

dev <- dev.cur()
dev.copy(png, filename = "plot3.png", width = 480, height = 480)
dev.off()

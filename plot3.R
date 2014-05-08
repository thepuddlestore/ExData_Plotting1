library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", sep = ";")
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

## Plot 3
png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(data, {
  plot(data$DateTime, data$Sub_metering_1, type = 'l', xlab = "", ylab = "Energy sub metering")
  lines(data$DateTime, data$Sub_metering_2, type = 'l', xlab = "", col = "red")
  lines(data$DateTime, data$Sub_metering_3, type = 'l', xlab = "", col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"))
})
dev.off()

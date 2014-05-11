library(sqldf) # sqldf package allowed me to easily use sql commands to specify the dates needed
data <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", sep = ";")
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S") # strptime converts to two separate columns of date and time together into once column as POSIXct

## Plot 4
png(filename = "plot4.png", width = 480, height = 480, units = "px") # initialize the png file
par(mfrow = c(2, 2)) # change the parameters so there are 2 rows and 2 columns of plots, for a total of 4
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power") # draw plot 1
plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage") # draw plot 2
with(data, { # draw plot 3
        plot(data$DateTime, data$Sub_metering_1, type = 'l', xlab = "", ylab = "Energy sub metering")
        lines(data$DateTime, data$Sub_metering_2, type = 'l', xlab = "", col = "red")
        lines(data$DateTime, data$Sub_metering_3, type = 'l', xlab = "", col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"), bty = "n")
})
plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power") # draw the new plot
dev.off() # stop writing to the png file

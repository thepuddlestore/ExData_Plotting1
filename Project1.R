data <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", sep = ";")
names(data)
?strptime
data$DateTime <- NULL
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

## Plot 1
hist(data$Global_active_power, col = "orangered", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")


## Plot 2
plot(data$DateTime, data$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")


## Plot 3
par(mfrow = c(1, 1))
with(data, {
        plot(data$DateTime, data$Sub_metering_1, type = 'l', xlab = "", ylab = "Energy sub metering")
        lines(data$DateTime, data$Sub_metering_2, type = 'l', xlab = "", col = "red")
        lines(data$DateTime, data$Sub_metering_3, type = 'l', xlab = "", col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"))
})




## Plot 4
par(mfrow = c(2, 2))
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
with(data, {
        plot(data$DateTime, data$Sub_metering_1, type = 'l', xlab = "", ylab = "Energy sub metering")
        lines(data$DateTime, data$Sub_metering_2, type = 'l', xlab = "", col = "red")
        lines(data$DateTime, data$Sub_metering_3, type = 'l', xlab = "", col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"))
        })
plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

?as.Date
str(data)
?legend
?hist
?plot

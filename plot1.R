library(sqldf)
data <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", sep = ";")
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

## Plot 1
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, col = "orangered", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

data <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", sep = ";")
names(data)
?strptime
data$DateTime <- NULL
data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

## Plot 1
hist(data$Global_active_power, col = "orangered", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")


## Plot 2
plot(data$Time, data$Global_active_power)
?as.Date
str(data)
?cat
?hist
?plot

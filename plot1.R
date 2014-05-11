library(sqldf) # sqldf package allowed me to easily use sql commands to specify the dates needed
data <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", sep = ";")
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S") # strptime converts to two separate columns of date and time together into once column as POSIXct

## Plot 1
png(filename = "plot1.png", width = 480, height = 480, units = "px") # initialize the png file
hist(data$Global_active_power, col = "orangered", main = "Global Active Power", xlab = "Global Active Power (kilowatts)") # draw the histogram
dev.off() # stop writing to the png file

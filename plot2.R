library(sqldf) # sqldf package allowed me to easily use sql commands to specify the dates needed
data <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", sep = ";")
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S") # strptime converts to two separate columns of date and time together into once column as POSIXct

## Plot 2
png(filename = "plot2.png", width = 480, height = 480, units = "px") # initialize the png file
plot(data$DateTime, data$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)") # draw the plot ('l' is for line graph)
dev.off() # stop writing to the png file

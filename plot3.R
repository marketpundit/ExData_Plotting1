## Load Data
data_set <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date to Type Date
data_set$Date <- as.Date(data_set$Date, "%d/%m/%Y")

## Select data for a specific date range  (2007-02-01 and 2007-02-02) to perform analysis.
data_set <- subset(data_set,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))


## Combine Date and Time column
DateTime <- paste(data_set$Date, data_set$Time)

## Name the vector
DateTime <- setNames(DateTime, "DateTime")

## Remove Date and Time column
data_set <- data_set[ ,!(names(data_set) %in% c("Date","Time"))]

## Add DateTime column
data_set <- cbind(DateTime, data_set)

## Format dateTime Column
data_set$DateTime <- as.POSIXct(DateTime)

## Contruct plot (480pxl by 480pxl) and save file as PNG.


png("plot3.png", height = 480, width = 480)
plot(data_set$Sub_metering_1~data_set$DateTime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data_set$DateTime, data_set$Sub_metering_2, col = "red")
lines(data_set$DateTime, data_set$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col=c("black", "red", "blue"))
dev.off()
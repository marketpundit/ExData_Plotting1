
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
png("plot1.png", height = 480, width = 480)
hist(data_set$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.off()
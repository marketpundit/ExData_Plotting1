## Contruct plot (480pxl by 480pxl) and save file as PNG.
png("plot2.png", height = 480, width = 480)
plot(data_set$Global_active_power~data_set$DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

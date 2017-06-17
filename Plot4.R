content <- read.table("SourceData/household_power_consumption.txt",sep = ";",header = T)
subSetContent <- content[(content$Date=="2/2/2007" | content$Date=="1/2/2007"),]
subSetContent$Date <- as.Date(subSetContent$Date, format="%d/%m/%Y")
dateTime <- paste(subSetContent$Date, subSetContent$Time)
subSetContent$DateTime <- as.POSIXct(dateTime)

## Setting 4 graphs
par(mfrow = c(2, 2))
#left top
plot(subSetContent$DateTime,  subSetContent$Global_active_power, type = "l", xlab = "",   ylab = "Global Active Power (kilowatts)")

# right top
with(subSetContent, plot(DateTime,Voltage,type = "l", xlab = "datetime",ylab = "Voltage"))

#left bottom
with(subSetContent, plot(DateTime, Sub_metering_1, type = "l", xlab = "",ylab = "Energy sub metering"))
with(subSetContent, points(DateTime, type = "l", Sub_metering_2,col = "red"))
with(subSetContent, points(DateTime, type = "l", Sub_metering_3,col = "blue"))
legend("topright", col = c("black", "blue", "red"),
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1)

# right bottom
with(subSetContent, plot(DateTime,Global_reactive_power,type = "l", xlab = "datetime",ylab = "Global_reactive_Power"))
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off() 

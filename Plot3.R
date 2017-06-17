content <- read.table("SourceData/household_power_consumption.txt",sep = ";",header = T)
subSetContent <- content[(content$Date=="2/2/2007" | content$Date=="1/2/2007"),]
subSetContent$Date <- as.Date(subSetContent$Date, format="%d/%m/%Y")
dateTime <- paste(subSetContent$Date, subSetContent$Time)
subSetContent$DateTime <- as.POSIXct(dateTime)
with(subSetContent, plot(DateTime, Sub_metering_1, type = "l", xlab = "",ylab = "Energy sub metering"))
with(subSetContent, points(DateTime, type = "l", Sub_metering_2,col = "red"))
with(subSetContent, points(DateTime, type = "l", Sub_metering_3,col = "blue"))
legend("topright", col = c("black", "blue", "red"),
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1)
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off() 

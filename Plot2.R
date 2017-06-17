content <- read.table("SourceData/household_power_consumption.txt",sep = ";",header = T)
subSetContent <- content[(content$Date=="2/2/2007" | content$Date=="1/2/2007"),]
subSetContent$Date <- as.Date(subSetContent$Date, format="%d/%m/%Y")
dateTime <- paste(subSetContent$Date, subSetContent$Time)
subSetContent$DateTime <- as.POSIXct(dateTime)
plot(subSetContent$DateTime,  subSetContent$Global_active_power, type = "l", xlab = "",   ylab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

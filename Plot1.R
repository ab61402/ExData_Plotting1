# read content
content <- read.table("SourceData/household_power_consumption.txt",sep = ";",header = T)

# filter
subSetContent <- content[(content$Date=="2/2/2007" | content$Date=="1/2/2007"),]

#plot
hist(as.numeric(subSetContent$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#write to png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

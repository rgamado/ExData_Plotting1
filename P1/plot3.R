fullData = read.csv("./data/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
fullData$Date = as.Date(fullData$Date, format="%d/%m/%Y")
fullData$Time = strptime(paste(as.character(fullData$Date), fullData$Time), "%Y-%m-%d %T")

filteredData = fullData[fullData$Date >= as.Date("2007-02-01", "%Y-%m-%d") & fullData$Date <= as.Date("2007-02-02", "%Y-%m-%d"),]

with(filteredData, {
  plot(Time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(Time, Sub_metering_2, type="l", col="red")
  lines(Time, Sub_metering_3, type="l", col="blue") 
})
legend("topright", lty=1, lwd=2, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, "plot3.png")
dev.off()

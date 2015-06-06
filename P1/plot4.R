fullData = read.csv("./data/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
fullData$Date = as.Date(fullData$Date, format="%d/%m/%Y")
fullData$Time = strptime(paste(as.character(fullData$Date), fullData$Time), "%Y-%m-%d %T")

filteredData = fullData[fullData$Date >= as.Date("2007-02-01", "%Y-%m-%d") & fullData$Date <= as.Date("2007-02-02", "%Y-%m-%d"),]

par(mfrow=c(2,2))

with(filteredData, {
  plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power")
  plot(Time, Voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(Time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(Time, Sub_metering_2, type="l", col="red")
  lines(Time, Sub_metering_3, type="l", col="blue") 
  legend("topright", lty=1, lwd=2, xjust=0, yjust=0, x.intersp=1, y.intersp=1, cex = 0.5, xpd = TRUE, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")
  plot(Time, Global_reactive_power, type="l", xlab="datetime", ylab="Global_rective_power")
})
dev.copy(png, "plot4.png")
dev.off()


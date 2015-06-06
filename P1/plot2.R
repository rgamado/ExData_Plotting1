fullData = read.csv("./data/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
fullData$Date = as.Date(fullData$Date, format="%d/%m/%Y")
fullData$Time = strptime(paste(as.character(fullData$Date), fullData$Time), "%Y-%m-%d %T")

filteredData = fullData[fullData$Date >= as.Date("2007-02-01", "%Y-%m-%d") & fullData$Date <= as.Date("2007-02-02", "%Y-%m-%d"),]

with(filteredData, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.copy(png, "plot2.png")
dev.off()

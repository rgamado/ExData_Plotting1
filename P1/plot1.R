fullData = read.csv("./data/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
fullData$Date = as.Date(fullData$Date, format="%d/%m/%Y")
fullData$Time = strptime(paste(as.character(fullData$Date), fullData$Time), "%Y-%m-%d %T")

filteredData = fullData[fullData$Date >= as.Date("2007-02-01", "%Y-%m-%d") & fullData$Date <= as.Date("2007-02-02", "%Y-%m-%d"),]

hist(as.numeric(filteredData$Global_active_power), xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.copy(png, "plot1.png")
dev.off()

Sys.setlocale("LC_TIME", "English")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
myData <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

fullTime <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y %H:%M:%S")
power <- as.numeric(myData$Global_active_power)

png("plot2.png", width=480, height=480)

plot(fullTime, power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
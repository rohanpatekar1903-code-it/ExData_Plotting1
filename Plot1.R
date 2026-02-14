Sys.setlocale("LC_TIME", "English")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
myData <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
power <- as.numeric(myData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off() 
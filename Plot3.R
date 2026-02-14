Sys.setlocale("LC_TIME", "English")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
myData <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

fullTime <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y %H:%M:%S")
sub1 <- as.numeric(myData$Sub_metering_1)
sub2 <- as.numeric(myData$Sub_metering_2)
sub3 <- as.numeric(myData$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(fullTime, sub1, type="l", xlab="", ylab="Energy sub metering")
lines(fullTime, sub2, col="red")
lines(fullTime, sub3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
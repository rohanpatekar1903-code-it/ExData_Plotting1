Sys.setlocale("LC_TIME", "English")
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
myData <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

fullTime <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(myData$Global_active_power)
grp <- as.numeric(myData$Global_reactive_power)
volt <- as.numeric(myData$Voltage)
sub1 <- as.numeric(myData$Sub_metering_1)
sub2 <- as.numeric(myData$Sub_metering_2)
sub3 <- as.numeric(myData$Sub_metering_3)

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(fullTime, gap, type="l", xlab="", ylab="Global Active Power")
plot(fullTime, volt, type="l", xlab="datetime", ylab="Voltage")
plot(fullTime, sub1, type="l", xlab="", ylab="Energy sub metering")
lines(fullTime, sub2, col="red")
lines(fullTime, sub3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
plot(fullTime, grp, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
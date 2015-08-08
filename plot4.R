# ---- Plot 4 -----

# Code to load in data from file
# Assumes data is downloaded and uncompressed in same file as R script
fileData <- "./household_power_consumption.txt"
data <- read.table(fileData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subData is an isolation of the data between 1/2/2007 - 2/2/2007
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Data to plot
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_act_power <- as.numeric(subData$Global_active_power)
sub1 <- as.numeric(subData$Sub_metering_1)
sub2 <- as.numeric(subData$Sub_metering_2)
sub3 <- as.numeric(subData$Sub_metering_3)
global_react_power <- as.numeric(subData$Global_reactive_power)
voltage <- as.numeric(subData$Voltage)

# Plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

## Top Left
plot(datetime, global_act_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

## Top Right
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

## Bottom Left
plot(datetime, sub1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, sub2, type="l", col="red")
lines(datetime, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

## Bottom Right
plot(datetime, global_react_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
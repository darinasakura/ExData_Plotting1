# ---- Plot 3 -----

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

# Plot
png("plot3.png", width=480, height=480)
plot(datetime, sub1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, sub2, type="l", col="red")
lines(datetime, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
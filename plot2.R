# ---- Plot 2 -----

# Code to load in data from file
# Assumes data is downloaded and uncompressed in same file as R script
fileData <- "./household_power_consumption.txt"
data <- read.table(fileData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subData is an isolation of the data between 1/2/2007 - 2/2/2007
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Data to plot
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_act_power <- as.numeric(subData$Global_active_power)

# Plot
png("plot2.png", width=480, height=480)
plot(datetime, global_act_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
# ---- Plot 1 -----

# Code to load in data from file
# Assumes data is downloaded and uncompressed in same file as R script
fileData <- "./household_power_consumption.txt"
data <- read.table(fileData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subData is an isolation of the data between 1/2/2007 - 2/2/2007
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Data to plot
global_act_power <- as.numeric(subData$Global_active_power)

# Plot
png("plot1.png", width=480, height=480)
hist(global_act_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
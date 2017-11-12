# Read data from the files into the variables
dataPath <- "./data/household_power_consumption.txt" 
data <- read.table(dataPath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset the date : 2 first day of February
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Merge the Date and Time field
DateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Set the Global_active_power to numeric
GlobalActivePower <- as.numeric(subSetData$Global_active_power)
GlobalRectivePower <- as.numeric(subSetData$Global_reactive_power)
SubMetering1 <- as.numeric(subSetData$Sub_metering_1)
SubMetering2 <- as.numeric(subSetData$Sub_metering_2)
SubMetering3 <- as.numeric(subSetData$Sub_metering_3)
Voltage <- as.numeric(subSetData$Voltage)

# Create the Image
png("plot3.png", width=480, height=480)

par(mfrow = c(2,2))

# Create the Plotting Graph
plot(DateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(DateTime,  SubMetering1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(DateTime, SubMetering2, type="l", xlab="", ylab="Energy sub metering", col="red")
lines(DateTime, SubMetering3, type="l", xlab="", ylab="Energy sub metering", col="blue")
# Add the legend
legend("topright", lty=1, lwd=1 , col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(DateTime, GlobalRectivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

# Set the Device to Off
dev.off()

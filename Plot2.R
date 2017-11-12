# Read data from the files into the variables
# 
dataPath <- "./data/household_power_consumption.txt" 
data <- read.table(dataPath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset the date : 2 first day of February
#
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Merge the Date and Time field
#
DateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Set the Global_active_power to numeric
#
GlobalActivePower <- as.numeric(subSetData$Global_active_power)

# Create the Image
#
png("plot2.png", width=480, height=480)

# Create the Histogramm
#
plot(DateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Set the Device to Off
#
dev.off()

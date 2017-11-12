# Read data from the files into the variables
# 
dataPath <- "./data/household_power_consumption.txt" 
data <- read.table(dataPath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

# Create the Image
#
png("plot1.png", width=480, height=480)

# Subset the date : 2 first day of February
#
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Set the Global_active_power to numeric
#
GlobalActivePower <- as.numeric(subSetData$Global_active_power)

# Create the Histogramm
#
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Set the Device to Off
#
dev.off()

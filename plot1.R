# Load libraries ----------------------------------------------------------
library("dplyr")

# Load data ---------------------------------------------------------------
data <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";")

# Convert Date to date type, and Time to time type ------------------------
data$Date <- as.Date(x=data$Date, format=c("%d/%m/%Y"))
data$Time <- as.POSIXct(strptime(x=data$Time, format=c("%H:%M:%S")))

# Filter data from 2007-02-01 to 2007-02-02 -------------------------------
data_to_use <- filter(data, Date=="2007-02-01" | Date=="2007-02-02")

# Transform to numeric values ---------------------------------------------
data_to_use$Global_active_power <- as.numeric(as.character(data_to_use$Global_active_power))
data_to_use$Global_reactive_power<- as.numeric(as.character(data_to_use$Global_reactive_power))
data_to_use$Voltage <- as.numeric(as.character(data_to_use$Voltage))
data_to_use$Sub_metering_1 <- as.numeric(as.character(data_to_use$Sub_metering_1))
data_to_use$Sub_metering_2 <- as.numeric(as.character(data_to_use$Sub_metering_2))
data_to_use$Sub_metering_3 <- as.numeric(as.character(data_to_use$Sub_metering_3))

# Plot --------------------------------------------------------------------
png(filename="plot1.png", width=480, height=480, units="px")
hist(data_to_use$Global_active_power, freq=TRUE, breaks = 12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

# Load libraries ----------------------------------------------------------
library("dplyr")
Sys.setlocale("LC_TIME", "English")

# Load data ---------------------------------------------------------------
data <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";")

# Convert Date to date type, and Time to time type ------------------------
data$Date <- as.Date(x=data$Date, format=c("%d/%m/%Y"))

# Filter data from 2007-02-01 to 2007-02-02 -------------------------------
data_to_use <- filter(data, Date=="2007-02-01" | Date=="2007-02-02")

# Transform to numeric values ---------------------------------------------
data_to_use$Global_active_power <- as.numeric(as.character(data_to_use$Global_active_power))
data_to_use$Global_reactive_power<- as.numeric(as.character(data_to_use$Global_reactive_power))
data_to_use$Voltage <- as.numeric(as.character(data_to_use$Voltage))
data_to_use$Sub_metering_1 <- as.numeric(as.character(data_to_use$Sub_metering_1))
data_to_use$Sub_metering_2 <- as.numeric(as.character(data_to_use$Sub_metering_2))
data_to_use$Sub_metering_3 <- as.numeric(as.character(data_to_use$Sub_metering_3))
data_to_use$Date_Time <- strptime(paste(data_to_use$Date, data_to_use$Time), format= "%Y-%m-%d %H:%M:%S")

# Plot --------------------------------------------------------------------
png(filename="plot2.png", width=480, height=480, units="px")
plot(data_to_use$Date_Time,data_to_use$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

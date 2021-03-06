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
png(filename="plot4.png", width=480, height=480, units="px")
par(mfrow = c(2,2))
with(data_to_use, {plot(Date_Time,Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(Date_Time,Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(data_to_use$Date_Time,data_to_use$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data_to_use$Date_Time,data_to_use$Sub_metering_2, type="l", col="red")
lines(data_to_use$Date_Time,data_to_use$Sub_metering_3, type="l", col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Date_Time,Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")})
dev.off()
# read and subset data
data <- read.csv(file="household_power_consumption.txt", head=TRUE, sep=";", na.strings="?")
data_plot <- subset(data, data$Date == '1/2/2007' | data$Date == '2/2/2007')

# convert to number
data_plot$Global_active_power <- as.numeric(data_plot$Global_active_power)
data_plot$Sub_metering_1 <- as.numeric(data_plot$Sub_metering_1)
data_plot$Sub_metering_2 <- as.numeric(data_plot$Sub_metering_2)
data_plot$Sub_metering_3 <- as.numeric(data_plot$Sub_metering_3)
data_plot$Voltage <- as.numeric(data_plot$Voltage)
data_plot$Global_reactive_power <- as.numeric(data_plot$Global_reactive_power)

# concatenate, convert and add Datetime field
data_plot$Datetime <- strptime(paste(data_plot$Date, data_plot$Time), "%d/%m/%Y %H:%M:%S")

# start drawing to png
png(filename="plot4.png")

# four charts to picture, margins
par(mfcol = c(2, 2), mar = c(4, 4, 2, 2))

# Global Active Power chart
plot(data_plot$Datetime, data_plot$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Energy sub metering chart
plot(data_plot$Datetime, data_plot$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
lines(data_plot$Datetime, data_plot$Sub_metering_2, col = "red")
lines(data_plot$Datetime, data_plot$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), bty = "n")

# Voltage chart
plot(data_plot$Datetime, data_plot$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Global_reactive_power chart
plot(data_plot$Datetime, data_plot$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# finish drawing to png
dev.off()

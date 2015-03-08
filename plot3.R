# read and subset data
data <- read.csv(file="household_power_consumption.txt", head=TRUE, sep=";", na.strings="?")
data_plot <- subset(data, data$Date == '1/2/2007' | data$Date == '2/2/2007')

# convert to number
data_plot$Sub_metering_1 <- as.numeric(data_plot$Sub_metering_1)
data_plot$Sub_metering_2 <- as.numeric(data_plot$Sub_metering_2)
data_plot$Sub_metering_3 <- as.numeric(data_plot$Sub_metering_3)

# concatenate, convert and add Datetime field
data_plot$Datetime <- strptime(paste(data_plot$Date, data_plot$Time), "%d/%m/%Y %H:%M:%S")

# draw to png
png(filename="plot3.png")
plot(
    data_plot$Datetime,
    data_plot$Sub_metering_1,
    col = "black",
    type = "l",
    xlab = "",
    ylab = "Energy sub metering"
)
lines(
    data_plot$Datetime,
    data_plot$Sub_metering_2,
    col = "red"
)
lines(
    data_plot$Datetime,
    data_plot$Sub_metering_3,
    col = "blue"
)
legend(
    "topright",
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    lty = 1,
    col = c("black", "red", "blue")
)
dev.off()
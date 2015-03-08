# read and subset data
data <- read.csv(file="household_power_consumption.txt", head=TRUE, sep=";", na.strings="?")
data_plot <- subset(data, data$Date == '1/2/2007' | data$Date == '2/2/2007')

# convert to number
data_plot$Global_active_power <- as.numeric(data_plot$Global_active_power)

# concatenate, convert and add Datetime field
data_plot$Datetime <- strptime(paste(data_plot$Date, data_plot$Time), "%d/%m/%Y %H:%M:%S")

# draw to png
png(filename="plot2.png")
plot(
    data_plot$Datetime,
    data_plot$Global_active_power,
    type = "l",
    xlab = "",
    ylab = "Global Active Power (kilowatts)"
)
dev.off()
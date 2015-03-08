# read and subset data
data <- read.csv(file="household_power_consumption.txt", head=TRUE, sep=";", na.strings="?")
data_plot <- subset(data, data$Date == '1/2/2007' | data$Date == '2/2/2007')

# convert to number
data_plot$Global_active_power <- as.numeric(data_plot$Global_active_power)

# draw to png
png(filename="plot1.png")
hist(
    data_plot$Global_active_power,
    col = "red",
    main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)"
)
dev.off()
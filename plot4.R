data <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

dateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2), mar = c(4, 4, 1, 1))

with(data, plot(dateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

with(data, plot(dateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

with(data, {
  plot(dateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  points(dateTime, Sub_metering_2, type = "l", col = "red")
  points(dateTime, Sub_metering_3, type = "l", col = "blue")}
)

legend("topright", lwd=c(1,1,1), bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(data, plot(dateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

dev.off()
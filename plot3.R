data <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

dateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

png("plot3.png", width=480, height=480)
par(mfrow = c(1, 1))

with(data, {
  plot(dateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  points(dateTime, Sub_metering_2, type = "l", col = "red")
  points(dateTime, Sub_metering_3, type = "l", col = "blue")}
)

legend("topright", lwd=c(1.5,1.5,1.5), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
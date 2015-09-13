data <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

dateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

par(mfrow = c(1, 1))

with(data, plot(dateTime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l"))

dev.copy(png, file = "plot2.png")
dev.off()
# with a file named "household_power_consumption.txt" in your working directory
data <- read.csv("household_power_consumption.txt", na.strings="?", sep=";")
data <- subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")

# concatenate date & time to make proper variable for x axis
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# make a png file of a histogram of global active power
png('plot4.png', width=480, height=480, bg='transparent')
par(mfrow = c(2, 2))  
  # top left plot
  hist(data$Global_active_power,
     main = "Global Active Power", breaks = 14, 
     xlab = "Global Active Power (kilowatts)", col = "red")

  # top right plot
  plot(data$DateTime, data$Voltage, type="l",
       ylab="Voltage", xlab="datetime")

  # bottom left plot
plot(data$DateTime, data$Sub_metering_1, 
     xlab ="", ylab = "Energy sub metering", type="l")
points(data$DateTime, data$Sub_metering_2, type="l", col="red")
points(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", lty = 1,bty="n", cex=.9, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  # bottom right plot
  plot(data$DateTime, data$Global_active_power, type="l")
dev.off()
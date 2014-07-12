# with a file named "household_power_consumption.txt" in your working directory
data <- read.csv("household_power_consumption.txt", na.strings="?", sep=";")
data <- subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")

# concatenate date & time to make proper variable for x axis
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# make a png file of a histogram of global active power
png('plot2.png', width=480, height=480, bg='transparent')
  plot(data$DateTime, data$Global_active_power, 
       xlab ="", ylab = "Global Active Power (kilowatts)", type="l")
dev.off()
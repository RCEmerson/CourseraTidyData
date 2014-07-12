# with a file named "household_power_consumption.txt" in your working directory
data <- read.csv("household_power_consumption.txt", na.strings="?", sep=";")
data <- subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")

# make a png file of a histogram of global active power
png('plot1.png', width=480, height=480, bg='transparent')
  hist(data$Global_active_power,
       main = "Global Active Power", breaks = 14, 
       xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
## Reading and Cleaning the Data ##

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";" , na.strings = "?")
Date <- as.Date(data$Date , "%d/%m/%Y")
data <- data[, !(names(data) %in% "Date")]
data <- cbind(Date, data)
data <- subset (data, Date >= "2007-2-1" & Date <= "2007-2-2")
data <- data[complete.cases(data), ]
DT <- paste(data$Date, data$Time)
DT <- setNames (DT, "DateTime")
DT <- as.POSIXct(DT)
data <- data [, !(names(data) %in% c("Date", "Time"))]
data <- cbind (DT, data)

## Plot 3 ##

plot(data$Sub_metering_1 ~ data$DT , type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$Sub_metering_2 ~ data$DT, col = 'Red')
lines(data$Sub_metering_3 ~ data$DT, col = 'Blue')
legend("topright", col = c("black", "red", "blue"), lwd = c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
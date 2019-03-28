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

## Plot 2 ##

plot(data$Global_active_power ~ data$DT, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()
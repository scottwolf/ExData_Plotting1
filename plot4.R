setwd("C:/Users/Scot Wolf/Google Drive/MOOCs/Data Science Specialization (Johns Hopkins - Coursera)/4 Exploratory Data Analysis/Course Project 1/exdata-data-household_power_consumption")

data <- read.table("./household_power_consumption.txt", 
                   sep = ";", header=TRUE, na.strings = "?")

# Formatting dates
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(data$datetime, format="%Y-%m-%d %H:%M:%S")

# Subset datset to dates of interest, remove full dataset
datasub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)


#Plot4 Code

png(filename="plot4.png", width=480, height=480)

par(mfrow=c(2,2))

#Top Left Corner
plot(datasub$Global_active_power~datasub$datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

#Top Right Corner
plot(datasub$Voltage~datasub$datetime, type="l",
     ylab="Voltage", xlab="datatime")

#Bottom Left Corner
plot(datasub$datetime, datasub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", main = "")
lines(datasub$datetime, datasub$Sub_metering_2, col = "red")
lines(datasub$datetime, datasub$Sub_metering_3, col = "blue")

legend("topright", lty = 1, 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"),
       bty = "n")

#Bottom Right Corner
plot(datasub$Global_reactive_power~datasub$datetime, type="l",
     ylab="Global_reactive_power", xlab="datatime")


dev.off()
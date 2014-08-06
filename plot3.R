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


#Plot 3 Code

png(filename = "plot3.png", width = 480, height = 480)

plot(datasub$datetime, datasub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", main = "")
        lines(datasub$datetime, datasub$Sub_metering_2, col = "red")
        lines(datasub$datetime, datasub$Sub_metering_3, col = "blue")

legend("topright", lty = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))

dev.off()
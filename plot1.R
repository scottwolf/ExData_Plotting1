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

# Plot1 code
png(filename="plot1.png", width=480, height=480)

hist(datasub$Global_active_power, main="Global Active Power", col = "Red",
     xlab = "Global Active Power (kilowatts)")
     
dev.off()
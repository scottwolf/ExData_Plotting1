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


#Plot2 Code

png(filename="plot2.png", width=480, height=480)

plot(datasub$Global_active_power~datasub$datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.off()
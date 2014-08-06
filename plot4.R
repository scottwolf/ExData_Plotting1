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
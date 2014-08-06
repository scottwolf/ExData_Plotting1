# Create png file for Plot 3
png(filename = "plot3.png", width = 480, height = 480)

plot(datasub$datetime, datasub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", main = "")
        lines(datasub$datetime, datasub$Sub_metering_2, col = "red")
        lines(datasub$datetime, datasub$Sub_metering_3, col = "blue")

legend("topright", lty = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))

dev.off()
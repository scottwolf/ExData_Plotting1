#Plot2

png(filename="plot2.png", width=480, height=480)

plot(datasub$Global_active_power~datasub$datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.off()
## read the raw data set
h = read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## convert the date from string
h[,1] <- as.Date(h[,1], "%d/%m/%Y")

## choose the date range
h <- h[h$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

## plot Sub_metering_1
plot(h[,"Sub_metering_1"], ylab = "Energy sub metering", type = "l", xlab = "", xaxt='n')

## add Sub_metering_2
points(h[,"Sub_metering_2"], col = "red", type = "l")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black","red", "blue"))

## add Sub_metering_3
points(h[,"Sub_metering_3"], col = "blue", type = "l")

## add custom x ticks
axis(1, at=c(1,nrow(h)/2, nrow(h)), labels=c("Thu", "Fri", "Sat")) 

## save to png file
dev.copy(png, "plot3.png")
dev.off()
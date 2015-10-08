## read the raw data set
h = read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## convert the date from string
h[,1] <- as.Date(h[,1], "%d/%m/%Y")

## choose the date range
h <- h[h$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

## plot without x ticks
plot(h[,3], ylab = "Global Active Power (kilowatts)", type = "l", xlab = "", xaxt='n')

## add custom x ticks
axis(1, at=c(1,nrow(h)/2, nrow(h)), labels=c("Thu", "Fri", "Sat")) 

## save to png file
dev.copy(png, "plot2.png")
dev.off()
## read the raw data set
h = read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## convert the date from string
h[,1] <- as.Date(h[,1], "%d/%m/%Y")

## choose the date range
h <- h[h$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

## calculate the histogramm
hist_data <- hist(h[,"Global_active_power"])

## plot
plot(hist_data, col = 'red', main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## save to png file
dev.copy(png, "plot1.png")
dev.off()
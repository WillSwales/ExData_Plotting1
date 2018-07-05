## plot4.R

## read and subset data
library(readr)
data <- read_csv2("household_power_consumption.txt", n_max=2075259,na="?")
subset <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

## convert character columns to numeric
cols_to_change = c(3:9)
subset[cols_to_change] <- sapply(subset[cols_to_change],as.numeric)

## create datetime
library(lubridate)
datetime <- dmy(subset$Date) + hms(subset$Time)

## initialise png file
png(filename="plot4.png", width = 480, height = 480, units = "px")

## initalise plot 4 area
par(mfcol = c(2, 2), cex.lab=0.75)

## create plot 4.1
plot(datetime,
     subset$Global_active_power,
     type="l",
     ylab="Global active power" ,
     xlab =""
)

## create plot 4.2
plot(datetime,
     subset$Sub_metering_1,
     type="l",
     ylab="Energy sub metering" ,
     xlab =""
)
lines(datetime,subset$Sub_metering_2,col="red")
lines(datetime,subset$Sub_metering_3,col="blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),
       lwd=c(1,1,1),
       cex=0.7,
       bty = "n")

## create plot 4.3
plot(datetime,
     subset$Voltage/1000,
     type="l",
     ylab="Voltage" ,
     xlab ="datetime"
)

## create plot 4.4
plot(datetime,
     subset$Global_reactive_power,
     type="l",
     ylab="Global_reactive_power" ,
     xlab ="datetime"
)

## close connection
dev.off()
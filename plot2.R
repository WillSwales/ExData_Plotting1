## plot2.R

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
png(filename="plot2.png", width = 480, height = 480, units = "px")

## create plot 2
plot(datetime,
     subset$Global_active_power,
     type="l",
     ylab="Global active power (kilowatts)" ,
     xlab =""
     )

## close connection
dev.off()
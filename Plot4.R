
#Load the data.table library
library(data.table)


# Read data into a table with appropriate classes
data <- read.table('C:/R/exdata-data-household_power_consumption/household_power_consumption.txt', header=TRUE,
                       sep=';', na.strings='?',
                       colClasses=c(rep('character', 2), 
                                    rep('numeric', 7)))


# Convert dates and times
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

### Subsets the data
data <- subset(data, subset = (Date == "2007-02-01" | Date == "2007-02-02"))

## combine date and time. 
date_time <- paste(as.Date(data$Date), data$Time)

##Converts dates
data$Datetime <- as.POSIXct(date_time)

## Draw the Plot 4
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(data, {
  plot(Global_active_power~Datetime, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  plot(Voltage~Datetime, type = "l", 
       ylab = "Voltage (volt)", xlab = "")
  plot(Sub_metering_1~Datetime, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2~Datetime, col = 'Red')
  lines(Sub_metering_3~Datetime, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type = "l", 
       ylab = "Global Rective Power (kilowatts)", xlab = "")
})


## Save the graph to a png file
dev.copy(png, file = "C:/R/ExData_Plotting1/plot4.png", height = 480, width = 820)
dev.off()
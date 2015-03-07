
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

## Draw the Plot 3
with(data, {
  plot(Sub_metering_1~Datetime, type = "l",
       ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2~Datetime, col = 'Red')
  lines(Sub_metering_3~Datetime, col = 'Blue')
})
legend("topright", col=c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## Save the graph to a png file
dev.copy(png, file = "C:/R/ExData_Plotting1/plot3.png", height = 480, width = 820)
dev.off()
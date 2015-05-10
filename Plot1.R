
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

## Draw the Plot 1
##hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

## Save the graph to a png file
##dev.copy(png, file = "C:/R/ExData_Plotting1/plot1.png", height = 480, width = 480)

png("C:/R/plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col="red",
           xlab="Global Active Power (kilowatts)",
           main="Global Active Power")
dev.off()

#dev.off()
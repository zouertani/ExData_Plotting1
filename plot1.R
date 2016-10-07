## package sqldf is required to use read.csv.sql
library(sqldf)

## Reading and loading data only from the dates 2007-02-01 and 2007-02-02
## Read File Filtered by SQL
EPC <- read.csv.sql("./ExData_Plotting1/household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ", sep=';', nrows=2075259, stringsAsFactors=F, eol = "\n" ); closeAllConnections()

## Converting the Date and Time variables to Date/Time classes 
EPC$Date <- as.Date(EPC$Date, format="%d/%m/%Y")
EPC$DateTime <- as.POSIXct(paste(EPC$Date,EPC$Time))

## plotting

## Plot 1
EPC$Global_active_power <- as.numeric(EPC$Global_active_power)
hist(EPC$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to png file
dev.copy(png, file="./ExData_Plotting1/plot1.png", height=480, width=480)
dev.off()

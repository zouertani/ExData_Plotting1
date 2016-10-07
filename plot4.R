## package sqldf is required to use read.csv.sql
library(sqldf)

## Reading and loading data only from the dates 2007-02-01 and 2007-02-02
## Read File Filtered by SQL
EPC <- read.csv.sql("./ExData_Plotting1/household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ", sep=';', nrows=2075259, stringsAsFactors=F, eol = "\n" ); closeAllConnections()

## Converting the Date and Time variables to Date/Time classes 
EPC$Date <- as.Date(EPC$Date, format="%d/%m/%Y")
EPC$DateTime <- as.POSIXct(paste(EPC$Date,EPC$Time))

## plotting
## plot 4

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(EPC, {
        plot(Global_active_power~DateTime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~DateTime, type="l", 
             ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1~DateTime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~DateTime,col='Red')
        lines(Sub_metering_3~DateTime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~DateTime, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="")
})

## Saving to png file
dev.copy(png, file="./ExData_Plotting1/plot4.png", height=480, width=480)
dev.off()
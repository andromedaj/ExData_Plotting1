plot4 <- function () {
  
  
  datafile <- "household_power_consumption.txt"
  
  require("sqldf")
  
  mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
  
  tableData <- read.csv.sql(datafile, sql=mySql, sep=";")
  
  
  tableData$DateTime <- as.POSIXct(paste(tableData$Date,tableData$Time), format="%d/%m/%Y %H:%M:%S") 
  
  png(filename = "plot4.png", width = 480, height = 480)
  
  par(mfrow = c(2,2))
  
  with (tableData, {
        
        plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
        
        plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
        
        plot(DateTime, Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
        lines(DateTime, Sub_metering_2, type="l", col="red")
        lines(DateTime, Sub_metering_3, type="l", col="blue")
        legend("topright", col=c("black", "red", "blue"), cex=0.8, lty=1, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  }
  )
  
  
  dev.off()
  
  
}

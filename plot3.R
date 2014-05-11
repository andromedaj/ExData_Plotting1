plot3 <- function () {
  
  datafile <- "household_power_consumption.txt"
  
  require("sqldf")
  
  mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
  
  tableData <- read.csv.sql(datafile, sql=mySql, sep=";")
  
  
  tableData$DateTime <- as.POSIXct(paste(tableData$Date,tableData$Time), format="%d/%m/%Y %H:%M:%S") 
  
  png(filename = "plot3.png", width = 480, height = 480)
  plot(tableData$DateTime, tableData$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
  #lines(tableData$DateTime, tableData$Sub_metering_1, type="l", col="black")
  lines(tableData$DateTime, tableData$Sub_metering_2, type="l", col="red")
  lines(tableData$DateTime, tableData$Sub_metering_3, type="l", col="blue")
  legend("topright", col=c("black", "red", "blue"), cex=0.8, lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  
  dev.off()
  
  
}

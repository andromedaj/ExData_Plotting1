plot2 <- function () {
  
  datafile <- "household_power_consumption.txt"
  
  require("sqldf")
  
  mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
  
  tableData <- read.csv.sql(datafile, sql=mySql, sep=";")
  
  
  tableData$DateTime <- as.POSIXct(paste(tableData$Date,tableData$Time), format="%d/%m/%Y %H:%M:%S") 

  png(filename = "plot2.png", width = 480, height = 480)
  
  plot(tableData$DateTime, tableData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  
  dev.off()
   
  
}

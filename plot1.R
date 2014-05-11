plot1 <- function () {
  
  
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  
  download.file(fileURL, destfile="household_power_consumption.zip")
    
  datafile <- unzip("household_power_consumption.zip")
  
  
  
  #install.packages("sqldf")
  require("sqldf")
  
  mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
  
  tableData <- read.csv.sql(datafile, sql=mySql, sep=";")
  
  png(filename = "plot1.png", width = 480, height = 480)
  
  hist(tableData$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
  
  
  dev.off()
  
  
  
}

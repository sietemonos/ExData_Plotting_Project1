## Constructs exploratory plots to examine how household energy usage varies
## over a 2-day period in February 2007.
##
## INPUTS:
##   Dataset: Electric power consumption [20Mb]
##     filter by dates 2007-02-01 and 2007-02-02.
##
## OUTPUTS:
##   plot3.png: Sub_metering_1, Sub_metering_2 and Sub_metering_3 vs.
##     DateTime (in spanish)

# Step 1: Read data
library(sqldf)
FILE_URL <- "household_power_consumption.txt"
dataSet <- read.csv.sql(FILE_URL, 
                         sql = "select * from file where Date in ('1/2/2007',
                         '2/2/2007')", header = TRUE, sep = ";",
                         stringsAsFactors = FALSE)

# Step 2: Convert the Date and Time variables to Date/Time classes
dataTime <- strptime(paste(dataSet$Date, dataSet$Time, sep = " "),
                      "%d/%m/%Y %H:%M:%S")

# Step 3: Convert the Global_active_power and Sub_metering variables
#  to numeric classes
globalActivePower <- as.numeric(dataSet$Global_active_power)
subMetering1 <- as.numeric(dataSet$Sub_metering_1)
subMetering2 <- as.numeric(dataSet$Sub_metering_2)
subMetering3 <- as.numeric(dataSet$Sub_metering_3)

# Step 4: Make the 2D plot
png("plot3.png", width = 480, height = 480)
plot(dataTime, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(dataTime, subMetering2, type = "l", col = "red")
lines(dataTime, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 2.5, col = c("black", "red", "blue"))

dev.off()
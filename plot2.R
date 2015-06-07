## Constructs exploratory plots to examine how household energy usage varies
## over a 2-day period in February 2007.
##
## INPUTS:
##   Dataset: Electric power consumption [20Mb]
##     filter by dates 2007-02-01 and 2007-02-02.
##
## OUTPUTS:
##   plot2.png: 2D plot of Global_active_power vs. DateTime (in spanish)

# Step 1: Read data
library(sqldf)
FILE_URL <- "household_power_consumption.txt"
dataSet <- read.csv.sql(FILE_URL, 
                         sql = "select * from file where Date in ('1/2/2007', 
                         '2/2/2007')", header = TRUE, sep =";",
                         stringsAsFactors = FALSE)

# Step 2: Convert the Date and Time variables to Date/Time classes
dataTime <- strptime(paste(dataSet$Date, dataSet$Time, sep= " "),
                      "%d/%m/%Y %H:%M:%S")

# Step 3: Convert the Global Active Power variable to numeric class
globalActivePower <- as.numeric(dataSet$Global_active_power)

# Step 4: Make the 2D plot
with(dataSet, plot(dataTime, globalActivePower, type = "l", xlab= "", 
                    ylab = "Global Active Power (kilowatts)"))

#step 5: Print the 2D plot in a png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
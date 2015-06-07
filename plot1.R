## Constructs exploratory plots to examine how household energy usage varies
## over a 2-day period in February 2007.
##
## INPUTS:
##   DataSet: Electric power consumption [20Mb] 
##     filtered by dates 2007-02-01 and 2007-02-02.
##
## OUTPUTS:
##   plog1.png: Histogram of Global_active_power

# Step 1: Read data
library(sqldf)
FILE_URL <- "household_power_consumption.txt"
dataSet <- read.csv.sql(FILE_URL, 
                         sql = "select * from file where Date in ('1/2/2007', 
                        '2/2/2007')", header = TRUE, sep =";", 
                        stringsAsFactors = FALSE)

# Step 2: Convert the Global Active Power variable to numeric class
globalActivePower <- as.numeric(dataSet$Global_active_power)

# Step 3: Make the histogram
with(dataSet, hist(globalActivePower, col = "red", main="Global Active Power",
                    xlab="Global Active Power (kilowatts)"))

#step 4: Print the histogram in a png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
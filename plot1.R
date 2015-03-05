# plot1.R
#   Exploratory Data Analysis Project 1, plot 1.

# load data
fname = ".\\exdata-data-household_power_consumption\\household_power_consumption.txt"
data = read.table(fname, header = TRUE, sep = ";", na.strings = "?")

# change Date and Time to date/time classes
library(lubridate)
library(dplyr)
data <- mutate(data, Date = dmy(Date))
data <- mutate(data, Time = hms(Time))

# select dates of interest and overwrite "data" to save space in memory
data <- data[(data$Date >= ymd("2007-02-01")) & (data$Date <= ymd("2007-02-02")),]
data <- tbl_df(data) # nicer format to review

# Create plot
hist(data$Global_active_power, 
     main = "Global Active Power", 
     col = "red",
     xlab = "Global Active Power (kilowatts)")

# Save as PNG
dev.copy(png, file = ".\\ExData_Plotting1\\plot1.png", width=480, height=480)
dev.off()

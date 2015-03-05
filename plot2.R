# plot2.R
#   Exploratory Data Analysis Project 1, plot 2.

# load data
fname = ".\\exdata-data-household_power_consumption\\household_power_consumption.txt"
data = read.table(fname, header = TRUE, sep = ";", na.strings = "?")
data <- tbl_df(data) # nicer format to review

# change Date and Time to date/time classes
library(lubridate)
library(dplyr)
data <- mutate(data, datetime = dmy_hms(paste(Date, Time, sep = " ")))

# Select dates of interest
data2 <- data[(data$datetime >= ymd_hms("2007-02-01 00:00:00")) & 
              (data$datetime < ymd_hms("2007-02-03 00:00:00")),]

# plot it!
with(data2, plot(Global_active_power ~ datetime, 
                 type = "l",
                 xlab = "",
                 ylab = "Global Active Power (kilowatts)"))

# Save as PNG
dev.copy(png, file = ".\\ExData_Plotting1\\plot2.png", width=480, height=480)
dev.off()

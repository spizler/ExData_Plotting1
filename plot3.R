# plot3.R
#   Exploratory Data Analysis Project 1, plot 3.

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

# Plot it!!
with(data2, plot(Sub_metering_1 ~ datetime,
      type = "l",
      col = "black",
      xlab = "",
      ylab = "Energy sub metering"))
lines(data2$Sub_metering_2 ~ data2$datetime,
      col = "red")
lines(data2$Sub_metering_3 ~ data2$datetime,
      col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1))

# Save as PNG
dev.copy(png, file = ".\\ExData_Plotting1\\plot3.png", width=480, height=480)
dev.off()
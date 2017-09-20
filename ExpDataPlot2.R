##Coursera Exploratory Data Analysis Week 1 Project Plot 2 - ExpDataPlot2.R
##The script does the following:
## 1)Reads the power consumption data from "household_power_consumption.txt".
## 2)Converts the "Date" column appropriately to date datatype
## 3)Extracts only the data corresponding to the dates "2007-02-01" and "2007-02-02"
## 4)Creates a new column datetime which includes the date and the timestamp
## 5)Plots a time series graph for Global Active Power and outputs to png file
##
## Arguments: None
## Output   : Plot2.png 
##
##Author     Venkatesh Vedam
##
##Version    1.0

# Set working directory
setwd('D:/DS/CoursEra/ExploratoryDataAnalysis/power_consumption')
#Read data from the text file.
pow <- read.csv("household_power_consumption.txt",header = TRUE,stringsAsFactors = FALSE,sep = ";"
)
#Convert the format for date and filter for reqd dates
pow$Date <- as.Date(pow$Date,format = "%d/%m/%Y")
pow <- pow[which( pow$Date == "2007-02-01" | pow$Date == "2007-02-02"), ]
#Convert global active power column to numeric since it was read as a character
pow$Global_active_power <- as.numeric(pow$Global_active_power)
#Create datetime column which includes the date and the timestamp
pow$datetime <- as.POSIXct(paste(pow$Date, pow$Time), format="%Y-%m-%d %H:%M:%S")
#Set the plot dimensions
par(mfrow=c(1,1))
#Create the initial plot
plot(pow$datetime,pow$Global_active_power,pch='.:',main = "Plot 2", xlab = "",ylab = "Global Active Power")
#Add line joining points
lines(pow$datetime,pow$Global_active_power,type = "l")
#Write to output file
dev.copy(png, file = "Plot2.png")
dev.off()


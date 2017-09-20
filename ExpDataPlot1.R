##Coursera Exploratory Data Analysis Week 1 Project Plot 1 - ExpDataPlot1.R
##The script does the following:
## 1)Reads the power consumption data from "household_power_consumption.txt".
## 2)Converts the "Date" column appropriately to date datatype
## 3)Extracts only the data corresponding to the dates "2007-02-01" and "2007-02-02"
## 4)Plots the frequency histogram for the Global Active Power column and saves
##   to a png file as indicated below.
##
## Arguments: None
## Output   : Plot1.png 
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
#Set plot dimensions.
par(mfrow=c(1,1))
#Create histogram 
hist(pow$Global_active_power,col="red",
     breaks = 20,
     main = "Plot1",
     xlab = "Global Active Power (kilowatts)")
#Write to png file
dev.copy(png, file = "Plot1.png")
dev.off()


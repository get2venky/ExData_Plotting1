##Coursera Exploratory Data Analysis Week 1 Project Plot 3 - ExpDataPlot3.R
##The script does the following:
## 1)Reads the power consumption data from "household_power_consumption.txt".
## 2)Converts the "Date" column appropriately to date datatype
## 3)Extracts only the data corresponding to the dates "2007-02-01" and "2007-02-02"
## 4)Creates a new column datetime which includes the date and the timestamp
## 5)Plots separates time series graph for the 3 sub metering columns on the same plot
## 6)Outputs to png file
##
## Arguments: None
## Output   : Plot3.png 
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
#Set plot dimesions
par(mfrow=c(1,1))
#Create the graph and axis without the lines
matplot((pow$datetime),pow$Sub_metering_1,pch = '.:',axes=F,main="Plot 3",xlab = "",ylab = "Energy Sub Metering")
axis.POSIXct(side=1,pow$datetime,format='%a', labels = TRUE)
axis(side = 2,seq(0,50,10))
#Add lines
lines(pow$datetime,pow$Sub_metering_1,type = "l",col= "gray")
lines(pow$datetime,pow$Sub_metering_2,type = "l",col= "red")
lines(pow$datetime,pow$Sub_metering_3,type = "l",col= "blue")
#Add legend
legend("topright", 
       col=c("gray","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       lwd=c(2.5,2.5,2.5),
       cex = 0.7,
       pt.cex = 1
)
#Write to output file
dev.copy(png, file = "Plot3.png")
dev.off()


##Coursera Exploratory Data Analysis Week 1 Project Plot 4 - ExpDataPlot4.R
##The script does the following:
## 1)Reads the power consumption data from "household_power_consumption.txt".
## 2)Converts the "Date" column appropriately to date datatype
## 3)Extracts only the data corresponding to the dates "2007-02-01" and "2007-02-02"
## 4)Creates a new column datetime which includes the date and the timestamp
## 5)Plots 4 different graphs on the same page
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
par(mfrow=c(2,2))
plot(pow$datetime,pow$Global_active_power,pch='.:', xlab = "",ylab = "Global Active Power")
lines(pow$datetime,pow$Global_active_power,type = "l")

plot(pow$datetime,pow$Voltage,pch='.:',xlab = "datetime",ylab = "Voltage")
lines(pow$datetime,pow$Voltage,type = "l")

matplot((pow$datetime),pow$Sub_metering_1,pch = '.:',axes=F,xlab = "",ylab = "Energy Sub Metering")
axis.POSIXct(side=1,pow$datetime,format='%a', labels = TRUE)
axis(side = 2,seq(0,50,10))
lines(pow$datetime,pow$Sub_metering_1,type = "l",col= "gray")
lines(pow$datetime,pow$Sub_metering_2,type = "l",col= "red")
lines(pow$datetime,pow$Sub_metering_3,type = "l",col= "blue")
#Add legend
legend(locator(1),col=c("gray","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       lwd=c(2,2,2),
       cex = 0.6,
       pt.cex = 1,
       bty = "n"
)

plot(pow$datetime,pow$Global_reactive_power,pch='.:',xlab = "datetime",ylab = "Global Reactive Power")
lines(pow$datetime,pow$Global_reactive_power,type ="l")

dev.copy(png, file = "Plot4.png")
dev.off()























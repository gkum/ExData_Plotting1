#set working dir
setwd("C:/D_Drive/Office/Courses/Exploratory Data Analysis/Project 1")
#read and save file 
data_epc <- read.table("household_power_consumption.txt", stringsAsFactors= FALSE, 
                       header=T, sep=";", na.strings="?")

#convert date to other format
data_epc$Date <- as.Date(data_epc$Date, format="%d/%m/%Y")

#create subset of required data
data_need <- data_epc[(data_epc$Date =="2007-2-1")|(data_epc$Date =="2007-2-2"), ]

#converting date and time format
datetime<- paste(as.Date(data_need$Date), data_need$Time)
data_need$Datetime<- as.POSIXct(datetime)

#plot4

par(mfrow = c(2, 2))
plot(data_need$Datetime, data_need$Global_active_power, type="l", 
     ylab="Global Active Power")
plot(data_need$Datetime, data_need$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(data_need$Datetime, data_need$Sub_metering_1, type="l", ylab="Energy Submetering",
     xlab="")
lines(data_need$Datetime, data_need$Sub_metering_2, type="l", col="red")
lines(data_need$Datetime, data_need$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, 
       cex=0.5, lwd=2.5, bty="n", col=c("black", "red", "blue"))

plot(data_need$Datetime, data_need$Global_reactive_power, xlab="datetime", 
     ylab="Global_reactive_power", type="l")

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()

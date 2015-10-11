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

#plot3
plot(data_need$Sub_metering_1~data_need$Datetime, type="l", 
     ylab="Energy Submetering", xlab="")
lines(data_need$Sub_metering_2~data_need$Datetime, col="red")
lines(data_need$Sub_metering_3~data_need$Datetime, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, 
       lwd=2, col=c("black", "red", "blue"))

#save file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

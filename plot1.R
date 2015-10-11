#set working dir
setwd("C:/D_Drive/Office/Courses/Exploratory Data Analysis/Project 1")
#read and save file 
data_epc <- read.table("household_power_consumption.txt", stringsAsFactors= FALSE, 
                       header=T, sep=";", na.strings="?")
#convert date to required format
data_epc$Date <- as.Date(data_epc$Date, format="%d/%m/%Y")

#create subset of required data
data_need <- data_epc[(data_epc$Date =="2007-2-1")|(data_epc$Date =="2007-2-2"), ]

#Plot 1

hist(data_need$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
#save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

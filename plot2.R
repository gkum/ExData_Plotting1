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

#Plot2
plot(data_need$Global_active_power~data_need$Datetime, type="l",  
     ylab="Global Active Power (kilowatts)", xlab="")

#save file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

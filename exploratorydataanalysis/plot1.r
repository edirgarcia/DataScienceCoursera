#load data
data = read.table("household_power_consumption.txt",skip=66637,sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.string="?", nrows=2880)
names(data) = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data$Time = as.POSIXct(strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S"))
data$Date = data$Time

#begin the graphing
#plot1
hist(data$Global_active_power,col="orangered1",breaks=12, xlim = c(0,6),main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()
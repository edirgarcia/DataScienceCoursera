#load data
data = read.table("household_power_consumption.txt",skip=66637,sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.string="?", nrows=2880)
names(data) = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data$Time = as.POSIXct(strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S"))
data$Date = data$Time

#plot2
plot(data$Date,data$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()
#load data
data = read.table("household_power_consumption.txt",skip=66637,sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.string="?", nrows=2880)
names(data) = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data$Time = as.POSIXct(strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S"))
data$Date = data$Time

#plot4
par(mfrow=c(2,2))
plot(data$Date,data$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")
plot(data$Date,data$Voltage,type="l",xlab="datetime", ylab="Voltage")
plot(data$Date,data$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
lines(data$Date,data$Sub_metering_2,col="red")
lines(data$Date,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex = .4,text.width=44360)
plot(data$Date,data$Global_reactive_power,type="l",xlab="datetime", ylab="Global_reactive_power")
dev.copy(png,file="plot4.png")
dev.off()
par(mfrow=c(1,1))
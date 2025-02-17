data<-read.table("household_power_consumption.txt", sep=";", header = TRUE)
febdata_log<- subset(data, Date == "1/2/2007" | Date== "2/2/2007")
febdata_log_num<-as.numeric(paste(febdata_log$Global_active_power))
datetime<-paste(febdata_log$Date,febdata_log$Time)
datetime<-strptime(datetime, format= "%d/%m/%Y %H:%M:%S")
datetime<-as.POSIXct(datetime2)
Submetering_1<-as.numeric(paste(febdata_log$Sub_metering_1))
Submetering_2<-as.numeric(paste(febdata_log$Sub_metering_2))
Submetering_3<-as.numeric(paste(febdata_log$Sub_metering_3))
Voltage<-as.numeric(paste(febdata_log$Voltage))
Global_reactive_power<-as.numeric(paste(febdata_log$Global_reactive_power))

png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(febdata_log_num~datetime, type="l", ,xlab=NA, ylab="Global Active Power")

plot(datetime, Voltage, type="l", xlab="datetime")

plot(x=datetime, y=Submetering_1, type= "l", xlab="", ylab="Energy sub metering")
lines(datetime, Submetering_2, type="l", col="red")
lines(datetime, Submetering_3, type="l", col="blue")
legend("topright", inset= .01, col=c("black", "red", "blue"), lty=c(1,1,1), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), box.lty=0)

plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab= "Global_reactive_power")
dev.off()
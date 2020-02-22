data_classes<-c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data_name<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

data<-read.table("household_power_consumption.txt",sep=";",skip=66637,colClasses = data_classes,col.names = data_name,nrows=2880)

png("plot4.png",width = 480,height=480)

date<-strptime(paste(data[,"Date"],data[,"Time"]),format = "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2),lwd=1.2)

plot(date,data$Global_active_power,xlab = "",ylab="Global Active Power (kilowatts)",type="n")
lines(date,data$Global_active_power)

plot(date,data$Voltage,xlab = "datetime",ylab="Voltage",type="n")
lines(date,data$Voltage)

plot(date,data$Sub_metering_1,type="n",xlab = "",ylab = "Energy sub metering")
lines(date,data$Sub_metering_1)
lines(date,data$Sub_metering_2,col="red")
lines(date,data$Sub_metering_3,col="blue")

legend(date[1500],38,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=0.5,box.lty = 0)

plot(date,data$Global_reactive_power,xlab = "datetime",ylab="Global_reactive_power",type="n")
lines(date,data$Global_reactive_power)

dev.off()
data_classes<-c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data_name<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

data<-read.table("household_power_consumption.txt",sep=";",skip=66637,colClasses = data_classes,col.names = data_name,nrows=2880)

png("plot2.png",width = 480,height=480)

date<-strptime(paste(data[,"Date"],data[,"Time"]),format = "%d/%m/%Y %H:%M:%S")

plot(date,data$Global_active_power,xlab = "",ylab="Global Active Power (kilowatts)",type="n")
lines(date,data$Global_active_power)

dev.off()

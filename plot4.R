#Plot 4

#Read the data, assuming that the file is in the same directory where the script is running

data<-read.csv(file="household_power_consumption.txt",sep=";",stringsAsFactors=TRUE,na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#Subset data to the necessary data, only from dates 2007-02-01 and 2007-02-02

data<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")

#Convert column Date to Date

data$Date<-as.Date(data$Date,"%d/%m/%Y")

#Create a new column with timestamp merging Date and Time columns

data <- transform(data, completedate=as.POSIXct(paste(Date, Time)))

#Set the graphic distribution

par(mfrow=c(2,2))

#Create the graphics

#Graphic 1

plot(data$completedate,data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#Graphic 2

plot(data$completedate,data$Voltage, type="l", xlab="datetime", ylab="Voltage")

#Graphic 3

plot(data$completedate,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data$completedate,data$Sub_metering_2,col="red")
lines(data$completedate,data$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(1,1),cex=0.5)

#Graphic 4

plot(data$completedate,data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#Copy to device PNG

dev.copy(png, file="plot4.png", height=480, width=480)

#Close the device
dev.off()
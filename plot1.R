##Plot 1

#Read the data, assuming that the file is in the same directory where the script is running

data<-read.csv(file="household_power_consumption.txt",sep=";",stringsAsFactors=TRUE,na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#Subset data to the necessary data, only from dates 2007-02-01 and 2007-02-02

data<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")

#Create the graphic

hist(data$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Copy to device PNG

dev.copy(png, file="plot1.png", height=480, width=480)

#Close the device

dev.off()
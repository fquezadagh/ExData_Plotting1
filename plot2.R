#Plot 2

#Read the data, assuming that the file is in the same directory where the script is running

data<-read.csv(file="household_power_consumption.txt",sep=";",stringsAsFactors=TRUE,na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#Subset data to the necessary data, only from dates 2007-02-01 and 2007-02-02

data<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")

#Convert column Date to Date

data$Date<-as.Date(data$Date,"%d/%m/%Y")

#Create a new column with timestamp merging Date and Time columns

data <- transform(data, completedate=as.POSIXct(paste(Date, Time)))

#Create the graphic

plot(data$completedate,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#Copy to device PNG

dev.copy(png, file="plot2.png", height=480, width=480)

#Close the device
dev.off()
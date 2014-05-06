#load data (2 days only)
hh<-read.table("household_power_consumption.txt",header=FALSE,sep=';',na.strings=c('?'),skip=66637,nrows=69518-66638)
hh$datetime<-strptime(paste(hh[,1],hh[,2]),format="%d/%m/%Y %H:%M:%S")

#open GD
png('plot4.png', width = 480, height = 480, units = "px")
#set 2*2 layout
par(mfrow=c(2,2))	

#upper left
plot(hh$datetime,hh[,3],main="",type="l",ylab="Global Active Power",xlab="") 

#upper right
plot(hh$datetime,hh[,5],main="",type="l",ylab="Voltage",xlab="datetime") 

#lower left
plot(hh$datetime,hh[,7],main="",type="n",ylab="Energy sub metering",xlab="")
points(hh$datetime,hh[,7],type="l",col="black")
points(hh$datetime,hh[,8],type="l",col="red")
points(hh$datetime,hh[,9],type="l",col="blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty="solid")

#lower right
plot(hh$datetime,hh[,4],main="",type="l",ylab="Global_reactive_power",xlab="datetime") 

dev.off()
browseURL('plot4.png')
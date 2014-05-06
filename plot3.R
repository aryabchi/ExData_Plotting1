#load data (2 days only)
hh<-read.table("household_power_consumption.txt",header=FALSE,sep=';',na.strings=c('?'),skip=66637,nrows=69518-66638)
hh$ts<-strptime(paste(hh[,1],hh[,2]),format="%d/%m/%Y %H:%M:%S")

#open GD
png('plot3.png', width = 480, height = 480, units = "px")

plot(hh$ts,hh[,7],main="",type="n",ylab="Energy sub metering",xlab="")
points(hh$ts,hh[,7],type="l",col="black")
points(hh$ts,hh[,8],type="l",col="red")
points(hh$ts,hh[,9],type="l",col="blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty="solid")
dev.off()
browseURL('plot3.png')
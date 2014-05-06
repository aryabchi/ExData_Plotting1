#load data (2 days only)
hh<-read.table("household_power_consumption.txt",header=FALSE,sep=';',na.strings='?',skip=66637,nrows=69518-66638)
hh$ts<-strptime(paste(hh[,1],hh[,2]),format="%d/%m/%Y %H:%M:%S")

#plot onto GD
png('plot2.png', width = 480, height = 480, units = "px")
plot(hh$ts,hh[,3],main="",type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
browseURL('plot2.png')





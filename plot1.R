#load data (2 days only)
hh<-read.table("household_power_consumption.txt",header=FALSE,sep=';',na.strings='?',skip=66637,nrows=69518-66638)
hh[,1]<-as.Date(hh[,1],format="%d/%m/%Y")

#plot onto GD
png('plot1.png', width = 480, height = 480, units = "px")
hist(hh[,3],col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
browseURL('plot1.png')





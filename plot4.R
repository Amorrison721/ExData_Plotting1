#Read in data

HPC <- read.csv("E:/Coursera/Visualization/Household_power_consumption_Project1.txt",stringsAsFactors=F)

#Concatenate Date and Time columns and format as POSIX

HPC<-transform(HPC, DateTime=paste(Date, Time, sep=' '))
HPC$DateTime<-strptime(as.character(HPC$DateTime),format="%d/%m/%Y %T") 

#plot x-y graph

png('plot4.png',width = 480, height = 480)
par(mfrow=c(2,2))
with(HPC,{
  plot(HPC$DateTime,HPC$Global_active_power,ylab="Global Active Power",xlab="",type="n")
lines(HPC$DateTime,HPC$Global_active_power)
  plot(HPC$DateTime,HPC$Voltage,xlab="datetime",ylab="Voltage",type="n")
lines(HPC$DateTime,HPC$Voltage)
  plot(HPC$DateTime,HPC$Sub_metering_1,ylab="Energy Sub metering",xlab="",type="n")
lines(HPC$DateTime,HPC$Sub_metering_1,col="grey40")
lines(HPC$DateTime,HPC$Sub_metering_2,col="red")
lines(HPC$DateTime,HPC$Sub_metering_3,col="blue")
legend("topright",bty="n",lwd=1,col=c("grey40","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(HPC$DateTime,HPC$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="n")
lines(HPC$DateTime,HPC$Global_reactive_power)})

dev.off()
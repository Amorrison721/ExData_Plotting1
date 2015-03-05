#Read in data

HPC <- read.csv("E:/Coursera/Visualization/Household_power_consumption_Project1.txt",stringsAsFactors=F)

#Concatenate Date and Time columns and format as POSIX

HPC<-transform(HPC, DateTime=paste(Date, Time, sep=' '))
HPC$DateTime<-strptime(as.character(HPC$DateTime),format="%d/%m/%Y %T") 

#plot x-y graph

png('plot2.png',width = 480, height = 480)
plot2<-plot(HPC$DateTime,HPC$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="n")
plot2<-lines(HPC$DateTime,HPC$Global_active_power)

dev.off()
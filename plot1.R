#Read in data

HPC <- read.csv("E:/Coursera/Visualization/Household_power_consumption_Project1.txt",stringsAsFactors=F)

#Concatenate Date and Time columns and format as POSIX

HPC<-transform(HPC, DateTime=paste(Date, Time, sep=' '))
HPC$DateTime<-strptime(as.character(HPC$DateTime),format="%d/%m/%Y %T") 

#plot histogram

png('plot1.png',width = 480, height = 480)
plot1<-hist(HPC$Global_active_power,col='red',main="Global Active Power",xlab="Global Active Power (kilowatts)")


dev.off()

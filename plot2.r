setwd("C:/Users/Tian/Desktop/R 01092014")
dataall<-read.csv("household_power_consumption.csv",
                  sep=";", 
                  dec=".",
                  stringsAsFactors = FALSE, 
                  header=TRUE)

data1<-subset(dataall,Date=="1/2/2007")
data2<-subset(dataall,Date=="2/2/2007")
data<-rbind(data1,data2)

Global_active_power<-as.numeric(data$Global_active_power)
Date<-as.Date(data$Date,format="%d/%m/%y")
Time<-paste(Date, data$Time, sep=" ")
Time<-strptime(Time, format="%Y-%m-%d %H:%M:%S")
Time<-as.numeric(Time)
a<-min(Time)
b<-max(Time)
c=(a+b)/2

png(filename = "plot2.png",width = 480, height = 480) 
plot(Time,Global_active_power,
     xlim=c(a,b),
     ylab="Global Active Power (kilowatts)",
     xlab="",
     xaxt="n",
     pch=".",
     type="o"
     )
axis(side=1,at=c(a,c,b),labels=c("Thu","Fri","Sat"))
dev.off()




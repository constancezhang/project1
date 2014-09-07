setwd("C:/Users/Tian/Desktop/R 01092014")
dataall<-read.csv("household_power_consumption.csv",
                  sep=";", 
                  dec=".",
                  stringsAsFactors = FALSE, 
                  header=TRUE)

data1<-subset(dataall,Date=="1/2/2007")
data2<-subset(dataall,Date=="2/2/2007")
data<-rbind(data1,data2)

Sub1<-as.numeric(data$Sub_metering_1)
Sub2<-as.numeric(data$Sub_metering_2)
Sub3<-as.numeric(data$Sub_metering_3)

Date<-as.Date(data$Date,format="%d/%m/%y")
Time<-paste(Date, data$Time, sep=" ")
Time<-strptime(Time, format="%Y-%m-%d %H:%M:%S")
Time<-as.numeric(Time)

matrix<-cbind(Sub1, Sub2, Sub3)
 
a<-min(Time)
b<-max(Time)
c=(a+b)/2

png(filename = "plot4.png",width = 480, height = 480)

par(mfrow=c(2,2))

Global_active_power<-as.numeric(data$Global_active_power)
hist(Global_active_power,col="red", 
      main="Global Active Power", 
      xlab="Global Active Power (kilowatts)", 
      xaxt="n")
axis(side=1, at=seq(0,6,by=2),labels=c("0","2","4","6"))


Voltage<-data$Voltage 
plot(Time,Voltage,
        type ="o",
        pch=".",
        xlim=c(a,b),
        ylim=c(234,246),
        ylab="Voltage",
        xlab="",
        xaxt="n",
        yaxt="n",
        lty=1)
axis(side=1,at=c(a,c,b),labels=c("Thu","Fri","Sat"))
axis(side=2,at=seq(234,246,by=2),labels=c(234,"",238,"",242,"",246))


matplot(Time,matrix,
        type ="o",
        pch=".",
        col = c(1,2,4),
        xlim=c(a,b),
        ylab="Energy sub metering",
        xlab="",
        xaxt="n",
        lty=1)
axis(side=1,at=c(a,c,b),labels=c("Thu","Fri","Sat"))
legend("topright", 
       legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c(1,2,4), lty=c(1,1,1), text.font=0.5)


Global_reactive_power<-as.numeric(data$Global_reactive_power)
plot(Time,Global_reactive_power,
        type ="o",
        pch=".",
        xlim=c(a,b),
        ylab="Global_reactive_power",
        xlab="datetime",
        xaxt="n",
        lty=1)
axis(side=1,at=c(a,c,b),labels=c("Thu","Fri","Sat"))
axis(side=2,at=seq(0,0.5,by=0.1),labels=seq(0,0.5,by=0.1))


dev.off()






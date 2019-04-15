


# plot4 plots sub metering vs time to a png file
plot4<-function()
{
  # get data
  power_data<-getData()
  
  # set up four graphs
  par(mfrow=c(2,2))
  
  # make plot 1
  with(power_data, plot(Combined,Global_active_power,
                        ylab="Global Active Power",
                        xlab="",type="l"))
  
  # make plot 2
  with(power_data, plot(Combined,Voltage,
                        ylab="Voltage",
                        xlab="datetime",type="l"))
  
  # make plot 3
  with(power_data, plot(Combined,Sub_metering_1,
                        ylab="Energy sub metering",
                        xlab="",type="l"))
  
  lines(power_data$Combined,power_data$Sub_metering_2,type="l",col="red")
  lines(power_data$Combined,power_data$Sub_metering_3,type="l",col="blue")
  
  # add legend to plot3
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lty=c(1,1,1),col=c("black","red","blue"),bty="n")
  
  # make plot 4
  with(power_data, plot(Combined,Global_reactive_power,
                        ylab="Global_reactive_power",
                        xlab="datetime",type="l"))
  
  # copy to png file
  dev.copy(png,file="plot4.png",width=480,height=480)
  dev.off()
  
}



# Utility function to get data from 
#  household_power_consumption.txt and select dates
getData<-function()
{
  
  power_data<-read.delim("household_power_consumption.txt",
                         header=TRUE,sep = ";",dec = ".",
                         na.strings="?")
  
  power_data$Date<-as.Date(power_data$Date,format("%d/%m/%Y"))
  
  date1<-as.Date("2007/02/01")
  date2<-as.Date("2007/02/02")
  
  power_data<-subset(power_data,Date>=date1)
  power_data<-subset(power_data,Date<=date2)
  
  power_data$Combined<-paste(power_data$Date, power_data$Time)
  power_data$Combined<-strptime(power_data$Combined, "%Y-%m-%d %H:%M:%S")
  
  #print(head(power_data))
  #print(tail(power_data))
  
  power_data
  
}


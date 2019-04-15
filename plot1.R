


# plot1 plots a histogram of global active data to a png file
plot1<-function()
{
  # get data
  power_data<-getData()
  
  # make plot
  hist(power_data$Global_active_power,
       xlab="Global Active Power (kilowatts)",
       main="Global Active Power",col="red")

  # copy to png file
  dev.copy(png,file="plot1.png",width=480,height=480)
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
  
  #print(head(power_data))
  #print(tail(power_data))
  
  power_data
  
}


plot2<-function(){
  
  # Sources plot1.R file
  # Calls function Retrievedata() within plot1.R file
  source('~/Desktop/Coursera/EDA-Project1/plot1.R')
  Retrievedata()
  
  # Plot nb 2 and customize the axis as per screen shot provided
  # Concatenate date and hours
  df$Time2<-as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")
  df2<-cbind(df$Time2,df$Global_active_power)
  plot(df2,type="l",xlab="",ylab="Global Active Power (kilowatts)",xaxt="n")
  axis(1,at=c(df$Time2[1],df$Time2[1444],df$Time2[2880]),labels=c("Thu","Fri","Sat"))
  axis(2,at=seq(0,6,by=2))
  
  # Copy the graph on the screen into a png file with the required dimensions
  # Calls off the graphical engine
  dev.copy(png,file="plot2.png",width=480,height=480)
  dev.off()
    
}

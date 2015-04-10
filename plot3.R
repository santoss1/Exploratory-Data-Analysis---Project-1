plot3<-function(legendboxline=""){
  
  # Sources plot1.R file
  # Calls function Retrievedata() within plot1.R file
  source('~/Desktop/Coursera/EDA-Project1/plot1.R')
  Retrievedata()
  
  # Plot nb 3 and customize the axis as per screen shot provided
  # Set up the legend as per screen shot provided 
  # Passes the parameter "bty" which commands the legend contour box
  # as an argument to the plot3() function
  # The plot3() function has a default "" for bty: by default the contour 
  # line exists unless called otherwise (like by plot4()) 
  # Establishes the tick marks and labels at the required place for weekdays
  df$Time2<-as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")
  df3<-cbind(df$Time2,df$Sub_metering_1)
  plot(df3,type="l",ylab="Energy sub metering",xlab="",xaxt="n")
  lines(df$Time2,df$Sub_metering_2,col="red")
  lines(df$Time2,df$Sub_metering_3,col="blue")
  legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","red","blue"), lwd=c(1,1,1), lty=c(1,1,1),merge=FALSE,
         bty=legendboxline)
  axis(1,at=c(df$Time2[1],df$Time2[1444],df$Time2[2880]),labels=c("Thu","Fri","Sat"))
  axis(2,at=seq(0,30,by=10))
  
  # Copy the graph on the screen into a png file with the required dimensions
  # Calls off the graphical engine
  dev.copy(png,file="plot3.png",width=480,height=480)
  dev.off()
  
}
  
  

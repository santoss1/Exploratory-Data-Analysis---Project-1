plot4<-function(){
  
  # Sources plot1.R file
  # Calls function Retrievedata() within plot1.R file
  source('~/Desktop/Coursera/EDA-Project1/plot1.R')
  Retrievedata()
  
  # Plot nb 4 and customize the axis as per screen shot provided
  # Defines the 4 boxes for the 4 graphs
  # Defines the margins - spacing is higher below the graphs and 
  # on the left handside for more readibility
  par(mfcol=c(2,2),mar=c(5,5,2,1))
  
  # Sources and populates upper left quandrant with plot2() graph
  source('~/Desktop/Coursera/EDA-Project1/plot2.R')
  plot2()
  
  # Sources and populates lower left quandrant with plot3() graph
  # Passes the argument "n" to render the contour of the legend 
  # invisible (bty argument of legend within plot3())
  source('~/Desktop/Coursera/EDA-Project1/plot3.R')
  plot3("n")
  
  # Defines the upper right graph with customized axis as per the 
  # screen shot provided
  # Establishes the tick marks and labels at the required place for weekdays
  df4<-cbind(df$Time2,df$Voltage)
  plot(df4,type="l",xlab="datetime",ylab="Voltage",ylim=range(234:246),xaxt="n")
  axis(1,at=c(df$Time2[1],df$Time2[1440],df$Time2[2880]),labels=c("Thu","Fri","Sat"))
  
  # Defines the lower right graph with customized axis as per the 
  # screen shot provided
  # Establishes the tick marks and labels at the required place for weekdays
  df5<-cbind(df$Time2,df$Global_reactive_power)
  plot(df5,type="l",xlab="datetime",ylab="Global_reactive_power",xaxt="n")
  axis(1,at=c(df$Time2[1],df$Time2[1440],df$Time2[2880]),labels=c("Thu","Fri","Sat"))
  axis(2,t=seq(0.0,0.5,by=0.1))
  
  # Copy the graph on the screen into a png file with the required dimensions
  # Calls off the graphical engine
  dev.copy(png,file="plot4.png",width=480,height=480)
  dev.off()
  
}
  

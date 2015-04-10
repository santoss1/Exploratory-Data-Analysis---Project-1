Retrievedata<-function(){
  
  # Download file and unzip content 
  # Assumes Coursera directory creates under Desktop 
  # Assumes EDA-Project1 created under Coursera
  file<-"http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  workpath<-"~/Desktop/Coursera/EDA-Project1/"
  setwd(workpath)
  download.file(file,destfile="~/Desktop/Coursera/EDA-Project1/Project1.zip")
  unzip("Project1.zip", exdir=workpath, overwrite=TRUE)
  
  # Read content unto df variable of class dataframe
  # Convert Date from character to Date with format dd/mm/yyyy
  # Subset df dataframe to the time interval asked for  
  df<-read.csv("household_power_consumption.txt", header=TRUE,sep = ";",
                 na.strings=c("?"),stringsAsFactors=FALSE)
  df$Date<-as.Date(strptime(df$Date,"%d/%m/%Y"))
  df<-subset(df,Date >= as.Date("2007-02-01"))
  df<-subset(df,Date <= as.Date("2007-02-02"))
  
}


plot1<-function(){
  
  # Sources plot1.R file
  # Calls function Retrievedata() above
  source('~/Desktop/Coursera/EDA-Project1/plot1.R')
  Retrievedata()
  
  # Plot nb 1 and customize the axis as per screen shot provided
  hist(df$Global_active_power,xlab="Global Active Power (kilowatts)",
       ylab="Frequency",main="Global Active Power", 
       col="red", axes=FALSE)
  axis(2,at=seq(0,1200,by=200))
  axis(1,at=seq(0,6,by=2))
  
  # Copy the graph on the screen into a png file with the required dimensions
  # Calls off the graphical engine
  dev.copy(png,file="plot1.png",width=480,height=480)
  dev.off()
  
}

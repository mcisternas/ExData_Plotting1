#Read data set into data frame
df = read.csv("household_power_consumption.txt", sep=";", as.is=TRUE)

#Subset the dates we are interested in
df2<-subset(df,Date=="1/2/2007" | Date=="2/2/2007")

#Create a new date column, combining the date and time columns
df2$newdate <- with(df2, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M"))

#Create the plot in a png device
png(file="plot4.png", width=480, height=480)

#Set a 2x2 layout
par(mfrow = c(2,2))

with(df2, {
   plot(Global_active_power ~ newdate, type="l", 
        xlab="", ylab="Global Active Power")
        
   plot(Voltage ~ newdate, type="l", 
        xlab="datetime", ylab="Voltage")
        
   plot(Sub_metering_1 ~ df2$newdate, type="l", col="black",
       xlab="", ylab="Energy sub metering")
   lines(Sub_metering_2 ~ newdate, type="l", col="red")
   lines(Sub_metering_3 ~ newdate, type="l", col="blue")
   legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), 
      legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))  
  
   plot(Global_reactive_power ~ newdate, type="l", 
        xlab="datetime", ylab="Global_reactive_power")        
})
   
dev.off()
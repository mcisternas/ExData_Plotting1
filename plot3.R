#Read data set into data frame
df = read.csv("household_power_consumption.txt", sep=";", as.is=TRUE)

#Subset the dates we are interested in
df2<-subset(df,Date=="1/2/2007" | Date=="2/2/2007")

#Create a new date column, combining the date and time columns
df2$newdate <- with(df2, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M"))

png(file="plot3.png", width=480, height=480)

#Create the plot in a png device
plot(df2$Sub_metering_1 ~ df2$newdate, type="l", col="black",
     xlab="", ylab="Energy sub metering")

lines(df2$Sub_metering_2 ~ df2$newdate, type="l", col="red")
lines(df2$Sub_metering_3 ~ df2$newdate, type="l", col="blue")

#Add legend
legend("topright", lty=1, col = c("black", "red", "blue"), 
      legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))     
dev.off()
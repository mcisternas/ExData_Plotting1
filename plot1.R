
df = read.csv("household_power_consumption.txt", sep=";", as.is=TRUE)

df2<-subset(df,Date=="1/2/2007" | Date=="2/2/2007")

png(file="plot1.png", width=480, height=480)
hist(as.numeric(df2$Global_active_power), col="red", breaks=12, 
      main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

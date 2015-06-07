df = read.csv("household_power_consumption.txt", sep=";", as.is=TRUE)

df2<-subset(df,Date=="1/2/2007" | Date=="2/2/2007")

df2$newdate <- with(df2, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M"))

png(file="plot2.png", width=480, height=480)

plot(df2$Global_active_power ~ df2$newdate, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
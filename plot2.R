#Read data set into data frame
df = read.csv("household_power_consumption.txt", sep=";", as.is=TRUE)

#Subset the dates we are interested in
df2<-subset(df,Date=="1/2/2007" | Date=="2/2/2007")

#Create a new date column, combining the date and time columns
df2$newdate <- with(df2, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M"))

#Create the plot in a png device
png(file="plot2.png", width=480, height=480)

plot(df2$Global_active_power ~ df2$newdate, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
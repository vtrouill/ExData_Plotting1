#Load data to use
powerConsumption<-loadAndCleanData()

#Open device 
# png 480 px x 480 px
png(filename = "plot1.png", width = 480, height = 480, units = 'px' )

#4 graphs to do

# prepare the number of graph 4 to do
par(mfrow=(c(2,2)))

#graph 1 (the same as plot2.R)
with(powerconsumption,plot(DateTime, Global_active_power, xlab="", ylab = "Global Active power (kilowatts) ", type="l"))

#graph2 (similar as plot2.R but for Voltage)
with(powerconsumption,plot(DateTime, Voltage, xlab="", type="l"))

#graph3 (the same as plot3.R)
with(powerconsumption,plot(DateTime,Sub_metering_1, xlab = "", ylab = "Energy sub metering", col="black", type="l"))
#plot submetering 2
with(powerconsumption,lines(DateTime,Sub_metering_2, col="red", type="l"))
#plot submetering 3
with(powerconsumption,lines(DateTime,Sub_metering_3, col="blue", type="l"))
#legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = "solid" )

#graph 4 (similar as plot2.R but for global reactive power)
with(powerconsumption,plot(DateTime, Glabal_reactive_power, xlab="", type="l"))


#close device
dev.off()
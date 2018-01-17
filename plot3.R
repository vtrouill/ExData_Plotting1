#Load data to use
powerConsumption<-loadAndCleanData()

#Open device 
# png 480 px x 480 px
png(filename = "plot1.png", width = 480, height = 480, units = 'px' )

#plot submetering 1
with(powerconsumption,plot(DateTime,Sub_metering_1, xlab = "", ylab = "Energy sub metering", col="black", type="l"))
#plot submetering 2
with(powerconsumption,lines(DateTime,Sub_metering_2, col="red", type="l"))
#plot submetering 3
with(powerconsumption,lines(DateTime,Sub_metering_3, col="blue", type="l"))
#legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = "solid" )
#close device
dev.off()
#Load data to use
powerConsumption<-loadAndCleanData()

#Open device 
# png 480 px x 480 px
png(filename = "plot1.png", width = 480, height = 480, units = 'px' )

# courb of the global active power

with(powerconsumption,plot(DateTime, Global_active_power, xlab="", ylab = "Global Active power (kilowatts) ", type="l"))

#close device
dev.off()
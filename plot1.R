#Load data to use
powerConsumption<-loadAndCleanData()

#Open device 
# png 480 px x 480 px
png(filename = "plot1.png", width = 480, height = 480, units = 'px' )

#histogram of Global active power in red

with(powerconsumption,hist(Global_active_power, main = "Global Active Power", xlab = "Global Active power (kilowatts) ", ylab = "Frequency", col="red"))

#close device
dev.off()
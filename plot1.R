#downLoad data to use if necessary
if (!file.exists('./household_power_consumption.txt')) {
     download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","data.zip")
     unzip("data.zip")
}

# get data and clean
fileName<-"./household_power_consumption.txt"
colName<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
powerConsumption<- read.table(text = grep("^[1,2]/2/2007",readLines(fileName),value=TRUE), sep = ';', na.strings = '?',col.names = colName)

#Open device 
# png 480 px x 480 px
png(filename = "plot1.png", width = 480, height = 480, units = 'px' )

#histogram of Global active power in red

with(powerConsumption,hist(Global_active_power, main = "Global Active Power", xlab = "Global Active power (kilowatts) ", ylab = "Frequency", col="red"))

#close device
dev.off()
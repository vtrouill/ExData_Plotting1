#downLoad data to use if necessary
if (!file.exists('./household_power_consumption.txt')) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","data.zip")
  unzip("data.zip")
}

# get data and clean
fileName<-"./household_power_consumption.txt"
colName<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
PowerConso<- read.table(text = grep("^[1,2]/2/2007",readLines(fileName),value=TRUE), sep = ';', na.strings = '?',col.names = colName)

# paste Date and Time and add it as DateTime in PowerConso
PowerConso$DateTime<-strptime(paste(PowerConso$Date,PowerConso$Time),format="%d/%m/%Y %H:%M:%S")

# set time for english
Sys.setlocale(category = "LC_ALL", locale = "english")

#Open device 
# png 480 px x 480 px
png(filename = "plot3.png", width = 480, height = 480, units = 'px' )

#plot submetering 1
with(PowerConso,plot(DateTime,Sub_metering_1, xlab = "", ylab = "Energy sub metering", col="black", type="l"))
#plot submetering 2
with(PowerConso,lines(DateTime,Sub_metering_2, col="red", type="l"))
#plot submetering 3
with(PowerConso,lines(DateTime,Sub_metering_3, col="blue", type="l"))
#legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = "solid" )
#close device
dev.off()
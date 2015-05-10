# Clearing the working environment
rm(list = ls())

# Downloading zipped file from the link
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
# Unzipping the file.
tmp<-unz("household_power_consumption.zip", "household_power_consumption.txt")
#reading the file to a data.frame
data<-read.csv2(tmp, header=T, dec=".", colClasses=c("factor", "factor", rep("numeric",7)), nrows=2075259, comment.char ="", na.strings="?")
# subsetting the file for a necessary two-days.
ndata<-subset(data, (Date =="1/2/2007" | Date == "2/2/2007")) 
# vector with a data-time class from Date and Time columns
datetime<-as.POSIXlt(paste(ndata$Date, ndata$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")


# Plot 4.
png(file="plot4.png")
par(mar=c(5,4,4,1), mfrow=c(2,2))
with (ndata, plot(datetime, Global_active_power, ylab="Global Active Power", type="l"))
with (ndata, plot(datetime, Voltage, type="l"))
with (ndata, plot(datetime, Sub_metering_1, type="l", col="black", xlab=NULL, ylab="Energy sub metering"))
with (ndata, lines(datetime, Sub_metering_2, col="blue"))
with (ndata, lines(datetime, Sub_metering_3, col="red"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black", "blue", "red"))
with(ndata, plot(datetime, Global_reactive_power, type="l"))
dev.off()
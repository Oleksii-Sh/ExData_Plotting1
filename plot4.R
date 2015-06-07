## Downloading the zipped file from the link. Then unzipping.
## May take a while!

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              "household_power_consumption.zip")
unzip("household_power_consumption.zip")

## Reading annd subsetting the data frame.

data1<-read.csv2("household_power_consumption.txt", header=T, dec=".", 
                 colClasses=c("factor", "factor", rep("numeric",7)), 
                 nrows=2075259, comment.char ="", na.strings="?")
ndata<-subset(data, (Date =="1/2/2007" | Date == "2/2/2007")) 

## a vector with a data-time class from Date and Time columns

datetime<-as.POSIXlt(paste(ndata$Date, ndata$Time, sep=" "), 
                     format="%d/%m/%Y %H:%M:%S")



## Plot 4.
png(file="plot4.png")
par(mar=c(5,4,4,1), mfrow=c(2,2))
with (ndata, plot(datetime, Global_active_power, 
                  ylab="Global Active Power", xlab="", type="l"))
with (ndata, plot(datetime, Voltage, type="l"))
with (ndata, plot(datetime, Sub_metering_1, 
                  type="l", col="black", xlab="", 
                  ylab="Energy sub metering"))
with (ndata, lines(datetime, Sub_metering_2, col="red"))
with (ndata, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1", 
                            "Sub_metering_2", "Sub_metering_3"), 
       bty="n", lwd=1, col=c("black", "red", "blue"))
with(ndata, plot(datetime, Global_reactive_power, type="l"))
dev.off()
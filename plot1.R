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

# Plot 1.
png(file="plot1.png")
with(ndata, hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()
# save and unzip to working directory the source file: 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
df = read.delim('household_power_consumption.txt', sep=';')
mask = df['Date']=='1/2/2007' | df['Date']=='2/2/2007'
ds = df[mask,]
ds[ds=='?'] = NA
na.omit(ds)
# install.packages('plyr')
library(plyr)
dp = mutate(ds, DateTime=paste(Date, Time))
dts = strptime(dp$DateTime, '%e/%m/%Y %H:%M:%S')
gap = as.numeric(as.character(dsWeekday$Global_active_power))
png(filename='plot3.png',width=480,height=480)
plot(dts,as.numeric(as.character(dp$Sub_metering_1)),'l',xlab='',ylab='Energy sub metering')
lines(dts,as.numeric(as.character(dp$Sub_metering_2)),'l',col='red')
lines(dts,as.numeric(as.character(dp$Sub_metering_3)),'l',col='blue')
legend('topright', pch='_', col=c('black','blue','red'), legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()

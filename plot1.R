# save and unzip to working directory the source file: 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
df = read.delim('household_power_consumption.txt', sep=';')
mask = df['Date']=='1/2/2007' | df['Date']=='2/2/2007'
ds = df[mask,]
ds[ds=='?'] = NA
na.omit(ds)
png(filename='plot1.png',width=480,height=480)
hist(as.numeric(as.character(ds$Global_active_power)),col='red',main='Global active power',xlab='Global active power (kilowatts)')
dev.off()

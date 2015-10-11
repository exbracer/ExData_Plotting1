library(data.table)
plot4 <- function() {
    data <- read.table("../household_power_consumption.txt", sep=";", header = TRUE, na.strings="?", stringsAsFactors = FALSE)
    data$Date <- as.Date(data$Date, format="%d/%m/%Y")
    
    sub_data <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))
    sub_data$Datetime <- as.POSIXct(paste(as.Date(sub_data$Date), sub_data$Time))
    #head(sub_data)
    
    #hist(sub_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")
    #plot(sub_data$Global_active_power~sub_data$Datetime, type="l", xlab = "", ylab="Global Active Power (kilowatts)")
    
    png(filename='plot4.png', width=480, height=480, units='px')
    par(mfrow=c(2, 2))
    
    plot(sub_data$Global_active_power~sub_data$Datetime, type="l", xlab = "", ylab="Global Active Power (kilowatts)")
    
    plot(sub_data$Voltage~sub_data$Datetime, type="l", xlab = "datetime", ylab="Voltage")
    
    plot(sub_data$Sub_metering_1~sub_data$Datetime, type="l", xlab = "", ylab = "Energy sub metering")
    lines(sub_data$Sub_metering_2~sub_data$Datetime, col="red")
    lines(sub_data$Sub_metering_3~sub_data$Datetime, col="blue")
    
    legend("topright", col=c('black', 'red', 'blue'), lty='solid', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
    
    plot(sub_data$Global_reactive_power~sub_data$Datetime, type='l', xlab='datatime', ylab="Global Reactive Power (kilowatts)")
    
    #dev.copy(png, file="plot2.png", height=480, width=480)
    dev.off()
}
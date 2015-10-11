library(data.table)
plot2 <- function() {
    data <- read.table("../household_power_consumption.txt", sep=";", header = TRUE, na.strings="?", stringsAsFactors = FALSE)
    data$Date <- as.Date(data$Date, format="%d/%m/%Y")
    
    sub_data <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))
    sub_data$Datetime <- as.POSIXct(paste(as.Date(sub_data$Date), sub_data$Time))
    #head(sub_data)
    
    #hist(sub_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")
    plot(sub_data$Global_active_power~sub_data$Datetime, type="l", xlab = "", ylab="Global Active Power (kilowatts)")
    dev.copy(png, file="plot2.png", height=480, width=480)
    dev.off()
}
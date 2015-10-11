library(data.table)
plot1 <- function() {
    data <- read.table("../household_power_consumption.txt", sep=";", header = TRUE, na.strings="?")
    data$Date <- as.Date(data$Date, format="%d/%m/%Y")
    
    sub_data <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))
    #head(sub_data)
    
    hist(sub_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")
    dev.copy(png, file="plot1.png", height=480, width=480)
    dev.off()
}
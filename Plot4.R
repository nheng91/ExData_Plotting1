##Run read_file.R to make sure assignment_data is available to create the graphs.  Skip below if it is already in your
##global environment

source("read_file.R")

##Make sure both the dplyr and lubridate packages are installed and loaded to add 'DateTime' as a new variable

assignment_data <- assignment_data %>% mutate(DateTime = ymd_hms(paste(Date,Time)), Voltage = Voltage/1000)

##The below code will create Plot4 as png file in the working directory

par(mfcol = c(2,2))
with(assignment_data, plot(DateTime, Global_active_power, type = "l", 
                           ylab = "Global Active Power", xlab = ""))
with(assignment_data, plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(assignment_data, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
with(assignment_data, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n", cex = .85)
with(assignment_data, plot(DateTime, Voltage, type = "l"))
with(assignment_data, plot(DateTime,Global_reactive_power, type = "l", ylim = c(0,0.5)))
dev.copy(png, file = "Plot4.png")
dev.off()
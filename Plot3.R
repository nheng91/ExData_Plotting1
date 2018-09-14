##Run read_file.R to make sure assignment_data is available to create the graphs.  Skip below if it is already in your
##global environment

source("read_file.R")

##Make sure both the dplyr and lubridate packages are installed and loaded to add 'DateTime' as a new variable

assignment_data <- assignment_data %>% mutate(DateTime = ymd_hms(paste(Date,Time)))

##The below code will create Plot3 as png file in the working directory

with(assignment_data, plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(assignment_data, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
with(assignment_data, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "Plot3.png")
dev.off()
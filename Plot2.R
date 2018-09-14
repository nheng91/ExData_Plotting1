##Run read_file.R to make sure assignment_data is available to create the graphs.  Skip below if it is already in your
##global environment

source("read_file.R")

##Make sure both the dplyr and lubridate packages are installed and loaded to add 'DateTime' as a new variable

assignment_data <- assignment_data %>% mutate(DateTime = ymd_hms(paste(Date,Time)))

##The below code will create Plot2 as png file in the working directory

with(assignment_data, plot(DateTime, Global_active_power, type = "l", 
                           ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.copy(png, file = "Plot2.png")
dev.off()

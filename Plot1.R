##Run read_file.R to make sure assignment_data is available to create the graphs.  Skip below if it is already in your
##global environment

source("read_file.R")

##The below code will create Plot1 as png file in the working directory

hist(as.numeric(assignment_data$Global_active_power), col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylim = c(0,1200))
dev.copy(png, file = "Plot1.png")
dev.off()
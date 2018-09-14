##Save provided assignment file into working directory for project

data <- read_csv2(file = "household_power_consumption.txt")

##Make sure lubridate package is installed and loaded.
data$Date <- dmy(data$Date)
data$Date <- strptime(data$Date)

##Make sure dplyr package is installed and loaded
assignment_data <- data %>% filter(Date == "2007-02-01" | Date == "2007-02-02")
View(assignment_data)